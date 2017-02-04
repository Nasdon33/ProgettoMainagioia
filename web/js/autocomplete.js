$(document).ready(function () {

   $(function () {

       $("#ricerca").autocomplete({

           width: 300,
           max: 10,
           delay: 100,
           minLength: 1,
           autoFocus: true,
           cacheLength: 1,
           scroll: true,
           highlight: false,
           source: function (request, response) {
                var rad= $('input[name=paramricerca]:checked').val();
                console.log(rad);
                var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                $.ajax({
                   
                   url: "Controller",
                   type: "GET",
                   data: {
                       term: request.term,
                       rad: rad
                   },
                   dataType: "json",
                   success: function (data) {
                       response(data);
                   }
               });
           }
       });
   });
});