<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		id="top-nav">
		<div class="container">
			<div class="navbar-header">
				<!-- Logo Starts -->
				<a class="navbar-brand" href="index.jsp"><img
					class="animated bounceInUp" src="index/images/logo.png" alt="logo"></a>
				<!-- #Logo Ends -->


				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>





			<!-- Nav Starts -->
			<div class="navbar-collapse  collapse">
				<ul class="nav navbar-nav navbar-right scroll">


					<c:choose>
						<c:when test="${store!=null}">
							<li><a class="animated bounceInUp" href="login.jsp"
								style="color: white; font-size: larger">${store.sName}老闆您好！</a></li>
						</c:when>
						<c:when test="${member!=null}">
							<li><a class="animated bounceInUp" href="LogoutServlet"
								style="color: white; font-size: larger">${member.mName}您好！</a></li>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>


					<li><a class="animated bounceInUp" href="stores.jsp"
						style="color: white; font-size: larger">餐車專區</a></li>
					<li><a class="animated bounceInUp" href="map.html"
						style="color: white; font-size: larger">地圖</a></li>
					<li><a class="animated bounceInUp" href="about.jsp"
						style="color: white; font-size: larger">關於我們</a></li>

					<c:choose>
						<c:when test="${store!=null}">
							<li><a class="animated bounceInUp" href="login.jsp"
								style="color: white; font-size: larger">登出</a></li>
								<script>
								
								
								
								
								</script>								
						
		
						</c:when>
						<c:when test="${member!=null}">
							<li><a class="animated bounceInUp" href="LogoutServlet"
								style="color: white; font-size: larger">登出</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="animated bounceInUp" href="login.jsp"
								style="color: white; font-size: larger">登入</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<!-- #Nav Ends -->

		</div>
	</div>
</body>
</html>