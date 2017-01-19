$(document).ready(function(){
    
    var email = $("#login-normal input[name=email]");
    var password = $("#login-normal input[name=password]");
    var pos = $("#form").offset();

    $("#login-normal").submit(function(event){
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "validate",
            data: {email: $(email).val(), password: $(password).val()},
            success: function(esiste){
                if(esiste!=="true"){
                    $('#pop-up-login').show()
                        .css('top', event.pageY + pos.top)
                        .css('left', event.pageX + pos.left)
                        .appendTo('body');
                } else {
                    $("#login-normal").unbind('submit').submit();
                }
            }
        });
    });
    
    $(document).click(function(){
        $('#pop-up-login').hide();
    });
    
    $("#login").submit(function(event){
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "validate",
            data: {email: $("#login input[name=email]").val(), password: $("#login input[name=password").val()},
            success: function(esiste){
                if(esiste!=="true"){
                    $("#login-error").removeClass("invisibile");
                } else {
                    $("#login").unbind('submit').submit();
                }
            }
        });
    });
    
    cont();
});


function sendPassword(){
    $.ajax({
        type: "POST",
        url: "sendPassword",
        data: {email: $("#login input[name=email]").val()},
        success: function(esiste){
            if(esiste==="true"){
                alert("Email inviata");
            } else if (esiste==="false"){
                alert("Email non valida");
            } else {
                window.location.href = "argh_page.jsp";
            }
        }
    });
}


function start(t){
    $.ajax({
        type: "POST",
        url: "script_spettacoli",
        data: {t: t}
    });
}

function cont(){
    $.ajax({
        type: "POST",
        url: "script_spettacoli"
    });
}