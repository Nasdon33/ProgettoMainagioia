$(document).ready(function () {
    var x = document.getElementById("demo");
    if (navigator.geolocation) {
        console.log("CIAO");
        navigator.geolocation.getCurrentPosition(success);
        
    } else {
        console.log("GRRRR");
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
    
    
    function success(pos){
    console.log("success");
    var coord = pos.coords;
    console.log(coord.latitude);
    console.log(coord.longitude);
    $("#demo").load("GeoSearch?" + $.param({lati: coord.latitude, long: coord.longitude}));
    
};
});

