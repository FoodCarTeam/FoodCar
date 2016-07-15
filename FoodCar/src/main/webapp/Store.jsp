<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/stores/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/stores/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript' src="bootstrap/stores/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/stores/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/stores/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/stores/js/jquery.js"></script>
<script src="bootstrap/stores/js/scrolling-nav.js"></script>

  <script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap"></script>
  
  
  
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
         <li><a href="stores.html">餐車專區</a></li>
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
                  <li><a href="stores.html">餐車專區</a></li>
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

<script type="text/javascript" src="bootstrap/js/jquery.unveil.js"></script>
<script type="text/javascript" src="bootstrap/js/page.js"></script>
<div id="MainContent">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
          <h1>
            ${select.sName}   <a class="book-button">點餐</a>
          </h1>
<script type='text/javascript' src="bootstrap/js/jquery.redirect.js"></script>          
<script>
    $('.book-button').on('click',function(){
    	$.redirect("Menu", { "sID": ${select.sID} });
    });
</script>
          <div class="article text">
          	<p><img class="alignnone size-full wp-image-8737"  src="${select.sLogo }" width="2048" height="1365" /></p>
<p>簡介:</p>
<p>
    ${select.sIntro }
</p>
          </div>


            <!--地圖-->
          <div class="schedule">
                        <div class="row">
              <div class="small-12 medium-5 large-50 columns">
                <h2>地圖</h2>
              </div>
              
            </div>
                                                <div class="open row">
              <div class="small-12 medium-5 large-5 columns">
                <h3>Today, July 4th</h3>
              </div>
              
              <div class="small-12 medium-7 large-7 columns">
                <div class="right">
                  <div class="clock"></div><span>11:00 AM to 3:00 PM</span>
                </div>
              </div>
            </div>
            <div id="GoogleMap">
            
             <div class="map" style="height: auto;">
<!--              width="100%" height="200" frameborder="0" style="display: none; border: 0; -->
<!-- 				<div style="width:600px;margin:auto;"> -->
              <img style="max-width:990px;max-height:300px;margin:auto;" src='http://maps.googleapis.com/maps/api/staticmap?center=25.033681,121.564726&zoom=16&size=1000x300&scale=2&markers=25.033681,121.564726&key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A'/>
<!--              	</div> -->
              <p><img  class="map-unveil" data-src="http://torontofoodtrucks.ca/wp-content/themes/foodtrucks/images/menu-icon.png" style="position: absolute;" />
            </p>
                  </div>
            
            </div>
            
            
            
           

          <!--/地圖-->  
                    	         
              <!--菜單-->
        	            <div class="menu">
              <div class="row">
                <div class="small-12 large-50 columns">
                  <h2>菜單</h2>
                </div>
              </div>
              <div class="pics row">
                <ul class="clearing-thumbs clearing-feature small-block-grid-6">
                <c:forEach var="bean" items="${menus}">
                     <li  class="clearing-featured-img">
                        <img  src="${bean.foodIMG }" />
                        <div class="text-content">
                        <span>${bean.foodName }</span>
                        </div>                 
                     </li>
                </c:forEach>
                   
              	           
              	</ul>
              </div>
            </div>
            <!--/菜單-->
       
        	
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
       <script type='text/javascript' src="bootstrap/stores/js/foundation.min.js"></script>
      <script type='text/javascript' src="bootstrap/stores/js/app.js"></script>
      <!--MENU縮小-->
    <script type='text/javascript' src="bootstrap/stores/js/jquery.slicknav.js"></script>    
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