<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
<head>
<style>
#users label {
	font-size: 18px;
}

.zipcode {
background-color: #c00;
/*  	color: #fff;  */
	width: 200px;
	font-size: 12px;
}

.county {
background-color: #4169E1;
/*     color: #fff;  */
	width: 100px;
	font-size: 12px;
}

.district {
	background-color: #008000;
/* 	color: #fff; */
	width: 100px;
	font-size: 12px;
}
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="apple-itunes-app" content="app-id=634884546" />
<meta name="google-play-app"
	content="app-id=com.blogto.foodtrucks.toronto">
<title>餐餔餔</title>
<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>
<!-- <script src="bootstrap/signin/js/jquery.js"></script> -->



<!-- <link rel="stylesheet" media="screen" -->
<!-- 	href="bootstrap/signin/css/bootstrap3.css" /> -->


<link rel="stylesheet"
	href="bootstrap/signin/css/bootstrap.trap.mini.css">


<!-- 自動完成 -->
<link rel="stylesheet"
	href="bootstrap/signin/css/jquery-ui-1.9.2.custom.min.css">



<link rel="stylesheet" href="bootstrap/signin/css/jquery-ui.css">
<!--版型控制-->
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/signin/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/signin/css/style.css' type='text/css' media='all' />
<!--橘色header色塊控制與Menu控制-->




<link rel="stylesheet" type="text/css"
	href="bootstrap/sweetAlert/sweetalert.css">


<link rel="stylesheet" href="bootstrap/signin/css/jquery-ui.css">
<!--login-->
<link rel="stylesheet" href="bootstrap/signin/css/login.css">

<script src="bootstrap/signin/js/jqlogin.js"></script>
<script src="bootstrap/signin/js/login.js"></script>



<link href="bootstrap/signin/css/bootstrap-datetimepicker.css"
	rel=stylesheet>
<link href="bootstrap/comments/css/bootstrap.min.css" rel=stylesheet>


