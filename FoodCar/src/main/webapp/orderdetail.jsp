<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="shortcut icon" href="images/tools/logo.png">    
    <style type="text/css">
     .invoice-title h2, .invoice-title h3 {
        display: inline-block;
    }

     .table > tbody > tr > .no-line {
        border-top: none;
    }

     .table > thead > tr > .no-line {
        border-bottom: none;
    }

     .table > tbody > tr > .thick-line {
        border-top: 2px solid;
    }
    </style>
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
  
  
  
   <jsp:include page="header.jsp"></jsp:include>
  
<div id="MainContent" style="width:1100px;margin:auto">
  <div class="row">
    <div class="small-12 large-100 columns" >
      <div class="truck-details">
        <div class="content">
          <h1> 結帳完成!  </h1>
            <!--內容以下開始-->
  <div class="container">
    
        <div class="col-xs-10">
    		<div class="invoice-title">
    			<h3>${data.sName }</h3>
    			<h3 class="pull-right">結帳日期:${data.saleDate}</h3>
    		</div>
    		
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>訂單明細  <div class="pull-right">訂單編號:${data.oID}</div></strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>餐點</strong></td>
        							<td class="text-center"><strong>單價</strong></td>
        							<td class="text-center"><strong>數量</strong></td>
        							<td class="text-center"><strong>備註</strong></td>
        							<td class="text-right"><strong>總價錢</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<c:forEach var="i" begin="0" end="${fn:length(name)-1}">
    							<tr>
    								<td>${name[i] }</td>
    								<td class="text-center">$${price[i] }</td>
    								<td class="text-center">${fQ[i]}</td>
    								<td class="text-center">${memo[i]}</td>
    								<td class="text-right">$${ptotal[i]}</td>
    							</tr>
                               </c:forEach>
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>結算</strong></td>
    								<td class="thick-line text-right">$${data.total}</td>
    							</tr>
    							
    						</tbody>
    					</table>
    					<button type="button" class="btn btn-primary pull-right"  onclick="location.href='store?s=${data.sID}'" >返回</button>
    				</div>
    			</div>
    		</div>
    	</div>
    
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