function sendPassword(){
   $.ajax({
       url: "sendPass",
       type: "POST",
       data: {email: $("input[name=email]").val()},
       success: function(esiste){
           if(esiste==="true"){
               alert("Email inviata all'indirizzo: "+$("input[name=email]").val());
           }
           else if (esiste==="false"){
               alert("Email non valida");
           }
           else 
                window.location.href = "argh_page.jsp";
       console.log("CI SONO");
   }
   });
   }