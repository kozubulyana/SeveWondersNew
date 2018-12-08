var pictures = new FormData();
var countNewPictures = 0;

function parseUrl() {
    var query = location.href;
    var pos = query.indexOf("?");
    if (pos == -1) return [];
    query = location.href.substr(pos + 1);

    var result = {};
    query.split("&").forEach(function (part) {
        var item = part.split("=");
        result[item[0]] = decodeURIComponent(item[1]);
    });
    return result;
}

function RoomsTableViewModel() {
    var self = this;
    self.rooms = ko.observableArray([]);
    self.pageIndex = ko.observable(0);
    self.pageSize = ko.observable(10);
    self.dataCount = ko.observable(0);

    self.pageCount = ko.computed(function () {
        return Math.ceil(self.dataCount() / this.pageSize());
    }, self);
    self.indexOfFirst = ko.computed(function () {
        return self.pageIndex() * self.pageSize() + 1;
    }, self);
    self.indexOfLast = ko.computed(function () {
        if (self.pageIndex() + 1 != self.pageCount()) {
            return self.indexOfFirst() + self.pageSize() - 1;
        }
        else {
            return self.dataCount();
        }
        return Math.ceil(self.dataCount() / this.pageSize());
    }, self);

    self.loadTable = function () {
        hotelId = parseUrl().hotel;
        $.ajax("../api/Hotels/GetRooms", {
            type: "get",
            data: {
                pageIndex: self.pageIndex(),
                pageSize: self.pageSize(),
                hotelId: hotelId,
            },
            contentType: "application/json",
            success: function (result) {
                self.rooms(result.rooms);
                self.dataCount(result.dataCount);
            }
        });
    }
    self.loadTable();

    self.previousPage = function () {
        if (self.pageIndex() > 0) {
            self.pageIndex(self.pageIndex() - 1);
            self.loadTable();
        }
    };
    self.nextPage = function () {
        if (self.pageIndex() < self.pageCount() - 1) {
            self.pageIndex(self.pageIndex() + 1);
            self.loadTable();
        }
    };
    self.allPages = ko.dependentObservable(function () {
        var pages = [];
        for (i = 0; i < self.pageCount(); i++) {
            pages.push({ pageNumber: (i + 1) });
        }
        return pages;
    });
    self.moveToPage = function (index) {
        self.pageIndex(index);
        self.loadTable();
    };

    self.idOfDeletedRoom = ko.observable();
    self.showModalDeleteRoom = function (room) {
        self.idOfDeletedRoom(room.Id);
        $('#deleteRoomModal').modal();
    };
    self.deleteRoom = function () {
        var id = self.idOfDeletedRoom();
        $.ajax({
            type: "POST",
            url: '../api/Hotels/DeleteRoom',
            data: JSON.stringify(id),
            contentType: "application/json",
            success: function (result) {
                //check if page is not empty in feature
                self.dataCount(self.dataCount() - 1);
                if (self.pageIndex() + 1 > self.pageCount()) {
                    self.pageIndex(self.pageCount() - 1);
                }
                self.loadTable();
                $('#deleteRoomModal').modal('hide');
            }
        });
    }

    self.showModalAddRoom = function () {
        roomModifyViewModel.addRoom();
    }
    self.showModalEditRoom = function (room) {
        roomModifyViewModel.editRoom(room);
    }
}

