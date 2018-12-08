$(document).ready(function () {
    loadManagersTable();

    var date = new Date();
    date.setFullYear(date.getFullYear() - 18);
    date = date.toISOString().split('T')[0];

    document.getElementsByName("DateOfBirth")[0].setAttribute('max', date);
});
function loadManagersTable() {
	 $("#managersTable")
		.on('init.dt', function () {
			$('#managersTable').on('click', '.edit', EditManagerHandler);
		})
		.dataTable({
			"processing": false,
			"destroy": true,
			"serverSide": false,
			"ajax": {
				"url": "../api/Managers/GetManagers",
				"method": "POST",
				"dataSrc": "",
			},
			"createdRow": function (row, item, dataIndex) {
				if (item.IsDeleted == true) {
					$('td', row).eq(5).html('<span style="color: rgb(255, 0, 0);" data-customer-id="' + item.Id + '">Deleted</span>');
				}
				else {
					$('td', row).eq(5).html('<span style="color: rgb(0, 128, 0);" data-customer-id="' + item.Id + '">Active</span>');
				}

				var bits = (item.DateOfBirth).split(/\D/);
				var date = bits[0] + "-" + bits[1] + "-" + bits[2];			
				$('td', row).eq(4).text(date);

				var changeStatusCss = "<button class='btn btn-warning middle-button' onclick='changeStatus(" + item.Id + ")\'> Change status </button>"
				var editCss = '<a data-managerid= "' + item.Id + '" class="btn btn-warning middle-button edit" role="button">Edit</a>';
				$('td', row).eq(6).html(changeStatusCss);
				$('td', row).eq(7).html(editCss);
			},
			"columns": [
				{ "data": "FirstName" }, { "data": "LastName" }, { "data": "PhoneNumber" },
				{ "data": "Email" }, { "data": "DateOfBirth" }, { "data": "IsDeleted" }, { "data": null }, { "data": null }
			],
			"language": {
				"emptyTable": "There are no managers at present.",
				"zeroRecords": "There were no matching managers found."
			},
			"searching": true,
			"ordering": true,
			"paging": true
		});
}

function changeStatus(id) {
	$.ajax({
		type: "POST",
		url: "../api/Managers/ChangeManagerStatus/" + id,
		success: function () {
			var css = '*[data-customer-id="' + id + '"]';
			if ($(css).text() == "Active") {
				$(css).text("Deleted");
				$(css).css("color", "red");
			}
			else {
				$(css).text("Active");
				$(css).css("color", "green");
			}
		}
	});
}

var currentSelectTerm;
var saveMultiselectValueInLocalVariable = function (text) {
	currentSelectTerm = text;
};

function EditManagerHandler(event) {
    event.preventDefault();
    idManager = $(this).data("managerid");

    $.get('../api/Managers/GetManager', { id: idManager },
        function (html) {
            $("#countries").empty();
            $('#countries').
                select2({
                    placeholder: 'Select countries',
                    width: '100%',
                    escapeMarkup: function (m) { return m; },
                    data: [(html.Countries).forEach(function (element) {
                        $("#countries").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
                    })],
                    language: {
                        noResults: function () {
                            return 'No result.';
                        },
                        searching: function (val) {
                            saveMultiselectValueInLocalVariable(val.term);
                            return "Searching...";
                        }
                    }
                });

            managerModifyViewModel.editManager(html);
        });
}

function addManager(event) {
	$.get('../api/Managers/GetCountries',
        function (html) {
			$("#countries").empty();
			$('#countries').
				select2({
                    width: '100%',
					placeholder: 'Select countries',
					escapeMarkup: function (m) { return m; },
					data: [html.forEach(function (element) {
						$("#countries").append($('<option>', { value: element.Id, text: element.Text, selected: element.IsChecked }));
					})],
					language: {
						noResults: function () {
							return 'No result.';
						},
						searching: function (val) {
							saveMultiselectValueInLocalVariable(val.term);
							return "Searching...";
						}
					}
				});
            managerModifyViewModel.addManager();
		});
}

