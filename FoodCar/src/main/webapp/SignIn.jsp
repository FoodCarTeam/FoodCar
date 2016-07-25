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
      
      <!--版型控制-->
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/signin/css/mobile%20menu%20style.css" type='text/css' media='all' />
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/signin/css/style.css' type='text/css' media='all' />
      <!--橘色header色塊控制與Menu控制-->

<script type='text/javascript' src="bootstrap/signin/js/modernizr.custom.js"></script> 
<script src="bootstrap/signin/js/jquery.js"></script>
  <!--login-->
   <link rel="stylesheet" href="bootstrap/signin/css/login.css">
  <script src="bootstrap/signin/js/jqlogin.js"></script>
  <script src="bootstrap/signin/js/login.js"></script>
  
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
              <a class="logo" href="index.jsp"></a>
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
          <li><a href="stores.jsp">餐車專區</a></li>
                  <li><a href="map.html">地圖</a></li>
                  <li><a href="about.jsp">關於我們</a></li>
                  <li><a href="login.jsp">登入</a></li>
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
                 <li><a href="stores.jsp">餐車專區</a></li>
                  <li><a href="map.html">地圖</a></li>
                  <li><a href="about.jsp">關於我們</a></li>
                  <li><a href="login.jsp">登入</a></li>
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

<div id="MainContent" style="width:800px;margin:auto">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
        
          <h1>
            註冊
          </h1>
            
<div class="container">
  <form  style="width:800px">
  <ul class="nav nav-pills" >
    <li class="active"><a data-toggle="pill" href="#users"><h4>會員註冊</h4></a></li>
    <li><a data-toggle="pill" href="#stores"><h4>店家註冊</h4></a></li>

  </ul>
  </form>
  <div class="tab-content">

   <!--會員註冊-->
       <div id="users" class="tab-pane fade in active"> 
<form   class="form-inline" role="form" action="<c:url value="/MembersSignin" />" method="post">

    <div class="form-group">
        <p></p>
      <label for="focusedInput">帳號:</label>
      <input class="form-control" id="mUsername" type="text"  placeholder="請輸入E-mail" required style="font-size:15px"
      name="mUsername" value="${param.mUsername}">
    </div>
   <p></p>
<div class="form-group">
      <label for="focusedInput">密碼:</label>
      <input class="form-control" id="mPassword" type="text"  placeholder="請輸入密碼" required style="font-size:15px"
      name="mPassword" value="${param.mPassword}">
    </div>
      <p></p>
 <div class="form-group">
      <label for="focusedInput">姓氏:</label>
      <input class="form-control" id="mName" type="text" placeholder="請輸入姓氏" required style="font-size:15px"
      name="mName" value="${param.mName}">
    </div>
  
   <p></p>
      
       <div class="form-group">
      <label for="focusedInput">電話:</label>
      <input class="form-control" id="mPhone" type="text"  placeholder="09xx-xxx-xxx" required style="font-size:15px"
      name="mPhone" value="${param.mPhone}">
    </div>
 
       <div class="form-group">
      <label for="focusedInput">生日:</label>
      <input class="form-control" id="mBirthday" type="text"  placeholder="1987/01/23" required style="font-size:15px"
      name="mBirthday" value="${param.mBirthday}">
    </div>
   <p></p>
       <div class="form-group">
      <label for="focusedInput">地址:</label>            
      <input class="form-control" id="mAddress" type="text"  placeholder="請輸入地址" style="width:450px"
       name="mAddress" value="${param.mAddress}">
                
    </div>
   <p></p>
 
       <div class="form-group">
    <label for="exampleInputFile">大頭貼檔案上傳</label>
    <input type="file" id="mIMG" name="mIMG" value="${param.mIMG}">
           </div>
      <p></p>
<!-- <button type="submit" class="btn btn-success" name="Members">申請</button>    -->
    	<input  class="btn btn-success" type="submit" name="Members" value="申請">


     </form>
</div>
      
 <!--/會員註冊-->

 <!--/店家註冊-->
    <div id="stores" class="tab-pane fade">
  <form  class="form-inline" role="form" action="<c:url value='/Signin.controller' />"  method="get">
    <div class="form-group">
        <p></p>
      <label for="focusedInput">帳號:</label>
      <input class="form-control" id="sUsername" type="text"  placeholder="請輸入手機為帳號" required style="font-size:15px"
       name="sUsername" value="${param.sUsername}">
    </div>
   <p></p>
<div class="form-group">
      <label for="focusedInput">密碼:</label>
      <input class="form-control" id="sPassword" type="text"  placeholder="請輸入密碼" required style="font-size:15px"
      name="sPassword" value="${param.sPassword}">
    </div>
      <p></p>
 <div class="form-group">
      <label for="focusedInput">店名:</label>
      <input class="form-control" id="sName" type="text" placeholder="請輸入店名" required style="font-size:15px"
      name="sName" value="${param.sName}">
    </div>
   <p></p>
       <div class="form-group">
      <label for="focusedInput">名字:</label>
      <input class="form-control" id="sBossName" type="text" placeholder="請輸入名字" required style="font-size:15px"
       name="sBossName" value="${param.sBossName}">
    </div>
   <p></p>
      
       <div class="form-group">
      <label for="focusedInput">資訊:</label>
      <input class="form-control" id="sIntro" type="text"  placeholder="請輸入店家資訊" required style="font-size:15px"
      name="sIntro" value="${param.sIntro}">
    </div>
 <p></p>
      <input class="btn btn-success" type="submit" name="Stores" value="申請">
 <!-- <button type="button" class="btn btn-success" name="Stores" value="Insert">申請</button>
 -->

      </form>

    </div>


  </div>
</div>
<!--..............................................-->

</div>
    </div>
      </div>
    </div>
  </div>
      
      <script type='text/javascript' src="bootstrap/js/app.js"></script>
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
 <!--menu縮小控制-->
       <script type='text/javascript' src="bootstrap/signin/js/foundation.min.js"></script>
      <script type='text/javascript' src="bootstrap/signin/js/app.js"></script>
      <script type='text/javascript' src="bootstrap/signin/js/jquery.slicknav.js"></script>    
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