var currentSelectTerm;
var saveMultiselectValueInLocalVariable = function (text) {
    currentSelectTerm = text;
};
function RoomModifyViewModel() {
    var self = this;

    self.Id = ko.observable(-1);
    self.CountOfRooms = ko.observable()
        .extend({ required: true, numeric: 2, max: 100  });
    self.MaxPeople = ko.observable()
        .extend({ required: true, numeric: 2, max: 10 });
    self.WindowView = ko.observable()
        .extend({ minLength: 2, maxLength: 50  });
    self.Price = ko.observable()
        .extend({ required: true, numeric: 2, max: 10000 });

    self.HotelId = ko.observable()
        .extend({ required: true});
    self.Hotels = ko.observableArray([]);

    self.RoomPhotos = ko.observableArray([]);
    self.RoomPhotosNew = ko.observableArray([]);
    self.errors = ko.observable();

    self.loadHotels = function () {
        $.ajax("../api/Hotels/GetHotelsForSearch", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.Hotels(result);
            }
        });
        hotelId = parseUrl().hotel;
    }
    self.loadHotels();

    self.updateViewModel = function (room) {
        $(".newPictures").remove();
        countNewPictures = 0;
        pictures = new FormData();
        
        if (room != undefined) {
            self.Id(room.Id);
            self.CountOfRooms(room.CountOfRooms);
            self.MaxPeople(room.MaxPeople);
            self.WindowView(room.WindowView);
            self.Price(room.Price);
            self.HotelId(room.HotelId);
            self.RoomPhotos(room.RoomPhotos);

            $.get('../api/Hotels/GetRoomTypes', { roomId: room.Id },
                function (json) {
                    $("#roomTypes").empty();
                    $('#roomTypes').
                        select2({
                            placeholder: 'Select room type',
                            width: '100%',
                            escapeMarkup: function (m) { return m; },
                            data: [(json).forEach(function (element) {
                                $("#roomTypes").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                            })],
                            language: {
                                noResults: function () {
                                    return '<a class="addItem" onclick="AddRoomType()">Add to List</a>';
                                },
                                searching: function (val) {
                                    saveMultiselectValueInLocalVariable(val.term);
                                    return "Searching...";
                                }
                            }
                        });
                });
            $.get('../api/Hotels/GetEquipments', { roomId: room.Id },
                function (json) {
                    $("#equipments").empty();
                    $('#equipments').
                        select2({
                            placeholder: 'Select equipments',
                            width: '100%',
                            escapeMarkup: function (m) { return m; },
                            data: [(json).forEach(function (element) {
                                $("#equipments").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                            })],
                            language: {
                                noResults: function () {
                                    return '<a class="addItem" onclick="AddEquipment()">Add to List</a>';
                                },
                                searching: function (val) {
                                    saveMultiselectValueInLocalVariable(val.term);
                                    return "Searching...";
                                }
                            }
                        });
                });
        }
        else {
            self.Id(-1);

            hotelId = parseUrl().hotel;
            self.HotelId(hotelId);
            self.CountOfRooms(undefined);
            self.MaxPeople(undefined);
            self.WindowView(undefined);
            self.Price(undefined);

            self.RoomPhotos(undefined);

            $.get('../api/Hotels/GetRoomTypes',
                function (json) {
                    $("#roomTypes").empty();
                    $('#roomTypes').
                        select2({
                            placeholder: 'Select room type',
                            width: '100%',
                            escapeMarkup: function (m) { return m; },
                            data: [(json).forEach(function (element) {
                                $("#roomTypes").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                            })],
                            language: {
                                noResults: function () {
                                    return '<a class="addItem" onclick="AddRoomType()">Add to List</a>';
                                },
                                searching: function (val) {
                                    saveMultiselectValueInLocalVariable(val.term);
                                    return "Searching...";
                                }
                            }
                        });
                });
            $.get('../api/Hotels/GetEquipments',
                function (json) {
                    $("#equipments").empty();
                    $('#equipments').
                        select2({
                            placeholder: 'Select equipments',
                            width: '100%',
                            escapeMarkup: function (m) { return m; },
                            data: [(json).forEach(function (element) {
                                $("#equipments").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                            })],
                            language: {
                                noResults: function () {
                                    return '<a class="addItem" onclick="AddEquipment()">Add to List</a>';
                                },
                                searching: function (val) {
                                    saveMultiselectValueInLocalVariable(val.term);
                                    return "Searching...";
                                }
                            }
                        });
                });
        }

        self.errors = ko.validation.group(self, { deep: true });
        self.errors.showAllMessages(false);
    }

    self.addRoom = function () {
        self.updateViewModel();
        $('#roomModifyViewModel').modal();
    }
    self.editRoom = function (room) {
        self.updateViewModel(room);
        $('#roomModifyViewModel').modal();
    }
    self.saveChanges = function () {
        self.errors = ko.validation.group(self, { deep: true });
        if (self.errors().length === 0) {
            var model = {
                Id: self.Id(),
                HotelId: self.HotelId(),
                RoomType: $('#roomTypes').val(),
                CountOfRooms: self.CountOfRooms(),
                MaxPeople: self.MaxPeople(),
                WindowView: self.WindowView(),
                Price: self.Price(),
                Equipments: $('#equipments').val(),
                RoomPhotos: self.RoomPhotos()
            };
            $.ajax('../api/Hotels/AddRoom', {
                type: "post",
                data: JSON.stringify(model),
                contentType: "application/json",
                success: function (result) {
                    $.ajax({
                        type: "POST",
                        url: '../api/Hotels/AddPhotosForRoom/' + result,
                        contentType: false,
                        processData: false,
                        data: pictures,
                        success: function (result) {
                            roomsTableViewModel.loadTable();
                            $('#roomModifyViewModel').modal('hide');;
                        }
                    });
                }
            });
        }
        else {
            self.errors.showAllMessages(true);
        }
    }

    self.removePhoto = function (item) {
        self.RoomPhotos.remove(item)
    };
}

