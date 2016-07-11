$(function () {
    $("#MainContent .content .text img").wrap('<div class="image"></div>');

    if (typeof mainImageCustomSign !== 'undefined') {
        $("#MainContent div.image:first").append('<div class="custom-sign ' + mainImageCustomSign + '"></div>');
    }
});