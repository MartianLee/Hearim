global.$ = require('jquery')

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

window.copyLink = function(id) {
    // window.clipboardData.setData("Text", url);
    // var copyText = document.getElementById(url);

    // /* Select the text field */
    // copyText.select();

    // /* Copy the text inside the text field */
    // document.execCommand("Copy");

    // console.log("Copied the text: " + copyText.value);
    // var val = document.getElementById('js-url-' + id).value;
    // var t = document.createElement("textarea");
    // document.body.appendChild(t);
    // t.value = val;
    // t.select();
    // document.execCommand('copy');
    // document.body.removeChild(t);

    // var copyText = document.getElementById('js-url-' + id);
    // copyText.select();
    // document.execCommand("Copy");

    // var message = '#js-copy-message-' + id;
    // $(message).css("opacity",1);
    // setTimeout(function(){ $(message).css("opacity",0); }, 1000);

}