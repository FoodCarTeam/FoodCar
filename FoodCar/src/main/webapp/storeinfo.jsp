<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐餔餔</title>
<!-- <script -->
<!-- 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap" -->
<!-- 	async defer></script> -->

<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="bootstrap/sweetAlert/sweetalert.css">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet"><!--選擇器外框-->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"><!--太陽.月亮圖片-->

<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.2.17/jquery.timepicker.min.css" /><!--時間list版型-->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/rainbow.min.js" type="text/javascript"></script>
<script type="text/javascript" src="bootstrap/user/js/businessHours.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/user/css/businessHours.css"/>
	

<!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/user/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/user/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<!-- mobile menu style.css -->
<!--JS-->
<script type='text/javascript'
	src="bootstrap/user/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/user/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/user/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/user/js/jquery.js"></script>
<script src="bootstrap/user/js/scrolling-nav.js"></script>

<!-- 以下這個讓google可能失效 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style type="text/css">
/* USER PROFILE PAGE */
.card {
	margin-top: 20px;
	padding: 30px;
	background-color: rgba(214, 224, 226, 0.2);
	-webkit-border-top-left-radius: 5px;
	-moz-border-top-left-radius: 5px;
	border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-top-right-radius: 5px;
	border-top-right-radius: 5px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.card.hovercard {
	position: relative;
	padding-top: 0;
	overflow: hidden;
	text-align: center;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 1);
}

.card.hovercard .card-background {
	height: 130px;
}

.card-background img {
	-webkit-filter: blur(25px);
	-moz-filter: blur(25px);
	-o-filter: blur(25px);
	-ms-filter: blur(25px);
	filter: blur(25px);
	margin-left: -100px;
	margin-top: -200px;
	min-width: 130%;
}

.card.hovercard .useravatar {
	position: absolute;
	top: 15px;
	left: 0;
	right: 0;
}

.card.hovercard .useravatar img {
	width: 100px;
	height: 100px;
	max-width: 100px;
	max-height: 100px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	border: 5px solid rgba(255, 255, 255, 0.5);
}

.card.hovercard .card-info {
	position: absolute;
	bottom: 14px;
	left: 0;
	right: 0;
}

