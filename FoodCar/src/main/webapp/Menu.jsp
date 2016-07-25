﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
   
   <link rel="stylesheet" href="add-to-cart/css/reset.css">
   <link rel="stylesheet" href="add-to-cart/css/style.css"> 
<script src="add-to-cart/js/main.js"></script>
    <!--CSS-->
    <link href="bootstrap/store/css/newmenu.css" rel="stylesheet" />

<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/login/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/login/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript' src="bootstrap/login/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/login/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/login/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/login/js/jquery.js"></script>
<script src="bootstrap/login/js/scrolling-nav.js"></script>
  
      <style>
          #MENU {
          
          
          }
      </style>
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
<div id="MainContent">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
          <h1>
            菜單    
          </h1>
        
        
            <div class="MENU">
		<ul>
		<c:forEach var="bean" items="${Menus}">
			
			<li>
			    <img src="${bean.foodIMG }" class="img-rounded"/>
				<h2>${bean.foodName}</h2>
				<h3>$${bean.unitPrice }</h3>
				
				<p>
					<a href="#0" id ="${bean.statusID}" class="cd-add-to-cart" data-id="${bean.foodID }" data-price="${bean.unitPrice }"
			data-name="${bean.foodName}" data-image="${bean.foodIMG}" >加入購物車</a>    
				</p>				
			</li>
		
	     </c:forEach>
		</ul>
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

				<footer> <a  class="checkout btn" style="font-size:22px"><em >結帳金額：
						  $<span>0</span>
				</em></a> </footer>
			</div>
		</div>
		<!-- .cd-cart -->
	</div>	
<script src="bootstrap/sweetAlert/sweetalert.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="bootstrap/sweetAlert/sweetalert.css">
	<script type='text/javascript' src="bootstrap/js/jquery.redirect.js"></script>  

    <script>
   
    var $j = jQuery.noConflict();
    
    $j('.checkout').on('click',function(){
    	
    	var id_list = $('.car');
    	var quan_list = $('select[name="quantity"]');
    	var name_list = $('.pName')
        var img_list=$('.pImg')
        var price_list=$('.price')
        
    	var arrCarId = [];
    	var arrCarQuan = [];
        var arrCarname = [];
        var arrCarImg = [];
        var arrCarPrice = [];
        
        var sID = ${select.sID}
    	for(var i=0; i<id_list.length; i++) {
    		arrCarId[i] = $(id_list[i]).attr('fID');
    		arrCarQuan[i] = $(quan_list[i]).val();
    		arrCarname[i] = $(name_list[i]).text();
    		arrCarImg[i] = $(img_list[i]).attr('src');
    		arrCarPrice[i] = $(price_list[i]).text().substr(1);
    	}
    	if(id_list.length > 0){
    		$j.redirect("order", { "foodId": arrCarId, "foodQuan": arrCarQuan ,"foodName":arrCarname,"foodImg":arrCarImg,"foodPrice":arrCarPrice,"sID":sID,"sName":"${select.sName }"});
    	}else{
    		swal("購物車無商品", "請確認購物車商品數量", "warning")
    	}
//    	  $('#car').each(function(){
//    		  count++
//    		    ss.push($('#car').attr('fID'))
//            console.log(count)
//    		     console.log(ss)
//    	   });
    	  
    	 
//     	  $.ajax({
//   			'type' : 'post',
//   			'url' : 'order',
//   			'dataType' : 'json',
//   			'data' : {"unitPrice":ss},
//   			'success' : function() {
  				
//   			}
//   		})
      })
    </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
		if (!window.jQuery)
			document
					.write('<script src="jquery/jquery-3.0.0.min.js"><\/script>');
	</script>
	<script src="add-to-cart/js/main.js"></script>

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
