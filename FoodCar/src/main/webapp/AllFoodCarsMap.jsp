<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#map img {
	max-width: none !important;
}

.gm-style-iw {
	width: 350px !important;
	top: 15px !important;
	left: 0px !important;
	background-color: #fff;
	box-shadow: 0 1px 6px rgba(178, 178, 178, 0.6);
	border: 1px solid rgba(72, 181, 233, 0.6);
	border-radius: 2px 2px 10px 10px;
}
#iw-container {
	margin-bottom: 10px;
}
#iw-container .iw-title {
	font-family: 'Open Sans Condensed', sans-serif;
	font-size: 22px;
	font-weight: 400;
	padding: 10px;
	background-color: #48b5e9;
	color: white;
	margin: 0;
	border-radius: 2px 2px 0 0;
}
#iw-container .iw-content {
	font-size: 13px;
	line-height: 18px;
	font-weight: 400;
	margin-right: 1px;
	padding: 15px 5px 20px 15px;
	max-height: 140px;
	overflow-y: auto;
	overflow-x: hidden;
}
.iw-content img {
	float: right;
	margin: 0 5px 5px 10px;	
}
.iw-subTitle {
	font-size: 16px;
	font-weight: 700;
	padding: 5px 0;
}
.iw-bottom-gradient {
	position: absolute;
	width: 326px;
	height: 25px;
	bottom: 10px;
	right: 18px;
	background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
	background: -webkit-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
	background: -moz-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
	background: -ms-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
}



html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

/* #right-panel { */
/* 	font-family: 'Roboto', 'sans-serif'; */
/* 	line-height: 30px; */
/* 	padding-left: 10px; */
/* 	font-size: 12px; */
/* } */

/* #right-panel i { */
/* 	font-size: 12px; */
/* } */

/* #right-panel { */
/* 	height: 100%; */
/* 	float: right; */
/* 	width: 390px; */
/* 	overflow: auto; */
/* } */

/* #right-panel { */
/* 	height: 100%; */
/* 	margin: 20px; */
/* 	border-width: 2px; */
/* 	width: 190px; */
/* 	float: left; */
/* 	text-align: left; */
/* 	padding-top: 20px; */
/* } */

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
				},
				draggable:true
			});
			
			// 			設定地圖樣式
			var MapTypeId = 'mapStyle';
			var mapStyle = new google.maps.StyledMapType([ {
				featureType : "poi.business",
				elementType : 'labels',
				stylers : [ {
					visibility : 'off'
				} ]
			}, {
				featureType : "road.local",
				elementType : 'labels',
				stylers : [ {
					visibility : 'off'
				} ]

			}

			]);

			map.mapTypes.set(MapTypeId, mapStyle);
			map.setMapTypeId(MapTypeId);

			var center;
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					map.setCenter({
						lat : position.coords.latitude,
						lng : position.coords.longitude
					});

					var marker = new google.maps.Marker({
						map : map,
						draggable : false,

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

						var openTime;
						if (typeof value.openTime == 'undefined') {
							openTime = "今日休息";
						} else {
							openTime = value.openTime;
						}
						if (value.open) {

							var marker = new google.maps.Marker({
								icon : "images/MapIcon/open.png",
								map : map,
								title : "",
								place : {
									location : {
										lat : lat,
										lng : lng
									},
									query : "12312"
								},
								attribution : {
									source : 'Google Maps JavaScript API231132',
									webUrl : 'https://developers.google.com/maps/'
								}
							});
						} else {
							var marker = new google.maps.Marker({
								icon : "images/MapIcon/closed.png",
								map : map,
								title : "321",
								place : {
									location : {
										lat : lat,
										lng : lng
									},
									query : "12312"
								},
								attribution : {
									source : 'Google Maps JavaScript API231132',
									webUrl : 'https://developers.google.com/maps/'
								}
							});

						}
					
						marker.addListener('click', function() {
							infoWindow.open(map, marker);
						});
						
//		 				使用者縮放地圖時關掉資訊視窗
						google.maps.event.addListener(map, 'zoom_changed', function() {
							    	infoWindow.close();
							   });
// 							點擊地圖時關閉資訊視窗
						  google.maps.event.addListener(map, 'click', function() {
							  infoWindow.close();
							  });
						var content = "<div id='iw-container'>"
									+"<div class='iw-title'>" + value.sName + "</div>"
									+"<div class='iw-content'>" 
									+ "<p>電話號碼：" + value.sUsername + "</p>" 
									+ "<p>今日營業時間：" + openTime + "</p>"
									+"<p>介紹："+value.sIntro+"</p>"+
									"</div></div>";
// 									'<img src="http://maps.marnoto.com/en/5wayscustomizeinfowindow/images/vistalegre.jpg" alt="Porcelain Factory of Vista Alegre" height="115" width="83">'
						var infoWindow = new google.maps.InfoWindow({
							content : content
						});
						
						google.maps.event.addListener(infoWindow, 'domready', function() {
							var iwOuter = $('.gm-style-iw');
							var iwBackground = iwOuter.prev();
							iwBackground.children(':nth-child(2)').css({
								'display' : 'none'
							});
							iwBackground.children(':nth-child(4)').css({
								'display' : 'none'
							});
							iwOuter.parent().parent().css({
								left : '115px'
							});
							iwBackground.children(':nth-child(1)').attr('style', function(i, s) {
								return s + 'left: 76px !important;'
							});
							iwBackground.children(':nth-child(3)').attr('style', function(i, s) {
								return s + 'left: 76px !important;'
							});
							iwBackground.children(':nth-child(3)').find('div').children().css({
								'box-shadow' : 'rgba(72, 181, 233, 0.6) 0px 1px 6px',
								'z-index' : '1'
							});
							var iwCloseBtn = iwOuter.next();
							iwCloseBtn.css({
								opacity : '1',
								right : '38px',
								top : '3px',
								border : '7px solid #48b5e9',
								'border-radius' : '13px',
								'box-shadow' : '0 0 5px #3990B9'
							});
							if ($('.iw-content').height() < 140) {
								$('.iw-bottom-gradient').css({
									display : 'none'
								});
							}
							iwCloseBtn.mouseout(function() {
								$(this).css({
									opacity : '1'
								});
							});
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