</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">
	<script src="bootstrap/signin/js/pwstrength.js"></script>
	<script src="bootstrap/signin/js/bootstrap-show-password.js"></script>
	<script src="bootstrap/signin/js/jquery.twzipcode.js"></script>

	<script src="bootstrap/signin/js/jquery.easy-autocomplete.js"></script>
	<script src="bootstrap/signin/js/jquery-ui.js"></script>


	<script type="text/javascript">
		$(function() {

			// 			"use strict";
			var options = {};
			options.UserInterface = {
				scores : [ 2, 8, 14, 18, 22 ]
			};
			options.ui = {
				container : "#pwd-container",
				showVerdictsInsideProgressBar : true,
				verdicts : [ "脆弱", "稍弱", "普通", "強度稍高", "強度非常高" ],
				viewports : {
					progress : ".pwstrength_viewport_progress"
				},
			// 				progressBarExtraCssClasses : "progress-bar-striped active"
			};
			options.common = {
				usernameField : "#mUsername",
				// 				debug : true,
				onLoad : function() {
					$('#messages').text('Start typing password');
				}
			};
			$('#mPassword').pwstrength(options);

			$('#mPassword').password();

			$('#twzipcode').twzipcode({
				'css' : [ 'county', 'district', 'zipcode' ],
				'detect' : true,
				"readonly" : true,
				"zipcodeIntoDistrict" : true,
			});
			$(".zipcode").remove();

			$("#mUsername").on("change", function() {

				// 				console.log("mUsername:"+$("#mUsername").val());
				$.ajax({
					"url" : "memberEmailCheckServlet",
					"method" : "POST",
					"data" : {
						"mUsername" : $("#mUsername").val()
					},
					"success" : function(result) {

						console.log("信箱結果：" + result);
						console.log("信箱型態：" + typeof (result));
						if (result == "true") {
							console.log("信箱可用");
							$("#emailCheck").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
						} else {
							console.log("信箱不可用");
							$("#emailCheck").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
						}

					}

				});

			});

			$(":password").on("change", function() {
				var pwd2 = $("#mPassword2").val();
				var pwd1 = $("#mPassword").val();
				// 				console.log("pwd1:"+pwd1);
				// 				console.log("pwd2:"+pwd2);

				if (($("#mPassword").val().length == 0) || ($("#mPassword2").val().length == 0)) {
					$("#pwdCheck2").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
				} else if (pwd1 != pwd2) {
					$("#pwdCheck2").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
				} else {
					$("#pwdCheck2").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
				}

			})

			$("#mName").on("blur", function() {
				var re = new RegExp("^[\u4e00-\u9fa5]{1,3}$", "g");
				// 				var nameCheck="/^[\u4e00-\u9fff]{2,}$/";
				var name = $("#mName").val();
				var result = re.test(name);
				// 				console.log("姓名"+result);
				if (result == true) {
					// 					console.log("姓名成功");
					$("#nameCheck").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
				} else {
					$("#nameCheck").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
				}
			});

			// 			phoneCheck
			$("#mPhone").on('change', function() {
				$.ajax({
					"url" : "memberPhoneCheckServlet",
					"method" : "POST",
					"data" : {
						"mPhone" : $("#mPhone").val()
					},
					"success" : function(result) {
						// 						console.log("電話結果"+result);
						// 						console.log("電話型態"+typeof(result));
						// 						console.log(result.length);
						if (result.trim() == "true") {
							// 							console.log("phone可用");
							$("#phoneCheck").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
						} else {
							// 							console.log("phone不可用");
							$("#phoneCheck").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
						}

					}
				});
			});
			var county;
			var district;
			$(".county").on("change", function() {
				county = $(".county").val();

				// 				$("#mAddress").val("");
				// 				$("#mAddress").val($("#mAddress").val()+county);

			})
			$(".district").on('change', function() {
				district = $(this).val();

				// 				$("#mAddress").val($("#mAddress").val()+district);
			});

			var availableTutorials = [ "ActionScript", "Boostrap", "C", "C++", ];
			// 			 第二個參數傳g
			function Trim(str, is_global) {
				var result;
				result = str.replace(/(^\s+)|(\s+$)/g, "");
				if (is_global.toLowerCase() == "g") {
					result = result.replace(/\s/g, "");
				}
				return result;
			}

			$("#mAddress").on("click", function() {
				var county;
				if ($(".county").val() == '台北市') {
					county = '臺北市';
				}

				$.ajax({
					"method" : "GET",
					"dataType" : "JSON",
					"url" : "TaiwanRoadServlet",
					"contentType" : "application/json;charset=UTF-8",
					"data" : {
						"area" : $(".district").val(),
						"county" : county,
						"roadName" : $("#mAddress").val()
					},
					"success" : function(datas) {
						// 						console.log(typeof(datas));
						// 						轉String
						var a = JSON.stringify(datas);
						// 						console.log(typeof(a));

						var data = Trim(a, "g");
						var b = $.parseJSON(data);
						$("#mAddress").autocomplete({
							source : b
						});
					}
				});

			});

		});
	</script>
	<script src="bootstrap/sweetAlert/sweetalert.min.js"></script>


	<c:if test="${error!=null}">
		<script>
			swal({
				title : '資料有誤',
				html : "<h6 id='m1'>'${error.mUsername}'</h6>" + '<input id="swal-input2" class="swal2-input">',
				preConfirm : function() {
					return new Promise(function(resolve) {
						if (result) {
							resolve([ $('#m1').val(), $('#swal-input2').val() ]);
						}
					});
				}
			}).then(function(result) {
				swal(JSON.stringify(result));
			})
		</script>
	</c:if>


	<jsp:include page="header.jsp"></jsp:include>




	<div id="MainContent" style="width: 800px; margin: auto">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">

						<h1>註冊</h1>

						<div class="container">
							<form>
								<ul class="nav nav-pills">
									<li class="active"><a data-toggle="pill" href="#users"><h4>會員註冊</h4></a></li>
									<li><a data-toggle="pill" href="#stores"><h4>店家註冊</h4></a></li>

								</ul>
							</form>
							<div class="tab-content">












								<!--會員註冊-->
								<div id="users" class="tab-pane fade in active">
									<form class="form-inline" role="form"
										action="<c:url value="/MembersSignin" />" method="POST"
										enctype="multipart/form-data">

										<div class="form-group">
											<p></p>
											<label for="focusedInput">信箱:</label> <input
												class="form-control" id="mUsername" type="text"
												placeholder="" required style="font-size: 15px"
												name="mUsername" value="${param.mUsername}"><span
												id='emailCheck' style="margin-left: 10px; font-size: 20px"
												class=''></span>
										</div>
										<p></p>
										<div class="form-group" id='pwd-container'>
											<label for="focusedInput">密碼:</label> <input
												class="form-control" id="mPassword" type="password"
												placeholder="" required style="font-size: 15px"
												name="mPassword" value="${param.mPassword}" /><span
												id='pwdCheck' style="margin-left: 10px; font-size: 20px"
												class=''></span>

											<div class="form-group">
												<label for="focusedInput">密碼確認:</label> <input
													class="form-control" id="mPassword2" type="password"
													placeholder="" required style="font-size: 15px"
													data-toggle="password" name="mPassword2"
													value="${param.mPassword}"><span id='pwdCheck2'
													style="margin-left: 10px; font-size: 20px" class=''></span>
											</div>




											<div class="col-sm-12 col-sm-offset-0">
												<div class="pwstrength_viewport_progress">
													<!-- 													<div class="progress"> -->
													<!-- 														<div  -->
													<!-- 															class="progress-bar-striped active progress-bar progress-bar-danger" -->
													<!-- 															style="width: 1%;"> -->
													<!-- 															<span class="password-verdict"></span> -->
													<!-- 														</div> -->
													<!-- 													</div> -->
												</div>
											</div>
										</div>




										<p></p>
										<div class="form-group">
											<label for="focusedInput">姓名:</label> <input
												class="form-control" id="mName" type="text" placeholder=""
												required style="font-size: 15px" name="mName"
												value="${param.mName}"><span id='nameCheck'
												style="margin-left: 10px; font-size: 20px" class=''></span>
										</div>

										<p></p>

										<div class="form-group">
											<label for="focusedInput" for='mPhone'>電話:</label> <input
												class="form-control" id="mPhone" type="text" placeholder=""
												required style="font-size: 15px" name="mPhone"
												value="${param.mPhone}"><span id='phoneCheck'
												style="margin-left: 10px; font-size: 20px" class=''></span>
										</div>
										<p />


										<div class="form-group">
											<label for='mBirthday' style="vertical-align: sub;">生日:</label>
											<a data-toggle="toolTipName"
												title="${errorMessage.dateError}" data-placement="top">
												<div class="input-group date form_date col-md-15"
													data-date-format="yyyy-mm-dd">
													<input style="font-size: 15px" class="form-control"
														size="16" type="text" value="${param.mBirthday}"
														readonly="" id="mBirthday" name="mBirthday"> <span
														class="input-group-addon"><span
														class="glyphicon glyphicon-remove"></span></span> <span
														class="input-group-addon"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</a>
										</div>





										<script src="bootstrap/signin/js/bootstrap-datetimepicker.js"></script>
										<script
											src="bootstrap/signin/js/bootstrap-datetimepicker.zh-TW.js"
											charset="UTF-8"></script>

										<script type="text/javascript">
											$('.form_datetime').datetimepicker({
												language : 'zh-TW',
												weekStart : 1,
												todayBtn : 0,
												autoclose : 1,
												todayHighlight : 1,
												startView : 4,
												forceParse : 0,
												showMeridian : 1
											});
											$('.form_date').datetimepicker({
												language : 'zh-TW',
												weekStart : 1,
												todayBtn : 0,
												autoclose : 1,
												todayHighlight : 1,
												startView : 4,
												minView : 2,
												forceParse : 0
											});
											$('.form_time').datetimepicker({
												language : 'zh-TW',
												weekStart : 1,
												todayBtn : 0,
												autoclose : 1,
												todayHighlight : 1,
												startView : 4,
												minView : 0,
												maxView : 1,
												forceParse : 0
											});
										</script>




										<p></p>



										<label for="focusedInput">地址:</label>



										<div id="twzipcode"></div>



										<input class="form-control" id="mAddress" type="text"
											placeholder="" style="width: 450px" name="mAddress"
											value="${param.mAddress}">
										<div class="form-group">
											<p></p>

										</div>
								</div>
								<p></p>
								<label for="exampleInputFile">大頭貼檔案上傳</label> <input type="file"
									id="mIMG" name="mIMG" value="${param.mIMG}">
								<p></p>
								<script src='https://www.google.com/recaptcha/api.js'></script>
								<div class="g-recaptcha" name='g-recaptcha-response'
									data-sitekey="6LdaHCYTAAAAADKKfv9KbG7Rvcv3iqzORL_9Suq8"></div>

								<p></p>
								<!-- <button type="submit" class="btn btn-success" name="Members">申請</button>    -->


								<p></p>
								<input class="btn btn-success" type="submit" name="Members"
									value="申請">


								</form>
							</div>

							<!--/會員註冊-->

							<!--/店家註冊-->
							<div id="stores" class="tab-pane fade">
								<form class="form-inline" role="form"
									action="<c:url value='/Signin.controller' />" method="get">
									<div class="form-group">
										<p></p>
										<label for="focusedInput">帳號:</label> <input
											class="form-control" id="sUsername" type="text"
											placeholder="請輸入手機為帳號" required style="font-size: 15px"
											name="sUsername" value="${param.sUsername}">
									</div>
									<p></p>
									<div class="form-group">
										<label for="focusedInput">密碼:</label> <input
											class="form-control" id="sPassword" type="text"
											placeholder="請輸入密碼" required style="font-size: 15px"
											name="sPassword" value="${param.sPassword}">
									</div>
									<p></p>
									<div class="form-group">
										<label for="focusedInput">店名:</label> <input
											class="form-control" id="sName" type="text"
											placeholder="請輸入店名" required style="font-size: 15px"
											name="sName" value="${param.sName}">
									</div>
									<p></p>
									<div class="form-group">
										<label for="focusedInput">名字:</label> <input
											class="form-control" id="sBossName" type="text"
											placeholder="請輸入名字" required style="font-size: 15px"
											name="sBossName" value="${param.sBossName}">
									</div>
									<p></p>

									<div class="form-group">
										<label for="focusedInput">資訊:</label> <input
											class="form-control" id="sIntro" type="text"
											placeholder="請輸入店家資訊" required style="font-size: 15px"
											name="sIntro" value="${param.sIntro}">
									</div>
									<p></p>
									<input class="btn btn-success" type="submit" name="Stores"
										value="申請">
									<!-- <button type="button" class="btn btn-success" name="Stores" value="Insert">申請</button>
 -->

								</form>

							</div>


						</div>
					</div>
					<!--..............................................-->

				</div>
			</div>
		</div>
	</div>
	</div>

	<!--       <script type='text/javascript' src="bootstrap/js/app.js"></script> -->
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
	<!--menu縮小控制-->
	<script type='text/javascript'
		src="bootstrap/signin/js/foundation.min.js"></script>
	<script type='text/javascript' src="bootstrap/signin/js/app.js"></script>
	<script type='text/javascript'
		src="bootstrap/signin/js/jquery.slicknav.js"></script>
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