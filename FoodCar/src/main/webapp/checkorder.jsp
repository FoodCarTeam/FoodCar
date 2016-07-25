<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="apple-itunes-app" content="app-id=634884546"/>
    <meta name="google-play-app" content="app-id=com.blogto.foodtrucks.toronto">    
    <title>餐餔餔</title>   

       <!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/about/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/login/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript' src="bootstrap/about/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/about/css/bootstrap.min.css" rel="stylesheet" />
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link href="bootstrap/about/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/about/js/jquery.js"></script>
<script src="bootstrap/about/js/scrolling-nav.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

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
<div id="MainContent">
  <div class="row">
    <div class="small-12 large-100 columns"   style="margin-left: 280px"
    >
      <div class="truck-details">
        <div class="content">
          <h1> 我的訂單紀錄  </h1>
            <!--內容以下開始-->
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-info">
    訂單紀錄
  </a>
  <c:forEach var="bean" items="${orders}">
  <a href="checkdetail?o=${bean.oID }" class="list-group-item">${bean.sName}<div class="pull-right">結帳日期:${bean.saleDate}</div></a>
  </c:forEach>
</div>
     
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
       <script type='text/javascript' src="bootstrap/about/js/foundation.min.js"></script>
      <script type='text/javascript' src="bootstrap/about/js/app.js"></script>
      <!--MENU縮小-->
    <script type='text/javascript' src="bootstrap/about/js/jquery.slicknav.js"></script>    
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