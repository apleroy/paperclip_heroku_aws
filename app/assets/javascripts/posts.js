
$( document ).ready( function () {


    //DEFAULTS ON LOAD
    formDisplayStatus();
    enforceSubmitButtonStatus();


    //when a user selects a file to upload, display it in the preview box and set the hidden post image to some default text
    //the hidden post image field is used to ensure the file is not set to nil in the posts controller
    $(document).on("change", "#post_image_input", function(event) {
        var files = event.target.files;
        var image = files[0];
        var reader = new FileReader();
        reader.onload = function(file) {
            var img = new Image();
            img.src = file.target.result;
            $("#post_image_target").css('background-image', 'url(' + img.src + ')'); //render the preview
            $('#hidden_post_image').val("file_present"); //set the hidden value with default text
        }
        reader.readAsDataURL(image);

        $(this).closest(".js-resource_form_section").find(".js-title_right").hide();
        $(this).closest(".js-resource_form_section").find(".js-success_display").show();
    });

    //when a user clicks "remove" file, remove the preview and set the hidden post image to blank
    $(document).on("click", "#post_image_remove_button", function() {
        $("#post_image_target").css('background-image', 'none');
        $("#hidden_post_image").val('');

        $(this).closest(".js-resource_form_section").find(".js-success_display").hide();
        $(this).closest(".js-resource_form_section").find(".js-title_optional").show();

    });

    //when typing in a form field, check the current length of the field and display a "required" or "check mark"
    $(document).on("keyup", ".js-required_field", function() {
        if ($(this).val().length >= 1) {
            $(this).closest(".js-resource_form_section").find(".js-title_required").hide();
            $(this).closest(".js-resource_form_section").find(".js-success_display").show();
        } else {
            $(this).closest(".js-resource_form_section").find(".js-success_display").hide();
            $(this).closest(".js-resource_form_section").find(".js-title_required").show();
        }
        enforceSubmitButtonStatus();
    });


    //loop through required fields - if any are empty, prevent submit button
    function enforceSubmitButtonStatus () {
        $("#save_post_button").prop('disabled', false);
        $(".js-required_field").each(function () {
            if ($(this).val().length < 1) {
                $("#save_post_button").prop('disabled', true);
                return false;
            }
        });
    }

    //loop through each form field and display helper text or a check mark
    function formDisplayStatus () {
        $(".js-resource_field").each(function () {
            if (($(this).val().length >= 1) || ($(this).text().length >= 1)) {
                $(this).closest(".js-resource_form_section").find(".js-title_right").hide();
                $(this).closest(".js-resource_form_section").find(".js-success_display").show();
            } else {
                $(this).closest(".js-resource_form_section").find(".js-title_right").show();
                $(this).closest(".js-resource_form_section").find(".js-success_display").hide();
            }
        });
    }
});
