<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="TestProj1.Map" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Set the size of the div element that contains the map */
        #map {
            height: 600px; /* The height is 400 pixels */
            width: 100%; /* The width is the width of the web page */
        }
    </style>
</head>
<body>
    <h3>My Google Maps Demo</h3>
    

    <div class="container">
        <h1>Get location on map</h1>
        <div class="row">
            <div class="col-sm-12">
                <p id="demo"></p>
                <input id="locationName" value="" />
                <button id="cap-location-btn" title="Sepak Location Name">Sepak Location Name</button>
                <button id="play-btn" title="Map Location" onclick="getLocation()">Map Location</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                Lat:<input type="text" id="latbox" />
            </div>
            <div class="col-sm-2">
                Long:<input type="text" id="lngbox" />
            </div>
            <div class="col-sm-2">
                Distance:<input type="text" id="distanceBox" />
            </div>
            <div class="col-sm-2">
                Place 1:<input type="text" id="hdnPlace1" />
            </div>
            <div class="col-sm-2">
                Place 2:<input type="text" id="hdnPlace2" />
            </div>
            <div class="col-sm-2">
                Show Map:<input type="checkbox" id="chkShowMap" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                &nbsp;
            </div>
        </div>
    </div>
    <div id="map"></div>


    <input type="button" value="Go to my home" onclick="Relocate()" />
    <input type="button" value="Reset" onclick="initMap()" />


    <script>



        function ShowPlaceDetails(marker, service, infowindow, hdnPlace) {
            var geocoder = new google.maps.Geocoder;

            latitude = marker.getPosition().lat();
            longitude = marker.getPosition().lng();
            var latlng = { lat: parseFloat(latitude), lng: parseFloat(longitude) };

            geocoder.geocode({ 'location': latlng }, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {

                    if (results[1]) {
                        var id = results[1].place_id;
                        console.log(id);



                        service.getDetails({
                            placeId: id
                        }, function (place, status) {
                            if (status === google.maps.places.PlacesServiceStatus.OK) {
                                infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                                  'Place ID: ' + place.place_id + '<br>' +
                                  place.formatted_address + '</div>');
                                infowindow.open(map, marker);

                                hdnPlace.value = place.formatted_address;
                            }
                        });









                    } else {
                        window.alert('No results found');
                    }
                } else {
                    window.alert('Geocoder failed due to: ' + status);
                }
            });
        }

        // Initialize and add the map
        function initMap() {
            // The location of Uluru
            var uluru = { lat: 22.266124, lng: 73.1556573 };
            // The map, centered at Uluru
            var map = new google.maps.Map(
                document.getElementById('map'), { zoom: 10, center: uluru, mapTypeId: google.maps.MapTypeId.HYBRID });

            // The marker, positioned at Uluru
            var marker = new google.maps.Marker({ position: uluru, map: map, draggable: true });




            var uluru = { lat: 22.3072, lng: 73.1556573 };
            var marker1 = new google.maps.Marker({ position: uluru, map: map, draggable: true });


            var infowindow = new google.maps.InfoWindow();
            var service = new google.maps.places.PlacesService(map);
            ShowPlaceDetails(marker, service, infowindow, document.getElementById("hdnPlace1"));
            ShowPlaceDetails(marker1, service, infowindow, document.getElementById("hdnPlace2"));



            google.maps.event.addListener(marker, 'dragend', function (event) {

                document.getElementById("latbox").value = this.getPosition().lat();
                document.getElementById("lngbox").value = this.getPosition().lng();

                var center = marker;
                console.log(center)
                console.log(center.getPosition().lat())
                console.log(center.getPosition().lng())
                var distance = 0;
                //distance = google.maps.geometry.spherical.computeDistanceBetween(center, marker1);

                document.getElementById("distanceBox").value = distance

                var myLatLng = new google.maps.LatLng(center.getPosition().lat(), center.getPosition().lng());



                /*
                var bounds = new google.maps.LatLngBounds();
          
                bounds.extend(myLatLng);
                map.fitBounds(bounds);
                */

                ShowPlaceDetails(marker, service, infowindow, document.getElementById("hdnPlace1"));

                //calculateDistance();
                DistanceCalc(marker, marker1);

                calcRoute(map, marker, marker1);

               
            });

            google.maps.event.addListener(marker1, 'dragend', function (event) {

                document.getElementById("latbox").value = this.getPosition().lat();
                document.getElementById("lngbox").value = this.getPosition().lng();

                var center = marker1;
                console.log(center)
                console.log(center.getPosition().lat())
                console.log(center.getPosition().lng())
                var distance = 0;
                //distance = google.maps.geometry.spherical.computeDistanceBetween(center, marker);

                document.getElementById("distanceBox").value = distance

                ShowPlaceDetails(marker1, service, infowindow, document.getElementById("hdnPlace2"));

                //calculateDistance();
                DistanceCalc(marker, marker1);
                calcRoute(map, marker, marker1);
            });

            //google.maps.event.addDomListener(window, 'load', initialize);

            //Call the function with address as parameter    

            

        }

        function calcRoute(map, marker, marker1) {

            if ($('#chkShowMap').is(':checked')) {

                var directionsDisplay = new google.maps.DirectionsRenderer();
                var directionsService = new google.maps.DirectionsService();
                var start = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
                //var end = new google.maps.LatLng(38.334818, -181.884886);
                var end = new google.maps.LatLng(marker1.getPosition().lat(), marker1.getPosition().lng());
                var bounds = new google.maps.LatLngBounds();
                bounds.extend(start);
                bounds.extend(end);
                //map.fitBounds(bounds);
                var request = {
                    origin: start,
                    destination: end,
                    travelMode: google.maps.TravelMode.DRIVING
                };
                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                        directionsDisplay.setMap(map);
                    } else {
                        alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
                    }
                });
            }
        }

        /*
        function calculateDistance() {
            var directionsService = new google.maps.DirectionsService();

            var request = {
                origin: document.getElementById("hdnPlace1").value, // a city, full address, landmark etc
                destination: document.getElementById("hdnPlace2").value,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };

            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    console.log(response.routes[0].legs[0].distance.value); // the distance in metres
                    document.getElementById("distanceBox").value = response.routes[0].legs[0].distance.value;
                }
                else {
                    // oops, there's no route between these two locations
                    // every time this happens, a kitten dies
                    // so please, ensure your address is formatted properly
                }
            });
        }
        */


        function Relocate() {
            // The location of Uluru
            var uluru = { lat: 22.266124, lng: 73.1556573 };
            // The map, centered at Uluru
            var map = new google.maps.Map(
                document.getElementById('map'), { zoom: 15, center: uluru });
            // The marker, positioned at Uluru
            var marker = new google.maps.Marker({ position: uluru, map: map });
        }

        var getLocation = function () {
            var address = document.getElementById("locationName").value
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    console.log(latitude, longitude);

                    // The location of Uluru
                    var uluru = { lat: latitude, lng: longitude };
                    // The map, centered at Uluru
                    var map = new google.maps.Map(
                        document.getElementById('map'), { zoom: 15, center: uluru, mapTypeId: google.maps.MapTypeId.HYBRID });

                    var marker = new google.maps.Marker({ position: uluru, map: map, draggable: true });
                }
            });
        }


        function DistanceCalc(marker, marker1)
        {
            debugger;
            var origin1 = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
            var destination1 = new google.maps.LatLng(marker1.getPosition().lat(), marker1.getPosition().lng());

            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix(
              {
                  origins: [origin1],
                  destinations: [destination1],
                  travelMode: 'DRIVING',
                  
              }, callback);

            
        }
        function callback(response, status) {
            debugger;
            if (status == 'OK') {
                var origins = response.originAddresses;
                var destinations = response.destinationAddresses;

                for (var i = 0; i < origins.length; i++) {
                    var results = response.rows[i].elements;
                    for (var j = 0; j < results.length; j++) {
                        var element = results[j];
                        var distance = element.distance.text;
                        var duration = element.duration.text;
                        var from = origins[i];
                        var to = destinations[j];

                        document.getElementById("distanceBox").value = distance;
                    }
                }
            }
        }

    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzt6mLPztqHXI7jyj2nNAqWuef8S6tOek&callback=initMap&libraries=places">
    </script>
    <script src="jquery.min.js"></script>
    <script src="script_Map.js"></script>
</body>
</html>
