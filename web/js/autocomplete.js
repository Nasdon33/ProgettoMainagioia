$(document).ready(function () {
    var ricerca = document.querySelector('input[name=ricerca]:checked').value;
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
                
                
                var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
                $.ajax({
                    url: "Controller",
                    type: "GET",
                    data: {
                        term: request.term,
                        ric: ricerca.serialize()
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
