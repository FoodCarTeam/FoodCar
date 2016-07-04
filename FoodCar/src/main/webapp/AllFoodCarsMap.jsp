<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 80%;
	width: 80%;
	margin: auto;
}
</style>
</head>
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap"></script>

<body>
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : 25.033681,
					lng : 121.564726
				}
			});

			var center;
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					map.setCenter({
						lat : position.coords.latitude,
						lng : position.coords.longitude
					});

					var marker = new google.maps.Marker({
						map : map,
						draggable : true,
						animation : google.maps.Animation.BOUNCE,
						position : {
							lat : position.coords.latitude,
							lng : position.coords.longitude
						},

					});
				}, function() {
					handleLocationError(true, infoWindow, map.getCenter());
				});
			} else {
				// Browser doesn't support Geolocation
				handleLocationError(false, infoWindow, map.getCenter());

			}

			$.ajax({
				"type" : "post",
				"url" : "showFoodCarsMap/controller/MapMaker",
				"dataType" : "JSON",
				"success" : function(datas) {
					$.each(datas, function(index, value) {
						var location = value.location.split(",");
						var lat=parseFloat(location[0]);
						var lng=parseFloat(location[1]);
						var marker = new google.maps.Marker({
							map : map,
							title:"321",
							// Define the place with a location, and a query string.
							place : {
								location : {
									lat : lat,
									lng : lng
								},
								query :"12312"
							},
							//Attributions help users find your site again.
							attribution : {
								source : 'Google Maps JavaScript API231132',
								webUrl : 'https://developers.google.com/maps/'
							}
						});
		
						marker.addListener('click', function() {
							infoWindow.open(map, marker);
						});
						
						var infoWindow = new google.maps.InfoWindow({
							content : value.sName
						});
						
						
					})

				}

			});

			// Construct a new InfoWindow.
			

			// Opens the InfoWindow when marker is clicked.

		}
	</script>

	<div id="map"></div>



</body>
</html>