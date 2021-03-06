<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="apple-itunes-app" content="app-id=634884546"/>
    <meta name="google-play-app" content="app-id=com.blogto.foodtrucks.toronto">    
    <title>餐餔餔</title>   
      <link rel="shortcut icon" href="images/tools/logo.png"> 
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
  
  </head>
  <body class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">  
  
<jsp:include page="header.jsp"></jsp:include>

    

          <!--JS-->
<script type="text/javascript" src="bootstrap/js/jquery.unveil.js"></script>
<script type="text/javascript" src="bootstrap/js/page.js"></script>

<div id="MainContent">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
          <h1>餐車專區
<!--                 <a class="book-button">不知道幹嘛的按鈕</a> -->
          </h1>
         
        

      <div id="all" class="row">   <!-- 餐車列表 -->
 
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
	
 
	<script type="text/javascript">
	$(function(){
	$.ajax({
			'type' : 'post',
			'url' : 'StoresServlet',
			'dataType' : 'json',
			'data' : {},
			'success' : function(data) {
				
				var tb = $('#all')
				var flag = $(document.createDocumentFragment());
				tb.empty();

				$.each(data, function(idx, store) {
					
					var cell = $('<div  class="post-container small-6 medium-6 large-4 columns end"></div>')
					.html('<div class="post"><div class="image"><a href="store?s='+store.sID+'" id="'+store.sID+'" ><img  src="'+store.sLogo+'" style="width:315px;height:210px" /></a></div><div class="title"><a class ="linkt" href="store?s='+store.sID+'"><h3>'+store.sName+'</h3></a><p>營業時間：'+store.openTime+'</p><p>電話:'+store.sUsername+'</p></div></div>');
				   flag.append([cell])
				})
				tb.append(flag)
			}
		})

		
		
	});
	</script>
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