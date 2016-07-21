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
		var marker;
		var lat;
		var lng;
		var address;
		 geocoder = new google.maps.Geocoder();
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				map.setCenter({
					lat : position.coords.latitude,
					lng : position.coords.longitude
				});

				marker = new google.maps.Marker({
					icon : "images/MapIcon/open.png",
					map : map,
					draggable : true,
					title : "你在這",
					snippet : "123",
					animation : google.maps.Animation.BOUNCE,
					position : {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					},

				});
				var infoWindow = new google.maps.InfoWindow({
					maxWidth : 200
				});
				// 				 只要移動就抓緯經度
				google.maps.event.addListener(marker, 'dragend', function(event) {
// 					console.log("lat:"+event.latLng.lat());
// 					console.log(marker.getPosition().lat());
					//console.log("lnt:"+event.latLng.lng());
					
			
 					 marker.setAnimation(null);
			          marker.setAnimation(google.maps.Animation.BOUNCE);
// 					緯經度轉地址
					geocoder.geocode({
						'latLng' : marker.getPosition()
					}, function(results, status) {
						if (status === google.maps.GeocoderStatus.OK) {
							if (results) {

								// 將取得的資訊傳入 marker 訊息泡泡
// 								showAddress(results[0], marker);
// 								address=results[0].address_components[4].long_name+results[0].address_components[3].long_name+
// 								results[0].address_components[2].long_name+results[0].address_components[1].long_name+results[0].address_components[0].long_name;
								console.log(results[0]);
								
								address=results[0].formatted_address.substring(5);
								
								var content = "<p>大略地址："+address+"</p>"+ "</p><div style=''><input type='button' id='location' value='送出' /></div>";
								infoWindow.setContent(content);
								infoWindow.open(map, marker);
								lat = event.latLng.lat();
								lng = event.latLng.lng();
								
							}
						} else {
							alert("Reverse Geocoding failed because: " + status);
						}
					});

					
				});
				


				$('#GoogleMap').on('click', '#location', function() {

					$.ajax({
						"type" : "POST",
						"url" : "showFoodCarsMap/controller/storeLocation",
						"contentType" : "application/json;charset=UTF-8",
						"data" : JSON.stringify({
							"sID" : 1,
							"location" : lat + "," + lng
						}),
						"success" : function() {

							console.log("成功");
							infoWindow.close();

						}
					});

				});

			}, function() {
				handleLocationError(true, infoWindow, map.getCenter());
			});
		} else {
			// Browser doesn't support Geolocation
			handleLocationError(false, infoWindow, map.getCenter());
		}

		var myLatLng = {
			lat : 25.033493,
			lng : 121.564101
		};

		var map = new google.maps.Map(document.getElementById('GoogleMap'), {
			zoom : 18,
			center : myLatLng
		});

	}
</script>
</head>
<body>
	<div id="GoogleMap"></div>
</body>
</html>