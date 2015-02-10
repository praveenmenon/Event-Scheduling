function validateUserForm() {
	jQuery.validator.addMethod("startsWithCapital", function(value, element) {
		return /^[A-Z][a-zA-Z _0-9]+$/.test( value );
	});
	jQuery.validator.addMethod("noNumbers", function(value, element) {
		return /^[a-zA-Z _]+$/.test( value );
	});

	jQuery.validator.addMethod("email_format", function(value, element) {
		return /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}$/.test( value );
	});

	jQuery.validator.addMethod("password_format", function(value, element) {
		return /(?=.*?[A-Z])(?=.*?[a-z])(?=.+[0-9])(?=.*?[!@$#&*_\.,;:])/.test( value );
	});

	jQuery.validator.addMethod("pswd_match",function (value,element){
		return $("#signup_password").val() == $('#signup_confirm_password').val();
	});

	$('#form_user').validate({
		debug: true,
		rules: {
			"user[name]": {
				required: true,
				minlength: 2,
				maxlength: 32,
				startsWithCapital: true,
				noNumbers: true
			},
			"user[email]": {
				required: true,
				email_format: true,
				remote:"/users/check_email"
			},
			"user[password]": {
				required: true,
				password_format: true,
				minlength: 6,
				maxlength: 32
			},
			"user[password_confirmation]": {
				required: true,
				pswd_match: true
			}
		},


		errorElement: "span",
		errorClass: "help-block",
		messages: {
			"user[name]": {
				required: "Name can't be blank.",
				maxlength: "Number of characters must be 2 to 32.",
				startsWithCapital: "Name Should start with Capital",
				noNumbers: "Numbers are not allowed in name"
			},
			"user[email]": {
				required: "Email can't be blank.",
				email_format: "Your email address must be in the format of name@domain.com.",
				remote: "This email id already exists"
			},
			"user[password]": {
				required: "Password can't be blank.",
				password_format: "should have atleast 1 Character, 1 Number and 1 Special Character from (!,@,$,&,*,_).",
				minlength: "Password should have minimum 6 characters",
				maxlength: "Number of characters must be 8 to 32."
			},
			"user[password_confirmation]": {
				required: "Password confirmation can't be blank.",
				pswd_match: "Doesn't match with the password."
			}
		},
		highlight: function(element) {
			$(element).parent().parent().addClass("has-error");
		},
		unhighlight: function(element) {
			$(element).parent().parent().removeClass("has-error");
		},
		invalidHandler: function(event, validator) {

// 'this' refers to the form
var errors = validator.numberOfInvalids();
if (errors) {
// Populating error message
var errorMessage = errors == 1
? 'You missed 1 field. It has been highlighted'
: 'You missed ' + errors + ' fields. They have been highlighted';
// Removing the form error if it already exists
$("#div_user_js_validation_error").remove();
errorHtml = "<div id='div_user_js_validation_error' class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
$("#div_modal_generic div.modal-body-main").prepend(errorHtml);
// Show error labels
$("div.error").show();
} else {
// Hide error labels
$("div.error").hide();
// Removing the error message
$("#div_user_js_validation_error").remove();
}
},


submitHandler: function(form) {
	form.submit();
}
});
}
