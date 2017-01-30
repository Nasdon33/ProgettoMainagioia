$(document).ready(function () {
    var pswd1;
    var pswd2;
    
    var l=false;
    var M=false;
    var lett=false;
    var numb=false;
    
    document.getElementById("reg_but").disabled = true;
    
    $('input[name=password]').keyup(function () {
        pswd1 = $(this).val();
        
        if (pswd1.length < 8) {
            $('#length').removeClass('valid').addClass('invalid');
            l=false;
        } else {
            $('#length').removeClass('invalid').addClass('valid');
            l=true;
        }
        //validate letter
        if (pswd1.match(/[A-z]/)) {
            $('#letter').removeClass('invalid').addClass('valid');
            lett=true;
            console.log(lett);
        } else {
            $('#letter').removeClass('valid').addClass('invalid');
            lett=false;
        }

        //validate capital letter
        if (pswd1.match(/[A-Z]/)) {
            $('#capital').removeClass('invalid').addClass('valid');
            M=true;
        } else {
            $('#capital').removeClass('valid').addClass('invalid');
            M=false;
        }

        //validate number
        if (pswd1.match(/\d/)) {
            $('#number').removeClass('invalid').addClass('valid');
            numb=true;
        } else {
            $('#number').removeClass('valid').addClass('invalid');
            numb=false;
        }
        if(pswd2==pswd1 && l==true && M==true && lett==true && numb==true){
            console.log("PUOI REGISTRARTI");
            document.getElementById("reg_but").disabled = false; 
        }else{
            document.getElementById("reg_but").disabled = true; 
        }
        
        
        
        
    });
    $('input[name=pass2]').keyup(function () {
        pswd2=$(this).val();
        
        
        if(pswd2==pswd1 && l==true && M==true && lett==true && numb==true){
            console.log("PUOI REGISTRARTI");
            document.getElementById("reg_but").disabled = false; 
        }else{
            document.getElementById("reg_but").disabled = true; 
        }
       
    });

});