var roomsTableViewModel = new RoomsTableViewModel();
ko.applyBindings(roomsTableViewModel, document.getElementById("roomsTable"));

var roomModifyViewModel = new RoomModifyViewModel();
ko.applyBindings(roomModifyViewModel, document.getElementById("roomModifyViewModel"));

function AddEquipment() {
    $.ajax({
        url: '../api/Hotels/AddEquipment',
        type: "POST",
        data: JSON.stringify(currentSelectTerm),
        contentType: "application/json",
        success: function (data) {
            var option = new Option(data.Name, data.Id);
            option.selected = true;
            $("#equipments").append(option);
            $("#equipments").trigger("change");
            $("#equipments").select2("close");
        }
    });
}

function AddRoomType() {
    $.ajax({
        url: '../api/Hotels/AddRoomType',
        type: "POST",
        data: JSON.stringify(currentSelectTerm),
        contentType: "application/json",
        success: function (data) {
            var option = new Option(data.Name, data.Id);
            option.selected = true;
            $("#roomTypes").append(option);
            $("#roomTypes").trigger("change");
            $("#roomTypes").select2("close");
        }
    });
}

$("document").ready(function () {
    $("#loadImages").change(function (evt) {
        countNewPicturesOld = countNewPictures;
        for (var i = 0, f; f = evt.target.files[i]; i++) {
            var reader = new FileReader();
            reader.onload = (function (theFile) {
                return function (e) {
                    var div = document.createElement('div');
                    var imgLoadEdit = document.createElement('img');
                    div.setAttribute("data-id", countNewPictures + 0);
                    div.setAttribute("style", "width:170px; margin-top:1%; margin-right:1%;");
                    div.setAttribute("class", "pull-left img-wrap newPictures");
                    imgLoadEdit.setAttribute("class", "img-rounded img-responsive");
                    imgLoadEdit.setAttribute("src", e.target.result);
                    imgLoadEdit.setAttribute("title", escape(theFile.name));
                    imgLoadEdit.setAttribute("style", "width:170px; height: 105px; margin-top:1%; margin-right:1%;");

                    var span = document.createElement('span');
                    span.setAttribute("class", "close");
                    span.innerHTML = "&times;";
                    div.appendChild(span);


                    div.appendChild(imgLoadEdit);
                    document.getElementById("photos").insertBefore(div, null);

                    countNewPictures = countNewPictures + 1;
                };
            })(f);
            reader.readAsDataURL(f);
        }

        //кількість що вже є
        Array.prototype.forEach.call($("#loadImages")[0].files, function (file, i) {
            pictures.append("image" + (countNewPicturesOld + i), file);
        });
    });
    $('#photos').on('click', '.img-wrap .close', function () {
        var id = $(this).parent().data('id');
        pictures.delete("image" + id);
        $(this).parent().remove();
    });
});