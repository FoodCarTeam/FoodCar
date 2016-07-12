<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="add-to-cart/css/reset.css">
<!-- CSS reset -->

<link rel="stylesheet" href="add-to-cart/css/style.css">
<!-- Resource style -->



<!-- 選擇性佈景主題 -->
<link rel="stylesheet"
	href="bootstrap/css/bootstrap-theme.min.css">

<!-- 最新編譯和最佳化的 JavaScript -->
<script
	src="bootstrap/js/bootstrap.min.js"></script>
<title>${select.sName}</title>
</head>
<body>
	<main class="row"> 
	<c:forEach var="bean" items="${Menus}">
		<div class="col-sm-3">
			<img src="${bean.foodIMG }" class="img-rounded"/>
			<span>${bean.foodName}</span>
			<span>$${bean.unitPrice }</span>
			<p>
			<a href="#0" class="cd-add-to-cart" data-price="${bean.unitPrice }"
			data-name="${bean.foodName}" data-image="${bean.foodIMG}">加入購物車</a>
		</div>
	</c:forEach> 
	</main>

	<div class="cd-cart-container empty">
		<a href="#0" class="cd-cart-trigger"> Cart
			<ul class="count">
				<!-- cart items count -->
				<li>0</li>
				<li>0</li>
			</ul> <!-- .count -->
		</a>

		<div class="cd-cart">
			<div class="wrapper">
				<header>
				<h2>購物車</h2>
				<span class="undo">刪除物品 <a href="#0">恢復</a></span> </header>

				<div class="body">
					<ul>
						<!-- products added to the cart will be inserted here using JavaScript -->
					</ul>
				</div>

				<footer> <a href="#0" class="checkout btn"><em>結帳
						- $<span>0</span>
				</em></a> </footer>
			</div>
		</div>
		<!-- .cd-cart -->
	</div>
	<!-- cd-cart-container -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
		if (!window.jQuery)
			document
					.write('<script src="jquery/jquery-3.0.0.min.js"><\/script>');
	</script>
	<script src="add-to-cart/js/main.js"></script>
	<!-- Resource jQuery -->
</body>
</html>