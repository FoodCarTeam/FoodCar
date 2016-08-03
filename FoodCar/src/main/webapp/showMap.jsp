<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="images/tools/logo.png"> 
</head>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&libraries=places&callback=initMap"></script>
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.jsonp.js"></script>
<link rel='stylesheet' href='bootstrap/map/css/showFoodCarsMap.css' type='text/css' media='all' />
<body>
	
	<script type='text/javascript'>
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
		var mapStyle = new google.maps.StyledMapType([{"featureType":"road","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"hue":149},{"saturation":-78},{"lightness":0}]},{"featureType":"road.highway","stylers":[{"hue":-31},{"saturation":-40},{"lightness":2.8}]},{"featureType":"poi","elementType":"label","stylers":[{"visibility":"off"}]},{"featureType":"landscape","stylers":[{"hue":163},{"saturation":-26},{"lightness":-1.1}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"water","stylers":[{"hue":3},{"saturation":-24.24},{"lightness":-38.57}]}]);
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

		
// 		var temp={
// 				scope:"resourceAquire",
// 			rid:"36847f3f-deff-4183-a5bb-800737591de5",
// 			limit:"limit"
// 		}
// 		$.getJSON("http://data.taipei/opendata/datalist/apiAccess?callback=?",temp,function(data){
// 			console.log(data);
// 		});
		
		
		
// 		$.ajax({
// 			url:"http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5&limit=1",
// // 			url:"http://data.taipei/opendata/datalist/apiAccess?callback=?",
// 			dataType:"jsonp",
// 			method:"GET",
// // 			jsonpCallback: 'result_jsonp',
// 			jsonp:"processData",
// 			data:{callback:"processData"},
// 			"error":function(x,y,z){
// 						console.log("x"+x);
// 						console.log("y"+y);
// 						console.log("z"+z);
// 					},
// 			"success":function(datas){
// 				console.log("景點資訊"+datas);
// 			}
// 		});
	
	
// 		function processData(data){
// 			alert(data);
// 		}
		
		
		
		
		
		
		
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
						$("#storeName").on('mouseover',function(){
							$("#storeName").css({"cursor":"pointer"});
						});
						$("#storeName").on("click",function(){
				
						    	 $.redirect("Store", { "sID": value.sID});
						});
						
						
					});
					
//	 				使用者縮放地圖時關掉資訊視窗
					google.maps.event.addListener(map, 'zoom_changed', function() {
						    	infoWindow.close();
						   });
//							點擊地圖時關閉資訊視窗
					  google.maps.event.addListener(map, 'click', function() {
						  infoWindow.close();
						  });
					  var content = "<div id='iw-container'>" 
					  + "<div id='storeName' class='iw-title' style='font-size:16px;line-height:20px'><a href='store?s="+value.sID+"' target='_parent' style='color:white;text-decoration:none;' >" 
					  + value.sName + "</a></div>" + "<div class='iw-content'>" 
					  + "<p style='font-size:14px;line-height:20px'>電話號碼：" 
					  + value.sUsername + "</p>" + "<p style='font-size:14px;line-height:20px'>今日營業時間：" 
					  + openTime + "</p>" + "<p style='font-size:14px;line-height:20px'>介紹：" 
					  + value.sIntro + "</p>" + "</div></div>";
						//
//									'<img src="http://maps.marnoto.com/en/5wayscustomizeinfowindow/images/vistalegre.jpg" alt="Porcelain Factory of Vista Alegre" height="115" width="83">'
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
							border : '7px solid #ec6b4c',
							'border-radius' : '13px',
							'box-shadow' : '0 0 5px #ec6b4c'
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
	$(function(){
		
		
			
		})
		
	</script>
							<div id="GoogleMap">
								<div id="map"></div>
							</div>


</body>
</html>