ko.validation.rules['isSame'] = {
    validator: function (val, otherVal) {
        return val === otherVal;
    },
    message: 'Password and repeated password did not match.'
};
ko.validation.rules['isManagerEmailUnique'] = {
    validator: function (email, id) {
        var isValid = true;
        $.ajax({
            async: false,
            url: '../api/Account/IsManagerEmailUnique',
            type: 'Get',
            data: { id: id, email: email },
            success: function (response) {
                isValid = response === true;
            },
            error: function () {
                isValid = false;
            }
        });
        return isValid;
    }
};
ko.validation.init({
    insertMessages: true,
    messagesOnModified: true,
    errorClass: 'validationMessage'
});

function ManagerModifyViewModel() {
    var self = this;
    self.Id = ko.observable(0);
    self.FirstName = ko.observable()
        .extend({ required: true, minLength: 2, maxLength: 30 });
    self.LastName = ko.observable()
        .extend({ required: true, minLength: 2, maxLength: 30 });
    self.DateOfBirth = ko.observable().extend({ required: true });
    self.PhoneNumber = ko.observable().extend({
        required: true, minLength: 5, maxLength: 20,
        pattern: {
            message: 'Incorrect phone number.',
            params: /^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g
        }
    })       
    self.Email = ko.observable().extend({
        required: true, minLength: 5, maxLength: 50,
        pattern: {
            message: 'Incorrect email.',
            params: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g
        },
        isManagerEmailUnique: {
            params: self.Id,
            message: 'Manager email should be unique!'
        }
    })
    self.Password = ko.observable().extend({ required: true, minLength: 6, maxLength: 30 });
    self.PasswordConfirmation = ko.observable()
        .extend({ required: true, minLength: 6, maxLength: 30, isSame: self.Password });

    self.errors = ko.observable();

    self.updateViewModel = function (manager) {
        if (manager != undefined) {
            self.Id(manager.Id);
            self.FirstName(manager.FirstName);
            self.LastName(manager.LastName);

            var bits = (manager.DateOfBirth).split(/\D/);
            var date = bits[0] + "-" + bits[1] + "-" + bits[2];
            self.DateOfBirth(date);
            self.PhoneNumber(manager.PhoneNumber);
            self.Email(manager.Email);
            self.Password(manager.Password);
            self.PasswordConfirmation(manager.Password);
        }
        else {
            self.Id(0);
            self.FirstName(undefined);
            self.LastName(undefined);
            self.DateOfBirth(undefined);
            self.PhoneNumber(undefined);
            self.Email(undefined);
            self.Password(undefined);
            self.PasswordConfirmation(undefined);
        }
        self.errors = ko.validation.group(self, { deep: true });
        self.errors.showAllMessages(false);
    }
    self.addManager = function () {
        self.updateViewModel();
        $('#editManagerModal').modal();
    }
    self.editManager = function (manager) {
        self.updateViewModel(manager);
        $('#editManagerModal').modal();
    }
    self.saveEditing = function () {
        self.errors = ko.validation.group(self, { deep: true });
        if (self.errors().length === 0) {
            var postObject =
                {
                    manager:
                    {
                        Id: self.Id(),
                        FirstName: self.FirstName(),
                        LastName: self.LastName(),
                        DateOfBirth: self.DateOfBirth(),
                        PhoneNumber: self.PhoneNumber(),
                        Email: self.Email(),
                        Password: self.Password()
                    },
                    countries: $('#countries').val()
                };
            $.ajax({
                type: "POST",
                url: "../api/Managers/AddManager",
                data: postObject,
                success: function () {
                    $('#managersTable').DataTable().ajax.reload();
                    $('#editManagerModal').modal('hide');
                }
            });
        }
        else {
            self.errors.showAllMessages(true);
        }
    }
}

var managerModifyViewModel = new ManagerModifyViewModel();
ko.applyBindings(managerModifyViewModel, document.getElementById("editManagerModal"));