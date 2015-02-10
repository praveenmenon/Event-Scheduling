function LoginUserForm(){

	jQuery.validator.addMethod("email_format", function(value, element) {
		return /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}$/.test( value );
	});


	$('#signin_user').validate({
		debug: true,
		rules: {
			
			"email": {
				required: true,
				email_format: true,
				remote:"/sessions/check_email"
			},
			"password":{
				required: true,
			}
		},
		errorElement: "span",
		errorClass: "help-block",
		messages: {
			
			"email": {
				required: "Email can't be blank.",
				email_format: "Your email address must be in the format of name@domain.com.",
				remote: "User doesn't exist!"
			},
			"password": {
				required: "Please enter the password",
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