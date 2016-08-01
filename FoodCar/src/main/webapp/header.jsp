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
					<a class="logo" href="index.jsp"></a>
				</div>
			</div>
			<div class="small-7 columns">
				<div class="top-search">
					<div class="search-bar">
						<div id="sb-search-phone" class="sb-search">
							<form action="/">
								<c:choose>
									<c:when test="${store!=null}">
										<img src="${store.sLogo}" />
									</c:when>
									<c:when test="${member!=null}">
										<img src="${member.mIMG}" />
									</c:when>
									<c:otherwise>
										<img src="" />
									</c:otherwise>
								</c:choose>
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
						
			<c:choose>
				<c:when test="${store!=null}">
				    <li><a class="animated bounceInUp" href="menuedit?s=${store.sID}"
						style="color: white; font-size: larger">編輯菜單</a></li>
					<li><a class="animated bounceInUp" href="storeinfo.jsp"
						style="color: white; font-size: larger">店家維護</a></li>
				    <li><a class="animated bounceInUp" href="storecheckorder?s=${store.sID}"
						style="color: white; font-size: larger">訂單紀錄</a></li>
				</c:when>
				<c:when test="${member!=null}">
					<li><a class="animated bounceInUp" href="memberinfo.jsp"
						style="color: white; font-size: larger">個人專區</a></li>
					<li><a class="animated bounceInUp" href="memberCheckOrder?m=${member.mID}"
						style="color: white; font-size: larger">點餐紀錄</a></li>
					<li><a href="stores.jsp">餐車專區</a></li>
				</c:when>
				<c:otherwise>
                   <li><a href="stores.jsp">餐車專區</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="map.html">地圖</a></li>
			<li><a href="about.jsp">關於我們</a></li>

			<c:choose>
				<c:when test="${store!=null}">
					<li><a class="animated bounceInUp" href="LogoutServlet"
						style="color: white; font-size: larger">登出</a></li>
				</c:when>
				<c:when test="${member!=null}">
					<li><a class="animated bounceInUp" href="LogoutServlet"
						style="color: white; font-size: larger">登出</a></li>
				</c:when>
				<c:when test="(${store!=null}&&${member!=null}==null)">
					<li><a class="animated bounceInUp" href="login.jsp"
						style="color: white; font-size: larger">登入</a></li>
				</c:when>
			</c:choose>

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
							href="index.html"></a>
					</div>
				</li>
			</ul>
			<!--/列表左邊-->
			<!--列表右邊頭像-->
			<ul class="right">
				<li class="top-search">
					<div class="search-bar">
						<div id="sb-search" class="sb-search">
							<c:choose>
								<c:when test="${store!=null}">
									<img src="${store.sLogo}" />
								</c:when>
								<c:when test="${member!=null}">
									<img src="${member.mIMG}" />
								</c:when>
								<c:otherwise>
									<img src="" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</li>
				<!--/列表右邊頭像-->
				<!--列表右邊list工具列-->
				<li class="side-menu has-dropdown"><a href="#" class="menu"></a>
					<ul class="dropdown">
						<c:choose>
							<c:when test="${store!=null}">
							    <li><a class="animated bounceInUp" href="menuedit?s=${store.sID}"
						            style="color: white;">編輯菜單</a></li>
								<li><a class="animated bounceInUp" href="storeinfo.jsp"
									style="color: white;">店家維護</a></li>
								<li><a class="animated bounceInUp" href="storecheckorder?s=${store.sID}"
									style="color: white;">訂單紀錄</a></li>
							</c:when>
							<c:when test="${member!=null}">
								<li><a class="animated bounceInUp" href="memberinfo.jsp"
									style="color: white;">個人專區</a></li>
								<li><a class="animated bounceInUp" href="memberCheckOrder?m=${member.mID}"
									style="color: white;">點餐紀錄</a></li>
								<li><a href="stores.jsp">餐車專區</a></li>
							</c:when>
							<c:otherwise>
                                <li><a href="stores.jsp">餐車專區</a></li>
                             </c:otherwise>
						</c:choose>
						<li><a href="map.jsp">地圖</a></li>
						<li><a href="about.jsp">關於我們</a></li>
						<c:choose>
							<c:when test="${member!=null}">
								<li><a class="animated bounceInUp" href="LogoutServlet"
									style="color: white;">登出</a></li>
							</c:when>
							<c:when test="${store!=null}">
								<li><a class="animated bounceInUp" href="LogoutServlet"
									style="color: white;">登出</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="animated bounceInUp" href="login.jsp"
									style="color: white;">登入</a></li>
							</c:otherwise>
						</c:choose>


					</ul></li>
				<!--/列表右邊list工具列-->
			</ul>
		</div>
		</section> </nav>
	</div>
	<!--/列表--> </nav>
</body>
</html>