.card.hovercard .card-info .card-title {
	padding: 0 5px;
	font-size: 20px;
	line-height: 1;
	color: #262626;
	background-color: rgba(255, 255, 255, 0.1);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

.card.hovercard .card-info {
	overflow: hidden;
	font-size: 12px;
	line-height: 20px;
	color: #737373;
	text-overflow: ellipsis;
}

.card.hovercard .bottom {
	padding: 0 20px;
	margin-bottom: 17px;
}

.btn-pref .btn {
	-webkit-border-radius: 0 !important;
}

#GoogleMap {
	height: 80%;
	width: 90%;
	margin: auto;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>


<script type="text/javascript">
// 	window.alert = function() {
// 	};
	var defaultCSS = document.getElementById('bootstrap-css');
	function changeCSS(css) {
		if (css)
			$('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="' + css + '" type="text/css" />');
		else
			$('head > link').filter(':first').replaceWith(defaultCSS);
	}
	$(document).ready(function() {
		var iframe_height = parseInt($('html').height());
		window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
	});

	$(function() {
		$.ajax({
			"method" : "GET",
			"url" : "ifreamServletURL",
			// 			"dataType" : "JSON",

			"success" : function(datas) {
// 				console.log("成功");

			}
		});

	});

	$(function() {
		$.ajax({
			"method" : "GET",
			"url" : "ifreamServletURL",
			// 			"dataType" : "JSON",
			"data" : {
				"sID" : '${store.sID}'
			},
			"success" : function(datas) {
// 				console.log("傳sID成功");

			}
		});

	});

	
</script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.2.17/jquery.timepicker.min.js"></script><!--時間list-->
 <script type="text/javascript" src="bootstrap/user/js/businessHours.js"></script>
 <script src="bootstrap/sweetAlert/sweetalert.min.js"></script>
<script>
$(function() {

	var a=$("#businessHoursContainer3").businessHours(
			{
				postInit : function() {
					$('.operationTimeFrom, .operationTimeTill').timepicker({
						'timeFormat' : 'H:i',
						'step' : 15
					});
				},
				dayTmpl : '<div class="dayContainer" style="width: 80px;">' + 
							'<div data-original-title="" class="colorBox"><input type="checkbox" class="invisible operationState"></div>' + '<div class="weekday"></div>' + '<div class="operationDayTimeContainer">'
						+ '<div id="test1" class="operationTime input-group"><span class="input-group-addon"><i class="fa fa-sun-o"></i></span><input id="test2" type="text" name="startTime" class="mini-time form-control operationTimeFrom" value=""></div>'
						+ '<div class="operationTime input-group"><span class="input-group-addon"><i class="fa fa-moon-o"></i></span><input type="text" name="endTime" class="mini-time form-control operationTimeTill" value=""></div>' + '</div></div>'
			});

	
	
	$("#timeCheck").on('click',function(){
		
		console.log('${store.sID}')
		$.ajax({
			"method":"POST",
			"url":"StoreOpenTimeServlet",
			"contentType":"application/json;charset=UTF-8",
			"data": JSON.stringify(a.serialize()),
			"success":function(){
				
// 				swal({
// 					  title: '營業時間變更成功囉!', 
// 					  confirmButtonText:"確定"
// 					})
				
				
				
				
			}
		});
		
		
		
		
		
	});
	
	
	
});
</script>
<script>
$(function(){
	

	
	
});
</script>




</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">


	<jsp:include page="header.jsp"></jsp:include>


	<div id="MainContent" style="width: 800px; margin: auto">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">


						<div class="col-lg-14 col-sm-14">
							<div class="card hovercard">
								<div class="card-background">
									<img class="card-bkimg" alt="" src="${store.sLogo }">

								</div>
								<div class="useravatar">
									<img alt="" src="${store.sLogo }">
								</div>
								<div class="card-info">
									<span class="card-title">${store.sName}</span>

								</div>
							</div>
							<div class="btn-pref btn-group btn-group-justified btn-group-lg"
								role="group" aria-label="...">
								<div class="btn-group" role="group">
									<button type="button" id="stars" class="btn btn-primary"
										href="#tab1" data-toggle="tab">
										<span class="glyphicon glyphicon-star"
											style="width: 20px; height: 20px" aria-hidden="true"></span>
										<div class="hidden-xs">基本資料</div>
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" id="orders" class="btn btn-default"
										href="#tab2" data-toggle="tab">
										<img style="width: 20px; height: 20px"
											src='images/MapIcon/open.png' />
										<div class="hidden-xs">位置變更</div>
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" id="following" class="btn btn-default"
										href="#tab3" data-toggle="tab">
										<span class="glyphicon glyphicon-user"
											style="width: 20px; height: 20px" aria-hidden="true"></span>
										<div class="hidden-xs">變更密碼</div>
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" id="following" class="btn btn-default"
										href="#tab4" data-toggle="tab">
										<span class="glyphicon glyphicon-user"
											style="width: 20px; height: 20px" aria-hidden="true"></span>
										<div class="hidden-xs">營業時間</div>

									</button>
								</div>

							</div>

							<div class="well">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab1">
										<form class="form-inline" role="form"
											action="<c:url value='/storeUpdate.do' />" method="post">
											<p></p>

											<input type="hidden" name="sID" value="${store.sID}"><br />
											<label for="sName" style="font-size: 20px">店名：${store.sName}</label><br />
											<input type="text" class="form-control"
												placeholder="若要更改，請輸入" required autofocus
												style="font-size: 15px" name="sName"><br /> <label
												for="sBossName" style="font-size: 20px">老闆姓名：${store.sBossName}</label><br />
											<input type="text" class="form-control"
												placeholder="若要更改，請輸入" required autofocus
												style="font-size: 15px" name="sBossName"><br /> <label
												for="sIntro" style="font-size: 20px">介紹：</label><br />
											<textarea cols="50" rows="3" type="textarea"
												class="form-control" required autofocus
												style="font-size: 15px; resize: none" name="sIntro">${store.sIntro}</textarea>
											<br /> <a href='storecheckorder?s=${store.sID}'
												class="btn btn-warning"> 訂單紀錄</a>

											<p></p>
											<div class="checkbox">
												<button class="btn btn-lg btn-primary btn-block"
													type="submit">更改</button>
											</div>
										</form>
									</div>
									<div class="tab-pane fade in" id="tab2">
										<h3>變更位置</h3>

										<div id="GoogleMap"></div>
										<iframe frameBorder="0" style="width: 700px; height: 500px"
											src="http://localhost:8080/FoodCar/storeLocation.jsp"></iframe>




									</div>
									<div class="tab-pane fade in" id="tab3">
										<!--           <h3>變更密碼:</h3> -->
										<form class="form-inline" style="width: 700px;"
											action="<c:url value='/storechange.do' />" method="post">

											<input type="hidden" class="form-control"
												placeholder="請輸入原密碼" required autofocus
												style="font-size: 15px" value="${store.sUsername}"
												name="sUsername"><br /> <br /> <label
												for="sPassword" style="font-size: 15px">請輸入原密碼：</label><br />
											<input type="password" class="form-control"
												placeholder="請輸入原密碼" required autofocus
												style="font-size: 15px" name="sPassword"><br /> <label
												for="newPassword" style="font-size: 15px">請輸入新密碼：</label><br />
											<input type="password" class="form-control"
												placeholder="請輸入新密碼" required autofocus
												style="font-size: 15px" name="newPassword"><br /> <label
												for="newAgain" style="font-size: 15px">再次輸入新密碼：</label><br />
											<input type="password" class="form-control"
												placeholder="請再次輸入新密碼" required style="font-size: 15px"
												name="newAgain"><br />
											<p></p>

											<button class="btn btn-lg btn-primary btn-block"
												type="submit">更新</button>
										</form>
									</div>
									<div class="tab-pane fade in" id="tab4" style="height:200px ">
										<h3>營業時間:</h3>
										<div id="businessHoursContainer3"></div>
										
										<div  style="float: left;clear:both"> <button id='timeCheck' type="button" class="btn btn-primary ">確定送出</button></div>
									
									</div>
								</div>
									
							</div>

						</div>


						<script type="text/javascript">
							$(document).ready(function() {
								$(".btn-pref .btn").click(function() {
									$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
									// $(".tab").addClass("active"); // instead of this do the below 
									$(this).removeClass("btn-default").addClass("btn-primary");
								});
							});
						</script>



					</div>
					<!--/truck-details-->
				</div>
				<!--/small-12 large-8 columns-->

				<!--/sidebar-->
			</div>
			<!--/row-->
		</div>
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
	<script type='text/javascript'
		src="bootstrap/user/js/foundation.min.js"></script>
	<script type='text/javascript' src="bootstrap/user/js/app.js"></script>
	<!--MENU縮小-->
	<script type='text/javascript'
		src="bootstrap/user/js/jquery.slicknav.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#menu-mobile').slicknav({
				label : '',
				prependTo : '#MenuPhone'
			});
		});
	</script>
</body>
</html>