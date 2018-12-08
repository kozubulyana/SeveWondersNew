$(function () {
    var date = new Date();
    date.setFullYear(date.getFullYear() - 18);
    date = date.toISOString().split('T')[0];
    
    document.getElementsByName("DateOfBirth")[0].setAttribute('max', date);
});

function register()
{
    var firstName = $('#firstName').val();
    var lastName = $('#lastName').val();
    var dateOfBirth = $('#dateOfBirth').val();
    var phoneNumber = $('#phoneNumber').val();
    var email = $('#email').val();
    var password = $('#password').val();
    var confirmedPassword = $('#confirmPassword').val();

    if (isValid()) {
        $.ajax({
            url: "../api/Account/Register",
            type: "POST",
            data:
                {
                    FirstName: firstName,
                    LastName: lastName,
                    DateOfBirth: dateOfBirth,
                    PhoneNumber: phoneNumber,
                    Email: email,
                    Password: password,
                    ConfirmPassword: confirmedPassword
                },
            success: function () {
                window.location.href = "#/login";
            },
            error: function (err) {
                console.log(getErrors(err.responseJSON));
                $('#serverErrors').show();
                $('#serverErrorsString').html(getErrors(err.responseJSON));
            }
        })
    }
}


ko.validation.rules['isSame'] = {
    validator: function (val, otherVal) {
        return val === otherVal;
    },
    message: 'Password and repeated password did not match.'
};
ko.validation.rules['isCustomerEmailUnique'] = {
    validator: function (email) {
        var isValid = true;
        $.ajax({
            async: false,
            url: '../api/Account/IsManagerEmailUnique',
            type: 'Get',
            data: { id: 21, email: email },
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

function RegistrationViewModel() {
    var self = this;
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
        isCustomerEmailUnique: {
            message: 'Email should be unique!'
        }
    })
    self.Password = ko.observable().extend({ required: true, minLength: 6, maxLength: 30 });
    self.PasswordConfirmation = ko.observable()
        .extend({ required: true, minLength: 6, maxLength: 30, isSame: self.Password });

    self.errors = ko.observable();
    self.Register = function () {
        self.errors = ko.validation.group(self, { deep: true });
        if (self.errors().length === 0) {
            $.ajax({
                url: "../api/Account/Register",
                type: "POST",
                data:
                {
                    FirstName: self.FirstName(),
                    LastName: self.LastName(),
                    DateOfBirth: self.DateOfBirth(),
                    PhoneNumber: self.PhoneNumber(),
                    Email: self.Email(),
                    Password: self.Password(),
                    ConfirmPassword: self.PasswordConfirmation()
                },
                success: function () {
                    window.location.href = "#/login";
                },
                error: function (err) {
                    console.log(getErrors(err.responseJSON));
                }
            })
        }
        else {
            self.errors.showAllMessages(true);
        }
    }
}

var registrationViewModel = new RegistrationViewModel();
ko.applyBindings(registrationViewModel, document.getElementById("registration"));