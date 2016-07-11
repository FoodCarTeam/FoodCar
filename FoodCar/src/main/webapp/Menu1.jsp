<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='http://fonts.googleapis.com/css?family=Work+Sans:400,600,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="QuickAddToCart/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="QuickAddToCart/css/style.css"> <!-- Resource style -->
	<script src="QuickAddToCart/js/modernizr.js"></script> <!-- Modernizr -->
  	
	<title>${select.sName}</title>
</head>
<body>
	<header>
		<h1>${select.sName}</h1>	
	</header>

	<a href="#0" class="cd-cart">
		<span>0</span>
	</a>

	<ul class="cd-gallery">
	<c:forEach var="bean" items="${Menus}">
	    <script>
	       console.log(${bean.foodID})
	    </script>
		<li>
			<div class="cd-single-item">
				<a href="#0">
					<ul class="cd-slider-wrapper">
						
						<li class="selected"><img src="${bean.foodIMG }" alt="Preview image"></li>
					
					</ul>
				</a>

				<div class="cd-customization">
					
					
					<div class="size" data-type="select">
						<ul>
							
							<li class="medium">1</li>
							<li class="medium">2</li>
							<li class="large">3</li>
							<li class="large">4</li>
							<li class="large">5</li>
						</ul>
					</div>
<!--                     <select> -->
<!--                       <option>111</option> -->
<!--                     </select> -->
					<button class="add-to-cart">
						<em>Add to Cart</em>
						<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
							<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
						</svg>
					</button>
				</div> <!-- .cd-customization -->

				<button class="cd-customization-trigger">Customize</button>
			</div> <!-- .cd-single-item -->

			<div class="cd-item-info">
				<b><a href="#0">${bean.foodName}</a></b>
				<em>$${bean.unitPrice }</em>
			</div> <!-- cd-item-info -->
		</li>
     </c:forEach>
	</ul> <!-- cd-gallery -->
<script src="QuickAddToCart/js/jquery-2.1.4.js"></script>
<script src="QuickAddToCart/js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>





<%-- <c:forEach var="bean" items="${Menus}"> --%>
<%--    <h3>${bean.foodName }</h3> --%>
<%-- </c:forEach> --%>