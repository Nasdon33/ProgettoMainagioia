<center>
        <div class="row">       
            <div id="map-canvas" style="height:300px; width:300px"></div>
                <script>
                    var map;
                    var tmp1=document.getElementById('latitude').value;
                    var lat=parseFloat(tmp1);
                    console.log(lat);
                    var tmp2=document.getElementById('longitude').value;
                    var long=parseFloat(tmp2);
                    console.log(long);
                    function initialize() {
                        var mapOptions = {
                            zoom: 13,
                            center: new google.maps.LatLng(lat, long )
                        };
                        map = new google.maps.Map(document.getElementById('map-canvas'),
                                mapOptions);
                                TestMarker();
                         }

                    google.maps.event.addDomListener(window, 'load', initialize);
                    function addMarker(location) {
                        marker = new google.maps.Marker({
                            position: location,
                            map: map
                            });
                        }

                         // Testing the addMarker function
                    function TestMarker() {
                           mark = new google.maps.LatLng(lat, long);
                           addMarker(mark);
                    }
                </script>    
            </div>
            </center>