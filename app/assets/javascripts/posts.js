
$( document ).ready( function () {


    //when a user selects a file to upload, display it in the preview box and set the hidden post image to some default text
    $(document).on("change", "#post_image_input", function(event) {
        var files = event.target.files;
        var image = files[0];
        var reader = new FileReader();
        reader.onload = function(file) {
            var img = new Image();
            img.src = file.target.result;
            $("#post_image_target").css('background-image', 'url(' + img.src + ')');
            $('#hidden_post_image').val("file_present");
        }
        reader.readAsDataURL(image);
    });

    //when a user clicks "remove" file, remove the preview and set the hidden post image to blank
    $(document).on("click", "#post_image_remove_button", function() {
        $("#post_image_target").css('background-image', 'none');
        $("#hidden_post_image").val('');
    });


});
