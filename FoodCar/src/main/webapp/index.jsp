<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

      <jsp:include page='headerIndex.jsp'/>

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
餐餔餔
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