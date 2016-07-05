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

#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
	font-size: 12px;
}

#right-panel i {
	font-size: 12px;
}
#right-panel {    
        height: 100%;    
        float: right;    
        width: 390px;    
        overflow: auto;    
      }   
#right-panel {
   height: 100%;  
	margin: 20px;
	border-width: 2px;
	width: 190px;
	float: left;
	text-align: left;
	padding-top: 20px;
}
 #GoogleMap { 
 	height: 80%; 
 	width: 90%; 
 	margin: auto; 
 } 
#map {
	height: 100%;
	float: left;
	width: 70%;
	height: 100%;
}
</style>
</head>
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap"></script>

<body>
	<script>
		function initMap() {
			// 			使用者緯經度
			var lat;
			var lng;

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

					lat = position.coords.latitude;
					lng = position.coords.longitude;
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
						lat = parseFloat(location[0]);
						lng = parseFloat(location[1]);
						var marker = new google.maps.Marker({
							map : map,
							title : "321",
							// Define the place with a location, and a query string.
							place : {
								location : {
									lat : lat,
									lng : lng
								},
								query : "12312"
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
						var content = "<h2>" + value.sName + "</h2>" + "<p>電話號碼：" + value.sUsername + "</p>" + "<p>營業時間：" + value.sHours + "</p>";

						var infoWindow = new google.maps.InfoWindow({
							content : content,
							maxWidth : 200
						});
					})
				}
			});

			// 			導航
// 			var directionsDisplay = new google.maps.DirectionsRenderer();
// 			var directionsService = new google.maps.DirectionsService();
// 			var request = {
// 				origin : new google.maps.LatLng(25.047908, 121.517315),
// 				destination : new google.maps.LatLng(25.033681, 121.564726),
// 				travelMode : google.maps.TravelMode.WALKING
// 			};
// 			directionsService.route(request, function(response, status) {
// 				console.debug(response);
// 				if (status == google.maps.DirectionsStatus.OK) {
// 					directionsDisplay.setDirections(response);
// 				}
// 			})
// 			directionsDisplay.setMap(map);
// 			directionsDisplay.setPanel(document.getElementById('right-panel'));
		}
	</script>

	<div id="GoogleMap">
		<div id="map"></div>
<!-- 		<div id="right-panel"> -->
<!-- 		</div> -->
	</div>

</body>
</html>