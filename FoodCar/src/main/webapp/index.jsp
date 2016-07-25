<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐餔餔</title>

<link  href="index/assets/animate/set2.css" rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="index/assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="index/assets/animate/animate.css" />
<link rel="stylesheet" href="index/assets/animate/set.css" />
<link rel="stylesheet" href="index/assets/style.css">
     
</head>

<body>
<div class="topbar animated fadeInLeftBig"></div>

<!-- Header Starts -->
<div class="navbar-wrapper">
      <div class="container">

        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="top-nav">
          <div class="container">
            <div class="navbar-header">
              <!-- Logo Starts -->
              <a class="navbar-brand" href="#home"><img  class="animated bounceInUp" src="index/images/logo.png" alt="logo"></a>
              <!-- #Logo Ends -->


              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

            </div>


            <!-- Nav Starts -->
            <div class="navbar-collapse  collapse">
              <ul class="nav navbar-nav navbar-right scroll">
                <li ><a  class="animated bounceInUp" href="stores.html" style="color:white;font-size:larger" >餐車專區</a></li>
                 <li ><a class="animated bounceInUp" href="map.jsp" style="color:white;font-size:larger" >地圖</a></li>
                 <li ><a class="animated bounceInUp"  href="about.jsp" style="color:white;font-size:larger">關於我們</a></li>
                 <li ><a class="animated bounceInUp"  href="login.jsp" style="color:white;font-size:larger">登入</a></li>            
              </ul>
            </div>
            <!-- #Nav Ends -->

          </div>
        </div>

      </div>
    </div>
<!-- #Header Starts -->




<div id="home">
<!-- Slider Starts -->
<div id="myCarousel" class="carousel slide banner-slider animated bounceInDown" data-ride="carousel">     
      <div class="carousel-inner">
        <!-- Item 1 -->
        <div class="item active">
          <img src="index/images/back1.jpg" alt="banner">
        </div>
        <!-- #Item 1 -->

        <!-- Item 1 -->
        <div class="item">
          <img src="index/images/back2.jpg" alt="banner">
        </div>
        <!-- #Item 1 -->

        <!-- Item 1 -->
        <div class="item">
          <img src="index/images/back3.jpg" alt="banner">
        </div>
        <!-- #Item 1 -->

        <!-- Item 1 -->
        <div class="item">
          <img src="index/images/back4.jpg" alt="banner">
        </div>
        <!-- #Item 1 -->
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <img src="index/images/left.png" style="margin-top:400px" /><i class="fa fa-angle-left"></i></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <img src="index/images/right.png" style="margin-top:400px" /><i class="fa fa-angle-right"></i></a>
    </div>
<!-- #Slider Ends -->
</div>

<!-- Footer Starts -->
<div class="footer text-center spacer">
Copyright 2014 Cyrus Creative Studio. All rights reserved.
</div>
<!-- # Footer Ends -->



<!-- jquery -->
<script src="index/assets/jquery.js"></script>
<!-- wow script -->
<script src="index/assets/wow/wow.min.js"></script>
<!-- boostrap -->
<script src="index/assets/bootstrap/js/bootstrap.js" type="text/javascript" ></script>

</body>
</html>