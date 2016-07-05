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

#GoogleMap {
	height: 80%;
	width: 90%;
	margin: auto;
}
</style>
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap"></script>

<script type="text/javascript">
	function initMap() {
		$.ajax(function(){
			"type" : "post",
			"url" : "showFoodCarsMap/controller/MapMaker",
			"dataType" : "JSON",
			
		});
		

		var myLatLng = {
			lat : -25.363,
			lng : 131.044
		};

		var map = new google.maps.Map(document.getElementById('GoogleMap'), {
			zoom : 4,
			center : myLatLng
		});

		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : 'Hello World!'
		});

	}
</script>
</head>
<body>
	<div id="GoogleMap"></div>
</body>
</html>