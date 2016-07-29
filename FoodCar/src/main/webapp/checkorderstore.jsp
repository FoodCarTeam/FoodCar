<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="apple-itunes-app" content="app-id=634884546" />
<meta name="google-play-app"
	content="app-id=com.blogto.foodtrucks.toronto">
<title>餐餔餔</title>

<!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/about/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/login/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript'
	src="bootstrap/about/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/about/css/bootstrap.min.css" rel="stylesheet" />
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- 選擇性佈景主題 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- 最新編譯和最佳化的 JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link href="bootstrap/about/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/about/js/jquery.js"></script>
<script src="bootstrap/about/js/scrolling-nav.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">

	<jsp:include page="header.jsp"></jsp:include>
	<!--/列表-->
	<div id="MainContent">
		<div class="row">
			<div class="small-12 large-100 columns" style="margin-left: 280px">
				<div class="truck-details">
					<div class="content">
						<h1>我的訂單紀錄</h1>
						<!--內容以下開始-->
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-info">
								訂單紀錄 </a>
							<c:forEach var="bean" items="${orders}">
								<a href="checkdetail?o=${bean.oID }" class="list-group-item">${bean.mName}<div
										class="pull-right date">結帳日期:${bean.saleDate}</div></a>
							</c:forEach>
						
						</div>
                             
						<script type='text/javascript'
							src="DateFormat/jquery-dateFormat.min.js"></script>
						<!-- 	以下為計算日期時間 -->

						<!--內容以上結束-->
					</div>
				</div>
			</div>
		</div>
	</div>

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
		src="bootstrap/about/js/foundation.min.js"></script>
	<script type='text/javascript' src="bootstrap/about/js/app.js"></script>
	<!--MENU縮小-->
	<script type='text/javascript'
		src="bootstrap/about/js/jquery.slicknav.js"></script>
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