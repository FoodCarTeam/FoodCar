<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐餔餔</title>
<link rel="shortcut icon" href="images/tools/logo.png"> 
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&libraries=places&callback=initMap"></script>
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>

<link rel='stylesheet' href='bootstrap/map/css/showFoodCarsMap.css' type='text/css' media='all' />
<!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/map/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/map/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript' src="bootstrap/map/js/modernizr.custom.js"></script>

<!--list浮動-->
<link href="bootstrap/map/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/map/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/map/js/jquery.js"></script>
<script src="bootstrap/map/js/scrolling-nav.js"></script>

</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">

<jsp:include page="header.jsp"></jsp:include>
<script type='text/javascript' src="bootstrap/js/jquery.redirect.js"></script>  
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
					  + "<div id='storeName' class='iw-title' style='font-size:16px;line-height:20px'>" 
					  + value.sName + "</div>" + "<div class='iw-content'>" 
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
<script type="text/javascript" src="bootstrap/js/jquery.unveil.js"></script>
	<script type="text/javascript" src="bootstrap/js/page.js"></script>
	<div id="MainContent">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">
						<h1>
							地圖 
						</h1>



				<!--/地圖-->
<!-- 							<iframe frameBorder="0" style="width:1000px;height:600px" src="http://foodcar.southeastasia.cloudapp.azure.com:8080/FoodCar/showMap.jsp"></iframe> -->
							<iframe frameBorder="0" style="width:1000px;height:600px" src="http://localhost:8080/FoodCar/showMap.jsp"></iframe>
										
<!-- 							<div id="GoogleMap"> -->
<!-- 								<div id="map"></div> -->
<!-- 							</div> -->
						<!--/地圖-->
					</div>
				</div>
				<!--/truck-details-->
			</div>
			<!--/small-12 large-8 columns-->

			<!--/sidebar-->
		</div>
		<!--/row-->
	</div>
	<!--/MainContent-->



	<!-- Footer -->
	<div id="SecondFooter">
		<div class="row">
			<div class="small-12 medium-6 large-8 columns">
				<div class="footer-links">
					<p>© 2016 Freshdaily Inc. All rights reserved.</p>
				</div>
			</div>

		</div>
	</div>
	<!-- /Footer -->

       <script type='text/javascript' src="bootstrap/map/js/foundation.min.js"></script>
      <script type='text/javascript' src="bootstrap/map/js/app.js"></script>
      <!--MENU縮小-->
    <script type='text/javascript' src="bootstrap/map/js/jquery.slicknav.js"></script>    
      <script type="text/javascript">
        $(document).ready(function () {
            $('#menu-mobile').slicknav({
                label: '',
                prependTo: '#MenuPhone'
            }); 
        });
    </script>

</body>
</html>