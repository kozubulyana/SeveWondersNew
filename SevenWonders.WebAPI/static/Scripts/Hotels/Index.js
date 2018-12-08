var pictures = new FormData();
var countNewPictures = 0;

function HotelsTableViewModel() {
    var self = this;
    self.hotels = ko.observableArray([]);
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

    self.Countries = ko.observableArray([]);
    self.selectedChoiceCountry = ko.observable();
    self.loadCountries = function () {
        $.ajax("../api/Countries/GetCountries", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.Countries(result);
            }
        });
    }
    self.loadCountries();

    self.Cities = ko.observableArray([]);
    self.selectedChoiceCity = ko.observable();
    self.loadCities = function () {
        $.ajax("../api/Cities/GetCities", {
            type: "get",
            data: {
                countryId: self.selectedChoiceCountry(),
            },
            contentType: "application/json",
            success: function (result) {
                self.Cities(result);
            }
        });
    }
    self.selectedChoiceCountry.subscribe(function () {
        self.loadCities();
    });

    self.FoodTypes = ko.observableArray([]);
    self.selectedChoiceFoodType = ko.observable();
    self.loadFoodTypes = function () {
        $.ajax("../api/Hotels/GetFoodTypes", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.FoodTypes(result);
            }
        });
    }
    self.loadFoodTypes();

    self.Stars = ko.observableArray([]);
    self.selectedChoiceStars = ko.observable();
    self.loadStars = function () {
        $.ajax("../api/Hotels/GetStars", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.Stars(result);
            }
        });
    }
    self.loadStars();

    self.loadTable = function () {
        var kk = self.selectedChoiceCountry() ;
        $.ajax("../api/Hotels/GetHotels", {
            type: "get",
            data: {
                pageIndex: self.pageIndex(),
                pageSize: self.pageSize(),
                countryId: self.selectedChoiceCountry(),
                cityId: self.selectedChoiceCity(),
                foodTypeId: self.selectedChoiceFoodType(),
                starsId: self.selectedChoiceStars()
            },
            contentType: "application/json",
            success: function (result) {
                self.hotels(result.hotels);
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

    self.search = function () {
        self.loadTable();
    }

    self.idOfDeletedHotel = ko.observable();
    self.showModalDeleteHotel = function (hotel) {
        self.idOfDeletedHotel(hotel.Id);
        $('#deleteHotelModal').modal();
    };
    self.deleteHotel = function () {
        var id = self.idOfDeletedHotel();
        $.ajax({
            type: "POST",
            url: '../api/Hotels/DeleteHotel',
            data: JSON.stringify(id),
            contentType: "application/json",
            success: function (result) {
                //check if page is not empty in feature
                self.dataCount(self.dataCount() - 1);
                if (self.pageIndex() + 1 > self.pageCount()) {
                    self.pageIndex(self.pageCount() - 1);
                }
                self.loadTable();
                $('#deleteHotelModal').modal('hide');
            }
        });
    }

    self.showModalAddHotel = function () {
        hotelModifyViewModel.addHotel();
    }
    self.showModalEditHotel = function (hotel) {
        hotelModifyViewModel.editHotel(hotel);
    }
    self.showModalRooms = function (hotel) {
        var href = "#/rooms?hotel=" + hotel.Id;
        window.location.href = href;
    }
}

var currentSelectTerm;
var saveMultiselectValueInLocalVariable = function (text) {
    currentSelectTerm = text;
};

function HotelModifyViewModel() {
    var self = this;

    self.Id = ko.observable(-1);
    self.Name = ko.observable()
        .extend({ required: true, minLength: 2, maxLength: 50 })
    self.Address = ko.observable()
        .extend({ required: true, minLength: 2, maxLength: 100 });
    self.Description = ko.observable()
        .extend({ required: true, minLength: 2, maxLength: 1000 });
    self.FoodPrice = ko.observable()
        .extend({ required: true, numeric: 2, max: 1000 });

    self.Cities = ko.observableArray([]);
    self.selectedChoiceCity = ko.observable();
    self.loadCities = function () {
        $.ajax("../api/Cities/GetCities", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.Cities(result);
            }
        });
    }
    self.loadCities();

    self.FoodTypes = ko.observableArray([]);
    self.selectedChoiceFoodType = ko.observable()
        .extend({ required: true });
    self.loadFoodTypes = function () {
        $.ajax("../api/Hotels/GetFoodTypes", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.FoodTypes(result);
            }
        });
    }
    self.loadFoodTypes();

    self.Stars = ko.observableArray([]);
    self.selectedChoiceStars = ko.observable()
        .extend({ required: true });
    self.loadStars = function () {
        $.ajax("../api/Hotels/GetStars", {
            type: "get",
            contentType: "application/json",
            success: function (result) {
                self.Stars(result);
            }
        });
    }
    self.loadStars();

    self.HotelPhotos = ko.observableArray([]);
    self.HotelPhotosNew = ko.observableArray([]);
    self.errors = ko.observable();

    self.updateViewModel = function (hotel) {
        $(".newPictures").remove();
        countNewPictures = 0;
        pictures = new FormData();

        if (hotel != undefined) {
            self.Id(hotel.Id);
            self.Name(hotel.Name);
            self.Address(hotel.Address);
            self.Description(hotel.Description);
            self.FoodPrice(hotel.FoodPrice);
            self.selectedChoiceCity(hotel.CityId);
            self.selectedChoiceFoodType(hotel.FoodTypeId);
            self.selectedChoiceStars(hotel.Rating);
            self.HotelPhotos(hotel.HotelPhotos);

            $.get('../api/Hotels/GetFacilities', { hotelId: hotel.Id },
                function (json) {
                    $("#facilities").empty();
                    $('#facilities').
                        select2({
                            placeholder: 'Select facilities',
                            width: '100%',
                            escapeMarkup: function (m) { return m; },
                            data: [(json).forEach(function (element) {
                                $("#facilities").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                            })],
                            language: {
                                noResults: function () {
                                    return '<a class="addItem" onclick="AddFacility()">Add to List</a>';
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
            self.Name(undefined);
            self.Address(undefined);
            self.Description(undefined);
            self.FoodPrice(undefined);
            self.selectedChoiceCity(undefined);
            self.selectedChoiceFoodType(undefined);
            self.selectedChoiceStars(undefined);
            self.HotelPhotos(undefined);

            $.get('../api/Hotels/GetFacilities',
                function (json) {
                    $("#facilities").empty();
                    $('#facilities').
                        select2({
                            placeholder: 'Select facilities',
                            width: '100%',
                            escapeMarkup: function (m) { return m; },
                            data: [(json).forEach(function (element) {
                                $("#facilities").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                            })],
                            language: {
                                noResults: function () {
                                    return '<a class="addItem" onclick="AddFacility()">Add to List</a>';
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

    self.addHotel = function () {
        self.updateViewModel();
        $('#editHotelModal').modal();
    }
    self.editHotel = function (hotel) {
        self.updateViewModel(hotel);
        $('#editHotelModal').modal();
    }
    self.saveChanges = function () {
        self.errors = ko.validation.group(self, { deep: true });
        if (self.errors().length === 0) {
            var model = {
                Id: self.Id(),
                Name: self.Name(),
                Address: self.Address(),
                Description: self.Description(),
                FoodPrice: self.FoodPrice(),
                FoodTypeId: self.selectedChoiceFoodType(),
                CityId: self.selectedChoiceCity(),
                Rating: self.selectedChoiceStars(),
                HotelPhotos: self.HotelPhotos(),
                Facilities: $('#facilities').val(),
            };
            $.ajax('../api/Hotels/AddHotel', {
                type: "post",
                data: JSON.stringify(model),
                contentType: "application/json",
                success: function (result) {

                    $.ajax({
                        type: "POST",
                        url: '../api/Hotels/AddPhotos/' + result,
                        contentType: false,
                        processData: false,
                        data: pictures,
                        success: function (result) {
                            hotelsTableViewModel.loadTable();
                            $('#editHotelModal').modal('hide');;
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
        self.HotelPhotos.remove(item)
    };
}

var hotelsTableViewModel = new HotelsTableViewModel();
ko.applyBindings(hotelsTableViewModel, document.getElementById("hotelsTable"));

var hotelModifyViewModel = new HotelModifyViewModel();
ko.applyBindings(hotelModifyViewModel, document.getElementById("hotelModifyViewModel"));

function AddFacility() {
    $.ajax({
        url: '../api/Hotels/AddFacility',
        type: "POST",
        data: JSON.stringify(currentSelectTerm),
        contentType: "application/json",
        success: function (data) {
            var option = new Option(data.Name, data.Id);
            option.selected = true;
            $("#facilities").append(option);
            $("#facilities").trigger("change");
            $("#facilities").select2("close");
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
                    div.setAttribute("data-id", countNewPictures+0);
                    div.setAttribute("style", "width:170px; margin-top:1%; margin-right:1%;");
                    div.setAttribute("class", "pull-left img-wrap newPictures");
                    imgLoadEdit.setAttribute("class", "img-rounded img-responsive");
                    imgLoadEdit.setAttribute("src", e.target.result);
                    imgLoadEdit.setAttribute("title", escape(theFile.name));
                    imgLoadEdit.setAttribute("style", "width:170px; height: 105px; margin-top:1%; margin-right:1%;");

                    var span = document.createElement('span');
                    span.setAttribute("class", "close");
                    span.innerHTML="&times;";
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