function sendPassword(){
   $.ajax({
       url: "sendPass",
       type: "POST",
       data: {email: $("#login input[name=email]").val()},
       success: function(esiste){
           if(esiste==="true"){
               alert("Email inviata");
           } else if (esiste==="false"){
               alert("Email non valida");
           
       }console.log("CI SONO");
   }
   });
   }