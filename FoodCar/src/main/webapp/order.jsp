<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/order/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/order/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript' src="bootstrap/order/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/order/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/order/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/order/js/jquery.js"></script>
<script src="bootstrap/order/js/scrolling-nav.js"></script>
  
  </head>
  <body class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">  
  
  <jsp:include page="header.jsp"></jsp:include>
  
<div id="MainContent">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
          <h1> 結帳 </h1>
        
          <div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover" style=" margin-left: 115px">
                <thead>
                    <tr>
                        <th>商品</th>
                        <th>數量</th>
                        <th class="text-center">價錢</th>
                        <th class="text-center">總價錢</th>
                        <th>備註</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                  <c:forEach var="i" begin="0" end="${fn:length(fID)-1}">
                    <tr class="foods" fid="${fID[i]}">
                        <td class="col-sm-8 col-md-6" >
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object fImg" src="${fImg[i]}" style="width: 120px; height: 90px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#" class="fName">${fName[i]}</a></h4>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="text" class="form-control quen"  value="${fQ[i]}" style="">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong class="price">$${fPrice[i]}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center" ><strong class="ptotal">$${(fPrice[i])*(fQ[i])}</strong></td>
                        <td class="col-sm-1 col-md-1"><input type="text" class="memo" ></td>
                        <td class="col-sm-1 col-md-1">
                        <button type="button" class="btn btn-danger"  >
                            <span class="glyphicon glyphicon-remove"></span> 刪除
                        </button> </td>
                        
                    </tr>
                   
                       
                
                 </c:forEach>
                   
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                         <td>   </td>
                        <td><h3>總金額</h3></td>
                        <td class="text-right"><h3><strong class="total"></strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <button type="button" class="btn btn-success checkout">
                            結帳 <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
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
    <script type='text/javascript' src="bootstrap/js/jquery.redirect.js"></script>  
    <script src="bootstrap/sweetAlert/sweetalert.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="bootstrap/sweetAlert/sweetalert.css">
    <script>
      var product_list = $('.ptotal')
      var products = 0
      for(var i=0;i<product_list.length;i++){   //計算總金額
    	  products=products+parseInt($(product_list[i]).text().substr(1));
      }
      $('.total').text(products)
      
      var foods = null;
      $('.btn-danger').on('click',function(){     //刪除品項
    	  foods = $('.foods')
    	  if(foods.length==1){
    		  swal("注意!", "再刪掉就沒商品囉!", "warning")
    	  }else{
    	  $(this).parents('tr').remove();
    	  var d_product_list =$('.ptotal');
    	  var d_tatol=0
    	    for(var i=0;i<d_product_list.length;i++){
    	    	d_tatol=d_tatol+parseInt($(d_product_list[i]).text().substr(1));
    	      }
    	  $('.total').text(d_tatol)
    	  console.log(d_tatol)
    	  }
      })
      
      $('.quen').on('change',function(){          //更改數量後計算金額
    	  var qu = $(this).val()
    	  var reg = /^[1-9]\S*$/; 
    	  if(reg.test(qu)){
    	  var ptotal = $(this).parents('tr').children().children('.ptotal')
    	  var p = $(this).parents('tr').children().children('.price')
    	  var quen = $(this).val();
    	  ptotal.text("$"+parseInt(quen)*parseInt(p.text().substr(1)))
    	  
    	  var c_product_list =$('.ptotal');
    	  var c_tatol=0
  	      for(var i=0;i<c_product_list.length;i++){
  	    	c_tatol=c_tatol+parseInt($(c_product_list[i]).text().substr(1));
  	      }
  	       $('.total').text(c_tatol)
    	  }else{
    		  sweetAlert("錯誤", "請輸入數字", "warning");
    		  qu = $(this).val(1)
    		  $(this).parents('tr').children().children('.ptotal').text($(this).parents('tr').children().children('.price').text())
    		  
    	  }
      })
       $('.checkout').on('click',function(){
    	      var total = $('.total').text();
    	      console.log(total)
    		  var fID_list = $('.foods')
    		  var q_list = $('.quen')
    		  var ptotal_list = $('.ptotal')
    		  var price_list = $('.price')
    		  var memo_list = $('.memo')
    		  var name_list = $('.fName')
    		  var img_list = $('.fImg')
    		  
        	  var fID_arr = [];
    		  var q_arr = [];
    		  var ptotal_arr = [];
    		  var price_arr = [];
    		  var memo_arr = [];
    		  var name_arr = [];
    		  var img_arr = [];
    		  
    		  for(var i =0;i<fID_list.length;i++){
    			  fID_arr[i] = $(fID_list[i]).attr('fid')
    			  q_arr[i] = $(q_list[i]).val();
    			  ptotal_arr[i] = $(ptotal_list[i]).text().substr(1);
    			  price_arr[i] = $(price_list[i]).text().substr(1);
    			  memo_arr[i] = $(memo_list[i]).val();
    			  name_arr[i] = $(name_list[i]).text();
    			  img_arr[i] = $(img_list[i]).attr('src');
    		  }
    		  
    		  
//     		  console.log(fID_arr)
//     		  console.log(q_arr)
//     		  console.log(ptotal_arr)
//     		  console.log(price_arr)
//     		  console.log(memo_arr)
//     		  console.log(name_arr)
//     		  console.log(img_arr)
//     		  console.log("${sID}")
             
              swal({   
            	  title: "結帳確認",   
            	  text: "結帳後無法修改訂單內容!",   
            	  type: "info",   
            	  showCancelButton: true,   
            	  confirmButtonColor: "#DD6B55",   
            	  confirmButtonText: "確定",
            	  cancelButtonText: "取消",
            	  closeOnConfirm: false 
            	  }, 
            function(){
            	  swal({title:"結帳成功", text:"訂單已送出!",type: "success"},function(){
            		  $.redirect('checkout',{"fID":fID_arr,"fQ":q_arr,"ptotal":ptotal_arr,"price":price_arr,"memo":memo_arr,"name":name_arr,"img":img_arr,"sID":"${sID}","total":total,"sName":"${sName}","mID":"${mUsername.mID}"})
                	  console.log("結帳成功");
            		  
            	  }); 
            	  
            	   });
    		  
    		  
    	  })
    </script>
<!-- /Footer -->
       <script type='text/javascript' src="bootstrap/order/js/foundation.min.js"></script>
      <script type='text/javascript' src="bootstrap/order/js/app.js"></script>
      <!--MENU縮小-->
    <script type='text/javascript' src="bootstrap/order/js/jquery.slicknav.js"></script>    
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

