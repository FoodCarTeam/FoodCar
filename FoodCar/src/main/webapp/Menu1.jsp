<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="apple-itunes-app" content="app-id=634884546"/>
    <meta name="google-play-app" content="app-id=com.blogto.foodtrucks.toronto">    
    <title>餐餔餔</title>  
     
<!--CSS-->
<link rel="stylesheet" href="add-to-cart/css/reset.css">
<link rel="stylesheet" href="add-to-cart/css/style.css">  
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/css/style.css' type='text/css' media='all' />

<!--JS-->
<script type='text/javascript' src="bootstrap/js/modernizr.custom.js"></script>
<!--list浮動-->   
      <script src="bootstrap/js/jquery.js"></script>
  </head>
  <body class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">  
  
<!--Header-->
      <div id="Header" style="background-color:white;" >
      <div class="row">
        <div class="small-18 large-12 columns"><p></p><p></p>
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
          <div class="small-2 columns">
          </div>
        </div>
    </div>
    <div id="MenuPhone">
      <ul id="menu-mobile">
         <li><a href="Stores.html">餐車專區</a></li>
         <li><a href="map.html">地圖</a></li>
         <li><a href="about.html">關於我們</a></li>
         <li><a href="login.html">登入</a></li>
      </ul>
    </div>
<!--/列表bootstrap-->
        <nav class="navbar navbar-fixed-top" >
   <!--列表-->
    <div class="contain-to-grid">
      <nav class="top-bar" id="TopMenu" data-topbar data-options="is_hover: false">
        <section class="top-bar-section">
          <div class="menu-bar">
<!--列表左邊-->
            <ul class="left">
              <li>
                <div class="top-logo">
                  <a class="logo" href="index.html"></a>
                  <a class="logo-text" href="index.html"></a>
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
              <li class="side-menu has-dropdown">
                <a href="#" class="menu"></a>
                <ul class="dropdown">
                  <li><a href="Stores.html">餐車專區</a></li>
                  <li><a href="map.html">地圖</a></li>
                  <li><a href="about.html">關於我們</a></li>
                  <li><a href="login.html">登入</a></li>
                </ul>
              </li>
<!--/列表右邊list工具列-->
            </ul>
          </div>
        </section>
      </nav>
    </div>
<!--/列表-->
            </nav>
<div id="MainContent">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
          <h1>
           ${select.sName }    <a class="book-button">不知道幹嘛的按鈕</a>
          </h1>
        
        <!--這裡開始喔~~-->
        
        <main class="row"> 
	<c:forEach var="bean" items="${Menus}">
		<div class="  large-3 columns end">
			<img src="${bean.foodIMG }" class="img-rounded"/>
			<span style="font-size:18px">${bean.foodName}</span>
			<span style="font-size:18px">$${bean.unitPrice }</span>
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
				<h2 >購物車</h2>
				<span class="undo" >刪除物品 <a href="#0" >恢復</a></span> </header>

				<div class="body">
					<ul>
						<!-- products added to the cart will be inserted here using JavaScript -->
					</ul>
				</div>

				<footer> <a href="#0" class="checkout btn" style="font-size:22px"><em>結帳
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
        
        <!--這裡結束喔~~-->
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
      <script type='text/javascript' src="bootstrap/js/jquery.slicknav.js"></script>    
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
