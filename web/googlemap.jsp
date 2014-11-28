<%-- 
    Document   : googlemap
    Created on : Jul 2, 2014, 5:29:57 AM
    Author     : KSR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="org.netbeans.saas.*, org.netbeans.saas.google.*" %>


<html>
    <head>
        <title> google map </title>
        <style>
            #map_canvas {
                width: 500px;
                height: 400px;
            }
        </style>
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script type="text/javascript">
             
            function initialize() {
                 var latitude;
               var longitude;
                var geocoder = new google.maps.Geocoder();
                var address = window.opener.document.getElementById('location').value;
               
              geocoder.geocode({'address': address}, function(results, status) {
              if (status === google.maps.GeocoderStatus.OK) {
                   latitude = results[0].geometry.location.lat();
                     longitude = results[0].geometry.location.lng();
                
                 var map_canvas = document.getElementById('map_canvas');
                var map_options = {
                 //   center: new google.maps.LatLng(44.5403, -78.5463),
                  center: new google.maps.LatLng(latitude,longitude),
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(map_canvas, map_options);
                }               
           });

         
                
            }
            google.maps.event.addDomListener(window, 'load', initialize);
         </script>
    </head>
    <body>
        <INPUT TYPE="text" NAME="txtData2" ID="txtData2">

        <div id="map_canvas"></div>
    </body>
</html>


