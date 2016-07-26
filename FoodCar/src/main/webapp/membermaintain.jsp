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

<!--版型控制-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/login/css/style.css' type='text/css' media='all' />
<!--橘色header色塊控制與Menu控制-->
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/login/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<script type='text/javascript'
	src="bootstrap/login/js/modernizr.custom.js"></script>
<script src="bootstrap/signin/js/jquery.js"></script>
<!--login-->
<link rel="stylesheet" href="bootstrap/login/css/login.css">
<script src="bootstrap/login/js/jqlogin.js"></script>
<script src="bootstrap/login/js/login.js"></script>

</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">

	<!--Header-->
	<div id="Header" style="background-color: white;">
		<div class="row">
			<div class="small-18 large-12 columns">
				<p></p>
				<p></p>
			</div>
		</div>
	</div>
	<!--/Header-->
	<!--列表bootstrap-->
	<div id="MenuBarPhone" class="menu-phone">
		<div class="row">
			<div class="small-3 columns">
				<div class="top-logo">
					<a class="logo" href="index.html"></a>
				</div>
			</div>
			<div class="small-7 columns">
				<div class="top-search">
					<div class="search-bar">
						<div id="sb-search-phone" class="sb-search">
							<form action="/">
								<img src="images/hand/hand5.jpg" />
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="small-2 columns"></div>
		</div>
	</div>
	<div id="MenuPhone">
		<ul id="menu-mobile">
			<li><a href="stores.jsp">餐車專區</a></li>
			<li><a href="map.jsp">地圖</a></li>
			<li><a href="about.jsp">關於我們</a></li>
			<li><a href="login.jsp">登入</a></li>
		</ul>
	</div>
	<!--/列表bootstrap-->
	<nav class="navbar navbar-fixed-top"> <!--列表-->
	<div class="contain-to-grid">
		<nav class="top-bar" id="TopMenu" data-topbar
			data-options="is_hover: false"> <section
			class="top-bar-section">
		<div class="menu-bar">
			<!--列表左邊-->
			<ul class="left">
				<li>
					<div class="top-logo">
						<a class="logo" href="index.jsp"></a> <a class="logo-text"
							href="index.jsp"></a>
					</div>
				</li>
			</ul>
			<!--/列表左邊-->
			<!--列表右邊頭像-->
			<ul class="right">
				<li class="top-search">
					<div class="search-bar">
						<div id="sb-search" class="sb-search">
							<img src="images/hand/hand5.jpg" />
						</div>
					</div>
				</li>
				<!--/列表右邊頭像-->
				<!--列表右邊list工具列-->
				<li class="side-menu has-dropdown"><a href="#" class="menu"></a>
					<ul class="dropdown">
						<li><a href="stores.jsp">餐車專區</a></li>
						<li><a href="map.jsp">地圖</a></li>
						<li><a href="about.jsp">關於我們</a></li>
						<li><a href="login.jsp">登入</a></li>
					</ul></li>
				<!--/列表右邊list工具列-->
			</ul>
		</div>
		</section> </nav>
	</div>
	<!--/列表--> </nav>
	<div id="MainContent" style="width: 800px; margin: auto">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">

						<h1>${member.mName}</h1>



						<div class="container">
							<form style="width: 800px">
								<ul class="nav nav-pills">
									<li class="active"><a data-toggle="pill" href="#info">資訊</a></li>
									<li><a data-toggle="pill" href="#password">更改密碼</a></li>
									<li><a data-toggle="pill" href="#favories">我的最愛</a></li>

								</ul>
							</form>
							<div class="tab-content">


								<div id="info" class="tab-pane fade in active">

									<form class="form-inline" role="form"
										action="<c:url value='/update.do' />" method="post">
										<p></p>

										<!-- 										<label for="mIMG" style="font-size: 30px">個人頭貼：</label> <input type="text" class="form-control" required autofocus -->
										<%-- 											style="font-size: 15px" value="${mUsername.mIMG}" name="mIMG"></br>  --%>
										<label for="mUsername" name="mUsername"
											style="font-size: 30px">帳號：</label><input type="text"
											class="form-control" required autofocus
											style="font-size: 15px" value="${mUsername.mUsername}"
											name="mUsername"><input type="hidden" name="mID" value="${mUsername.mID}"><br /> <label for="mName"
											style="font-size: 24px">姓名：${mUsername.mName}</label> <input
											type="text" class="form-control" placeholder="若要更改，請輸入"
											required autofocus style="font-size: 15px" name="mName"><br />
										<label for="mAddress" style="font-size: 30px">地址：${mUsername.mAddress}</label>
										<input type="text" class="form-control" placeholder="若要更改，請輸入"
											required autofocus style="font-size: 15px" name="mAddress"><br />
										<label for="mPhone" style="font-size: 30px">電話：${mUsername.mPhone}</label>
										<input type="text" class="form-control" placeholder="若要更改，請輸入"
											required autofocus style="font-size: 15px" name="mPhone"><br />
										<label for="mBirthday" style="font-size: 30px">生日：${mUsername.mBirthday}</label>
										<input type="text" class="form-control" placeholder="若要更改，請輸入"
											required autofocus style="font-size: 15px" name="mBirthday"><br />

										<p></p>
										<div class="checkbox">
											<button class="btn btn-lg btn-primary btn-block"
												type="submit">更改</button>
										</div>
									</form>
								</div>
								<div id="password" class="tab-pane fade">

									<form class="form-inline" style="width: 700px;"
										action="<c:url value='/change.do' />" method="post">
										<p></p>
										<label for="mUsername" name="mUsername"
											style="font-size: 30px">帳號：</label> <input type="text"
											class="form-control" placeholder="請輸入原密碼" required autofocus
											style="font-size: 15px" value="${mUsername.mUsername}"
											name="mUsername"><br /> <br /> <label
											for="mPassword">請輸入原密碼：</label> <input type="text"
											class="form-control" placeholder="請輸入原密碼" required autofocus
											style="font-size: 15px" name="mPassword"><br /> <label
											for="newPassword">請輸入新密碼：</label> <input type="text"
											class="form-control" placeholder="請輸入新密碼" required autofocus
											style="font-size: 15px" name="newPassword"><br /> <label
											for="newAgain">再次輸入新密碼：</label> <input type="text"
											class="form-control" placeholder="請再次輸入新密碼" required
											style="font-size: 15px" name="newAgain"><br />
										<p></p>


										<button class="btn btn-lg btn-primary btn-block" type="submit">更新</button>
									</form>

								</div>
								<div id="favories" class="tab-pane fade">

									<form class="form-inline" role="form"></form>

								</div>

							</div>
						</div>
						<!--內容以上結束-->
					</div>
				</div>
			</div>
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
	<!--menu縮小控制-->
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