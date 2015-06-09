
$( document ).ready( function () {


    $("#main_content").css('min-height', $(window).height() - 50);

    //Home Page

    $( window ).resize(function() {
        $("#main_content").css('min-height', $(window).height() - 50);


    });

    $(document).on("change", "#main_image_input", function(event) {
    //$('#main_image_input').on('change', function(event) {
        var files = event.target.files;
        var image = files[0]
        var reader = new FileReader();
        reader.onload = function(file) {
            var img = new Image();
            img.src = file.target.result;
            $("#main_image_target").css('background-image', 'url(' + img.src + ')');
            $('#hidden_1').val("file_present");
        }
        reader.readAsDataURL(image);
    });

    $(document).on("click", "#main_image_remove_button", function() {
        $("#main_image_target").css('background-image', 'none');
        $("#hidden_1").val('');
    });


});
