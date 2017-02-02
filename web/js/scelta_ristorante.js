$(document).ready(function () {
    
  

    
    $('.radio').click(function(e){
        var nome = $(e.relatedTarget).data("name");
        var sito = $("input[name=w]").val();
        var rad = $('input[name=scelta]:checked').val();
        if(rad != "null"){
            $( '.hid' ).show();
            document.getElementById('nome').innerHTML = nome;
            document.getElementById('n').innerHTML = nome;
            document.getElementById('w').innerHTML = sito;
        }
    });
}); 