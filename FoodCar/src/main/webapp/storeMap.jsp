<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="images/tools/logo.png"> 
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#GoogleMap {
	height: 80%;
	width: 90%;
	margin: auto;
}
</style>
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&libraries=places&callback=initMap"></script>

<script type="text/javascript">
	function initMap() {
		var marker;
		var lat;
		var lng;
		var address;
		
		
		
		
		$.ajax({
			"type" : "post",
			"url" : "showFoodCarsMap/controller/MapMaker",
			"dataType" : "JSON",
			"data":{"sID":1},
			"success":function(datas){
				var temp=datas[0].location;
				var location=temp.split(",");
				lat=parseFloat(location[0]);
				lng=parseFloat(location[1]);
				
				console.log(datas[0]);
				console.log(lat);
				
				
				var myLatLng = {
						lat :lat,
						lng :lng
					};
				var map = new google.maps.Map(document.getElementById('GoogleMap'), {
					zoom : 18,
					center : myLatLng
					
				});
				
				var MapTypeId = 'mapStyle';
				var mapStyle = new google.maps.StyledMapType([{"featureType":"road","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"hue":149},{"saturation":-78},{"lightness":0}]},{"featureType":"road.highway","stylers":[{"hue":-31},{"saturation":-40},{"lightness":2.8}]},{"featureType":"poi","elementType":"label","stylers":[{"visibility":"off"}]},{"featureType":"landscape","stylers":[{"hue":163},{"saturation":-26},{"lightness":-1.1}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"water","stylers":[{"hue":3},{"saturation":-24.24},{"lightness":-38.57}]}]);

				map.mapTypes.set(MapTypeId, mapStyle);
				map.setMapTypeId(MapTypeId);
				
				var marker = new google.maps.Marker({
					icon :"images/MapIcon/open.png",
					map : map,
					position:myLatLng,
					attribution : {
						source : 'Google Maps JavaScript API231132',
						webUrl : 'https://developers.google.com/maps/'
					}
				});
			
				
					
					
				
				
			}
		})

		
		
		
		

	}
</script>
</head>
<body>
	<div id="GoogleMap"></div>
</body>
</html>