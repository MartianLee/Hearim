var $ = require('jquery')

window.autosize = function() {
    var el = $("#form-text")[0];
    setTimeout(function(){
        el.style.cssText = 'height:auto; padding:0';
        // for box-sizing other than "content-box" use:
        el.style.cssText = '-moz-box-sizing:content-box';
        el.style.cssText = 'height:' + el.scrollHeight + 'px';
    },0);
}

$( document ).ready(function() {
    var textarea = document.querySelector('textarea');
    // textarea.addEventListener('keydown', autosize);
    $("#form-text").bind("keydown", autosize);
});

$("#form-text").bind("keydown", autosize);
