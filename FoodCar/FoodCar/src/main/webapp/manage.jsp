<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="apple-itunes-app" content="app-id=634884546" />
<meta name="google-play-app"
	content="app-id=com.blogto.foodtrucks.toronto">
<title>餐餔餔</title>
<link rel="shortcut icon" href="images/tools/logo.png"> 
<!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/login/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/login/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript'
	src="bootstrap/login/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/login/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/login/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/login/js/jquery.js"></script>
<script src="bootstrap/login/js/scrolling-nav.js"></script>
<!--login-->
<link rel="stylesheet" href="bootstrap/login/css/login.css">
<script src="bootstrap/login/js/jqlogin.js"></script>
<script src="bootstrap/login/js/login.js"></script>


</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">

   <jsp:include page="header.jsp"></jsp:include>


	<div id="MainContent" style="width: 800px; margin: auto">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">

						<h1>
							${LoginOK.managerName}
						</h1>



						<div class="container">
							<form style="width: 800px">
								<ul class="nav nav-pills">
									<li><a data-toggle="pill" href="#storehow"><h4>店家審核</h4></a></li>
									<li><a data-toggle="pill" href="#commenthow"><h4>留言管理</h4></a></li>
									<li class="active"><a data-toggle="pill" href="#boss"><h4>登入管理</h4></a></li>

								</ul>
							</form>
							<div class="tab-content">


								<div id="storeshow" class="tab-pane fade">

									<form class="form-signin" style="width: 700px;">
										<p></p>

										<label for="inputEmail" class="sr-only">請輸入帳號E-mail</label> <input
											type="email" id="inputEmail" class="form-control"
											placeholder="請輸入E-mail" required autofocus
											style="font-size: 15px"> <label for="inputPassword"
											class="sr-only">請輸入密碼</label> <input type="password"
											id="inputPassword" class="form-control" placeholder="請輸入密碼"
											required style="font-size: 15px">

										<div class="checkbox">
											<label> <input type="checkbox" value="remember-me">
												記住密碼
											</label>
										</div>
										<button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
									</form>

								</div>
								<div id="commenthow" class="tab-pane fade">

									<form class="form-signin" style="width: 700px;">
										<p></p>

										<label for="" class="sr-only">請輸入手機號碼</label> <input
											type="text" class="form-control" placeholder="請輸入手機號碼"
											required autofocus style="font-size: 15px"> <label
											for="inputPassword" class="sr-only">請輸入密碼</label> <input
											type="password" id="Password1" class="form-control"
											placeholder="請輸入密碼" required style="font-size: 15px">

										<div class="checkbox">
											<label> <input type="checkbox" value="remember-me">
												記住密碼
											</label>
										</div>
										<button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
									</form>

								</div>
								<div id="boss" class="tab-pane fade in active">

									<form class="form-signin" style="width: 700px;" 
										action="<c:url value='/manageLogin' />" method="post">
										<p></p>
										<label for="inputAccount" class="sr-only">請輸入帳號</label> <input type="text"
											class="form-control" placeholder="請輸入帳號" required autofocus
											style="font-size: 15px" name="managerUser" value="${param.managerUser}">
										<p>${error.managerUser}</p>
										<label for="inputPassword" class="sr-only">請輸入密碼</label> <input type="text" 
											class="form-control" placeholder="請輸入密碼" required autofocus
											style="font-size: 15px" name="managerPass" value="${param.managerPass}">
										<p>${error.managerPass}</p>
										<div class="checkbox">
											<label> <input type="checkbox" value="remember-me">記住密碼
											</label>
										</div>
										<button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
									</form>

								</div>


							</div>
						</div>







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
		src="bootstrap/login/js/foundation.min.js"></script>
	<script type='text/javascript' src="bootstrap/login/js/app.js"></script>
	<!--MENU縮小-->
	<script type='text/javascript'
		src="bootstrap/login/js/jquery.slicknav.js"></script>
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