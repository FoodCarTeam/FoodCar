<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US" prefix="og: http://ogp.me/ns#" class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="apple-itunes-app" content="app-id=634884546" />
<meta name="google-play-app"
	content="app-id=com.blogto.foodtrucks.toronto">
<title>餐餔餔</title>
<style>
.modal-body .form-horizontal .col-sm-2, .modal-body .form-horizontal .col-sm-10
	{
	width: 100%
}

.modal-body .form-horizontal .control-label {
	text-align: left;
}

.modal-body .form-horizontal .col-sm-offset-2 {
	margin-left: 15px;
}
</style>

<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>


<!-- 編輯的ＣＳＳ -->
<link rel='stylesheet'href='bootstrap/comments/Markdown/css/bootstrap-markdown.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap-markdown.less'type='stylesheet/less' />

<!-- 以下為sweetAlert -->
<script src="sweetalert2/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css" href="sweetalert2/sweetalert2.min.css">





<!-- 以下為留言板 -->
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap-theme.css'
	type='text/css' media='all' />

<!-- 漂浮視窗 -->
<script type='text/javascript' src="bootstrap/comments/js/bootstrap.js"></script>
<!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/stores/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/stores/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript'
	src="bootstrap/stores/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/stores/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/stores/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/stores/js/jquery.js"></script>
<script src="bootstrap/stores/js/scrolling-nav.js"></script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap"></script>




</head>
<body
	class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">

	<!--Header-->
	<div id="Header" style="background-color: white;">
		<div class="row">
			<div class="small-18 large-12 columns">
				<p></p>
				<p></p>
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
			<div class="small-2 columns"></div>
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
	<nav class="navbar navbar-fixed-top"> <!--列表-->
	<div class="contain-to-grid">
		<nav class="top-bar" id="TopMenu" data-topbar
			data-options="is_hover: false"> <section
			class="top-bar-section">
		<div class="menu-bar">
			<!--列表左邊-->
			<ul class="left">
				<li>
					<div class="top-logo">
						<a class="logo" href="index.html"></a> <a class="logo-text"
							href="index.html"></a>
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
				<li class="side-menu has-dropdown"><a href="#" class="menu"></a>
					<ul class="dropdown">
						<li><a href="stores.html">餐車專區</a></li>
						<li><a href="map.html">地圖</a></li>
						<li><a href="about.html">關於我們</a></li>
						<li><a href="login.html">登入</a></li>
					</ul></li>
				<!--/列表右邊list工具列-->
			</ul>
		</div>
		</section> </nav>
	</div>
	<!--/列表--> </nav>

	<script type="text/javascript" src="bootstrap/js/jquery.unveil.js"></script>
	<script type="text/javascript" src="bootstrap/js/page.js"></script>
	<div id="MainContent">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">
						<h1>
							${select.sName} <a href='menu?s=${select.sID}' class="book-button">點餐</a>
						</h1>
						<script type='text/javascript'
							src="bootstrap/js/jquery.redirect.js"></script>
						
						
						
						
						<div class="article text">
							<p>
								<img class="alignnone size-full wp-image-8737"
									src="${select.sLogo }" width="2048" height="1365" />
							</p>
							<p>簡介:</p>
							<p>${select.sIntro }</p>
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
										<div class="clock"></div>
										<span>11:00 AM to 3:00 PM</span>
									</div>
								</div>
							</div>
							<div id="GoogleMap">
								<div class="col-sm-10 col-sm-offset-1" style="height: auto;">

									<img  data-toggle="modal" data-target="#myModalHorizontal2"
										id='123'
										style="max-width: 990px; max-height: 300px; margin: auto;"
										src='' />
									<p>
										<img class="map-unveil"
											data-src="http://torontofoodtrucks.ca/wp-content/themes/foodtrucks/images/menu-icon.png"
											style="position: absolute;" />
									</p>
								</div>

							</div>

							<script>
$(function(){
var location ='${map}';
	
$("#123").attr("src","http://maps.googleapis.com/maps/api/staticmap?center="+location+"&zoom=16&size=1200x300&scale=2&markers=icon:http://i.imgur.com/KYhVtYS.png?2|"+location+"&key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A");
$("#123").on('mouseover',function(){
	$("#123").css({"cursor":"pointer"});
});
$("#123").on('click',function(){
	$("#123").attr("data-toggle",'modal');
	$("#123").attr("data-target",'#myModalHorizontal2');
});

$('iframe').attr('src',
		'https://www.google.com/maps/embed/v1/place?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&q='+location);
})
</script>



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
											<li class="clearing-featured-img"><img
												src="${bean.foodIMG }" />
												<div class="text-content">
													<span>${bean.foodName}</span>
												</div></li>
										</c:forEach>


									</ul>
								</div>
							</div>
							<!--/菜單-->
							
<!-- 							以下為留言板 -->
<!-- 							<div class="container"> -->
								<div class="row">
<!-- 					以下為主流言訊息輸入 -->


				<div class='col-sm-6 col-sm-offset-3 well'>
					<form>
							<textarea id='textarea2' name="content" data-provide="markdown" clas='status-box md-input'
								rows="8"></textarea>
					</form>
					<div class='col-md-2 col-md-offset-8'>
						<button id='sumnit2' type="submit" class="btn btn-default  well" style='margin-top:5px;margin-bottom:0px;padding-bottom:5px;padding-top:5px'>發布訊息</button>
					</div>
				</div>
				
				
				
	<script>
	$(function(){
// 		console.log($(".glyphicon glyphicon-search"));
// 		$(".glyphicon glyphicon-search").text("預覽");
// 以下為即時新增主留言
	$("#sumnit2").on('click',function(){
		var FContent=$("#textarea2").data('markdown').parseContent();
		$("#textarea2").val("");
		var nowDate=new Date();
		var cDateTemp=$.format.date(nowDate.toString(), "yyyy-MM-dd HH:mm:ss");
		
		$.ajax({
			"menthod" : "POST",
			"url" : "InsertCommentsServlet",
			"contentType":"application/json;charset=UTF-8",
// 			"dataType" : "JSON",
			"data" : {
				"mID":1,
				"sID":1,
				"cDate":cDateTemp,
				"cContent":FContent,
			},"error":function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
			},
			"success" : function() {
// 				alert("新增成功");
				console.log("新增成功");
// 				以下為即時新增
			
				
				
				var picture = $("<a class='pull-left' href='#'></a>");
				var picture_1 = $("<img class='media-object img-circle' src='' alt='profile'></img>");
				// 					以下為更換照片
				picture_1.attr("src", "https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
				picture.append([ picture_1 ]);

				var data1 = $("<div class='media-body' style='width:700px;'></div>");
				var data2 = $("<div class='well well-l'></div>");
					
//		 		if (value.sName == "") {
//		 			Rdata2_1.append(value.mName);
//		 		} else {
//		 			Rdata2_1.append(value.sName);
//		 		}

				var data2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>").text("測試名字");
				var data2_2 = $("<ul class='media-date text-uppercase reviews list-inline'></ul>");
				
				
				
				 var prettyDate =jQuery.format.prettyDate(nowDate);
				 
				 var prettyDate_1=$("<li style='font-size:10px;float:right'></li>");
				 prettyDate_1.text(prettyDate);
				
				var year = cDateTemp.substring(0, 4);
				var month = cDateTemp.substring(5, 7);
				var day = cDateTemp.substring(8, 10);
				var hours = cDateTemp.substring(10, 13);
				var minute = cDateTemp.substring(14, 16);
				var seconde = cDateTemp.substring(17, 19);
				var data2_2_1 = $("<li class='aaaa'></li>").text(year + "年");
				var data2_2_2 = $("<li class='mm'></li>").text(month + "月");
				var data2_2_3 = $("<li class='dd'></li>").text(day + "日");
				var data2_2_4 = $("<li class='dd'></li>").text(hours + "點");
				var data2_2_5 = $("<li class='dd'></li>").text(minute + "分");

				
				
				
				data2_2.append([ data2_2_1, data2_2_2, data2_2_3, data2_2_4, data2_2_5 ]);
				 data2_2.append(prettyDate_1);
				var data2_3 = $("<p class='media-comment'></p>").html(FContent);
				var data2_4_1 = $("<a onClick='replay($(this).children().children())' id='replyButton' data-toggle='modal' data-target='#myModalHorizontal' class='btn btn-info btn-circle text-uppercase' href='' id='reply'></a>");
				var data2_4_1_1 = $("<span class='glyphicon glyphicon-share-alt'></span>");
				var data2_4_1_1_1 = $("<input type='hidden' value=''/>");

//		 		cID
				data2_4_1.attr("id",1);
				
				var cID =1;
				data2_4_1_1_1.attr("value", cID);
				data2_4_1_1.append(data2_4_1_1_1);

				data2_4_1.append(data2_4_1_1);
				data2_4_1.append("回覆");

				
//		 			var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
//		 			data2_4_2.attr("href", "#reply" + 99);
//		 			data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");
					
//		 			data2_4_2.attr("id",99);
//		 			var ResponseCount1=data2_4_2.attr("id");
					
//		 			data2_4_2.text(value.ResponseCount + "則回覆");

//		 			var ReplayTemp1 = $("<div class='collapse' id=''>");
//		 			ReplayTemp1.attr("id", "reply" + 99);
				
				
				data2.append([data2_1,data2_2,data2_3,data2_4_1]);
				data1.append(data2);
				var row = $("<li class='media'></li>").append([picture, data1 ]);
				$("#testTop").prepend(row);
				
				
				
				
				
				
			}
			
			
			
		})
		
		
		
		
		
		
		
		
		
	
		
	});
		
})
	
	</script>
								
								
<!-- 								以下為留言板 -->
									<div class="col-sm-10 col-sm-offset-1" id="logout">
										<div class="tab-content">
											<div id='test' class="tab-pane active" id="comments-logout">
												<ul class="media-list" id='testTop'>
												
												</ul>
											</div>
										</div>
									</div>
								</div>
<!-- 							</div> -->




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
	<script type='text/javascript'
		src="bootstrap/stores/js/foundation.min.js"></script>
	<script type='text/javascript' src="bootstrap/stores/js/app.js"></script>
	<!--MENU縮小-->
	<script type='text/javascript'
		src="bootstrap/stores/js/jquery.slicknav.js"></script>
	<script type="text/javascript">
          $(document).ready(function () {
              $('#menu-mobile').slicknav({
                  label: '',
                  prependTo: '#MenuPhone'
              });
          });
    </script>
    <!-- 以下為日期格式 -->
<script type='text/javascript'
	src="DateFormat/jquery-dateFormat.min.js"></script>
<!-- 	以下為計算日期時間 -->
<script type='text/javascript' src="DateFormat/jquery.timeago.js"></script>
<!-- <script type='text/javascript' src="DateFormat/jquery.timeago.zh-TW.js"></script> -->

    <script>
		$(function() {
			$.ajax({
				"type" : "get",
				"url" : "CommentsServlet",
				"dataType" : "JSON",
				"data" : {
					"sID" : '${select.sID}'
				},
				"success" : function(datas) {

					var tb = $("#test>ul");
					flag = $(document.createDocumentFragment());
					tb.empty();
					var ReplyCount = 1;
					$.each(datas, function(index, value) {

						var picture = $("<a class='pull-left' href='#'></a>");
						var picture_1 = $("<img class='media-object img-circle' src='' alt='profile'></img>");
						// 					以下為更換照片
						picture_1.attr("src", "https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
						picture.append([ picture_1 ]);

						var data1 = $("<div class='media-body' style='width:700px;'></div>");
						var data2 = $("<div class='well well-l'></div>");
						var data2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>").text(value.mName);
						var data2_2 = $("<ul class='media-date text-uppercase reviews list-inline'></ul>");
						var cDateTemp = value.cDate;
						
						 var prettyDate =jQuery.format.prettyDate(cDateTemp);
						 
						 var prettyDate_1=$("<li style='font-size:10px;float:right'></li>");
						 prettyDate_1.text(prettyDate);
						
						var year = cDateTemp.substring(0, 4);
						var month = cDateTemp.substring(5, 7);
						var day = cDateTemp.substring(8, 10);
						var hours = cDateTemp.substring(10, 13);
						var minute = cDateTemp.substring(14, 16);
						var seconde = cDateTemp.substring(17, 19);
						var data2_2_1 = $("<li class='aaaa'></li>").text(year + "年");
						var data2_2_2 = $("<li class='mm'></li>").text(month + "月");
						var data2_2_3 = $("<li class='dd'></li>").text(day + "日");
						var data2_2_4 = $("<li class='dd'></li>").text(hours + "點");
						var data2_2_5 = $("<li class='dd'></li>").text(minute + "分");

						
						
						
						data2_2.append([ data2_2_1, data2_2_2, data2_2_3, data2_2_4, data2_2_5 ]);
						 data2_2.append(prettyDate_1);
						var data2_3 = $("<p class='media-comment'></p>").html(value.cContent);
						var data2_4_1 = $("<a onClick='replay($(this).children().children())' id='replyButton' data-toggle='modal' data-target='#myModalHorizontal' class='btn btn-info btn-circle text-uppercase' href='' id='reply'></a>");
						var data2_4_1_1 = $("<span class='glyphicon glyphicon-share-alt'></span>");
						var data2_4_1_1_1 = $("<input type='hidden' value=''/>");

						data2_4_1.attr("id",value.cID);
						
						var cID = value.cID;
						data2_4_1_1_1.attr("value", cID);
						data2_4_1_1.append(data2_4_1_1_1);

						data2_4_1.append(data2_4_1_1);
						data2_4_1.append("回覆");

						if (value.ResponseTrueOrFalse == "true") {
							var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
							data2_4_2.attr("href", "#reply" + ReplyCount);
							data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");
							
							data2_4_2.attr("id",value.ResponseCount);
							var ResponseCount1=data2_4_2.attr("id");
							
							data2_4_2.text(value.ResponseCount + "則回覆");

							var ReplayTemp1 = $("<div class='collapse' id=''>");
							ReplayTemp1.attr("id", "reply" + ReplyCount);

							// 						以下處理如果有回覆

							var ReplayTemp2 = $("<ul class='media-list'>");

							$.each(value.Response, function(index, value) {

								var Replay = $("<li class='media media-replied' style='margin-left:50px;'></li>");
								var Replay_picture = $("<a class='pull-left' href='#'></a>");
								var Replay_picture_1 = $("<img class='media-object img-circle' src='' alt='profile'>");
								//	 						回覆者的照片
								Replay_picture_1.attr("src", "https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
								Replay_picture.append(Replay_picture_1);

								var Rdata1 = $("<div class='media-body' style='width:500px;'></div>");
								var Rdata2 = $("<div class='well well-lg'>");
								var Rdata2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>");

								// 								var cID=$("<p style='font-size:1'></p>").text(value.cID);

								Rdata2_1.html("<span class='glyphicon glyphicon-share-alt'></span>");
								// 	判斷是餐車還是會員回覆
								if (value.sName == "") {
									Rdata2_1.append(value.mName);
								} else {
									Rdata2_1.append(value.sName);
								}
								// 								Rdata2_1.append(cID);

								var Rdata2_2 = $("<ul class='media-date text-uppercase reviews list-inline'>");
								var cDateTemp2 = value.cDate;

								var year2 = cDateTemp2.substring(0, 4);
								var month2 = cDateTemp2.substring(5, 7);
								var day2 = cDateTemp2.substring(8, 10);
								var hours2 = cDateTemp2.substring(10, 13);
								var minute2 = cDateTemp2.substring(14, 16);
								var seconde2 = cDateTemp2.substring(17, 19);
								var Rdata2_2_1 = $(" <li class='dd'></li>").text(day2 + "日");
								var Rdata2_2_2 = $("<li class='aaaa'></li>").text(year2 + "年");
								var Rdata2_2_3 = $("<li class='mm'></li>").text(month2 + "月");
								var Rdata2_2_4 = $("<li class='mm'></li>").text(hours2 + "點");
								var Rdata2_2_5 = $("<li class='mm'></li>").text(minute2 + "分");
								
								
								
								 var RprettyDate =jQuery.format.prettyDate(cDateTemp2);
								 
								 var RprettyDate_1=$("<li style='font-size:10px;float:right'></li>");
								 RprettyDate_1.text(RprettyDate);
								
								Rdata2_2.append([ Rdata2_2_2, Rdata2_2_3, Rdata2_2_1, Rdata2_2_4, Rdata2_2_5 ]);
								Rdata2_2.append(RprettyDate_1);
								var Rdata2_3 = $("<p class='media-comment'></p>").html(value.cContent)
								var Rdata2_4_1 = $("<a onClick='replay($(this).children().children())' data-toggle='modal' data-target='#myModalHorizontal' class='btn btn-info btn-circle text-uppercase' href='' id=''></a>");
								
// 								Rdata2_4_1.attr("id",value.cID);
								
								var Rada2_4_1_1 = $("<span class='glyphicon glyphicon-share-alt'></span>");
								var Rada2_4_1_1_1 = $("<input type='hidden' value=''/>");

								var cID = value.cID;
								Rada2_4_1_1_1.attr("value", cID);
								Rada2_4_1_1.append(Rada2_4_1_1_1);

								Rdata2_4_1.append(Rada2_4_1_1);
								Rdata2_4_1.append("回覆");

								Rdata2.append([ Rdata2_1, , Rdata2_2, Rdata2_3, Rdata2_4_1 ]);
								Rdata1.append([ Rdata2 ]);

								Replay.append([ Replay_picture, Rdata1 ]);
								ReplayTemp2.append(Replay);

							});
							ReplayTemp1.append(ReplayTemp2);

						} else {
							// 							判斷是否有留言回覆
							var data2_4_2 = "";

						}

						data2.append([ data2_1, data2_2, data2_3, data2_4_1, data2_4_2 ]);
						data1.append([ data2 ]);
						var row = $("<li class='media'></li>").append([ picture, data1, ReplayTemp1 ]);
						flag.append(row);

						ReplyCount = ReplyCount + 1;

					})
					tb.append(flag);

				}

			})

			// 	以下處理回覆訊息輸入 
			$("#sumnit").on("click", function() {
				
			var temp = $(this).parents("div").html();
		
// 			var title = $("input[name='title']").val();
	
			var content = $("#textarea").data('markdown').parseContent();
			
			$("textarea[name='content']").val("");
			console.log($("#textarea"));
			console.log( $("#textarea").html());
			console.log("回覆即時:"+content);
			
			var DateTemp=new Date();
			
			
			var Date1=$.format.date(DateTemp.toString(), "yyyy-MM-dd HH:mm:ss");
		
			var data={"rID":"",
					"cID":cID,
					"cContent":content,
					"sName":"",
					"mName":"",
					"cDate":Date1,
					"cIP":""};
					var cIDD=cID;
// 						console.log(data);
// 						console.log(JSON.stringify(data));
// 			回覆
			$.ajax({
				"menthod":"GET",
				"url":"comments/controller/ReplayCommentsServlet",
				"contentType":"application/json;charset=UTF-8",
				"data": data,
				"success":function(){
//				 	以下為即時增加回覆
					var temp=$("a");
				
					$.each(temp,function(index,value){
						if($(value).attr("id")==cIDD){
// 							console.log($(value).html());
// 							$(value).parent().parent().next().children().show();
 						
							var Replay = $("<li class='media media-replied' style='margin-left:50px;'></li>");
							var Replay_picture = $("<a class='pull-left' href='#'></a>");
							var Replay_picture_1 = $("<img class='media-object img-circle' src='' alt='profile'>");
							//	回覆者的照片
							Replay_picture_1.attr("src", "https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
							Replay_picture.append(Replay_picture_1);

							var Rdata1 = $("<div class='media-body' style='width:500px;'></div>");
							var Rdata2 = $("<div class='well well-lg'>");
							var Rdata2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>");

							// 								var cID=$("<p style='font-size:1'></p>").text(value.cID);

							Rdata2_1.html("<span class='glyphicon glyphicon-share-alt'></span>");
							// 	判斷是餐車還是會員回覆
							if (value.sName == "") {
								Rdata2_1.append(value.mName);
							} else {
								Rdata2_1.append(value.sName);
							}
							// 								Rdata2_1.append(cID);

							var Rdata2_2 = $("<ul class='media-date text-uppercase reviews list-inline'>");
							var cDateTemp2 = Date1;
// 						alert(Date1);
							
							
							var year2 = cDateTemp2.substring(0, 4);
							var month2 = cDateTemp2.substring(5, 7);
							var day2 = cDateTemp2.substring(8, 10);
							var hours2 = cDateTemp2.substring(10, 13);
							var minute2 = cDateTemp2.substring(14, 16);
							var seconde2 = cDateTemp2.substring(17, 19);
							var Rdata2_2_1 = $(" <li class='dd'></li>").text(day2 + "日");
							var Rdata2_2_2 = $("<li class='aaaa'></li>").text(year2 + "年");
							var Rdata2_2_3 = $("<li class='mm'></li>").text(month2 + "月");
							var Rdata2_2_4 = $("<li class='mm'></li>").text(hours2 + "點");
							var Rdata2_2_5 = $("<li class='mm'></li>").text(minute2 + "分");
							
							 var RprettyDate =jQuery.format.prettyDate(cDateTemp2);
							 
							 var RprettyDate_1=$("<li style='font-size:10px;float:right'></li>");
							 RprettyDate_1.text(RprettyDate);
							
							Rdata2_2.append([ Rdata2_2_2, Rdata2_2_3, Rdata2_2_1, Rdata2_2_4, Rdata2_2_5 ]);
							Rdata2_2.append(RprettyDate_1);
							var Rdata2_3 = $("<p class='media-comment'></p>").html(content);
							
							console.log("即時回覆"+content);
							
							
							var Rdata2_4_1 = $("<a onClick='replay($(this).children().children())' data-toggle='modal' data-target='#myModalHorizontal' class='btn btn-info btn-circle text-uppercase' href='' id='reply'></a>");
							var Rada2_4_1_1 = $("<span class='glyphicon glyphicon-share-alt'></span>");
							var Rada2_4_1_1_1 = $("<input type='hidden' value=''/>");

							var cID = value.cID;
							Rada2_4_1_1_1.attr("value", cID);
							Rada2_4_1_1.append(Rada2_4_1_1_1);

							Rdata2_4_1.append(Rada2_4_1_1);
							Rdata2_4_1.append("回覆");

							Rdata2.append([ Rdata2_1, , Rdata2_2, Rdata2_3, Rdata2_4_1 ]);
							Rdata1.append([ Rdata2 ]);

							
							
						
							
// 							console.log($(value).html());
// 							console.log($(value).next().html());
// 							以下判斷先前是否有人有留言
							if(typeof($(value).next().html())=='undefined'){
								
								var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
								data2_4_2.attr("href", "#reply" + cIDD);
								data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");
								console.log(cIDD);
								data2_4_2.attr("id",cIDD);
								var ResponseCount1=data2_4_2.attr("id");
								
								data2_4_2.text(1 + "則回覆");
								
								$(value).parent().append(data2_4_2);
								
								
								var ReplayTemp1 = $("<div class='collapse' id=''>");
								ReplayTemp1.attr("id", "reply" + cIDD);
								
								var ReplayTemp2 = $("<ul class='media-list'>");
								ReplayTemp2.append(Replay);
								
								ReplayTemp1.append(ReplayTemp2);
								
								
								
// 							要重新抓
// 							var Rdata1 = $("<div class='media-body' style='width:500px;'></div>");

								$(value).parent().parent().append(ReplayTemp1);

// 								Rdata1.append(ReplayTemp1);
								
								
							}else{
//	 							以下為更改留言數量
								var tmepCount=$(value).next().attr("id");
								var tmepCountNumber=parseInt(tmepCount);
								tmepCountNumber=tmepCountNumber+1;
								$(value).next().text("");
//	 							console.log(tmepCount);
								$(value).next().text(tmepCountNumber+"則回覆")
								
								$(value).parent().parent().next().children().append(Replay);
							}
							

// 							var row = $("<li class='media'></li>").append([ picture, data1, ReplayTemp1 ]);
							Replay.append([ Replay_picture, Rdata1 ]);
						}
						
						
					});	
				}				
			});
		});
		
		
		
		
		
		
		
		
		
		
			
			
			
			
			
		})

		var cID=0;
		//	 		回覆的功能cID
		function replay(x) {
			 cID = $(x).val();
				
		
			
			
			
		}


		
	</script>




	<!-- 				  地圖的彈跳視窗 -->
	<div class="modal fade" id="myModalHorizontal2" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabe1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabe2">地圖</h4>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form class="form-horizontal" role="form">

						<iframe width="570" height="450" frameborder="0" style="border: 0"
							src="" allowfullscreen> </iframe>

					</form>
				</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						取消</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 以下為訊息編輯 -->

<!-- <script data-require="marked@*" data-semver="0.3.1"src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script> -->

<script type='text/javascript' src="bootstrap/comments/js/bootstrap-markdown.zh-tw.js"></script>
	
	

<!-- 				  留言板回覆的彈跳視窗 -->
	<div class="modal fade" id="myModalHorizontal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabe1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabe2">訊息輸入</h4>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form class="form-horizontal" role="form">

						<!-- 					以下為訊息輸入 -->
						<form>
<!-- 							<input name="title" type="text" placeholder="Title?" -->
<!-- 								class='form-control' /> -->
							<textarea id='textarea' name="content" data-provide="markdown" clas='status-box md-input'
								rows="10"></textarea>
							<!--     <label class="checkbox"> -->
							<!--       <input name="publish" type="checkbox"> sddsa -->
							<!--     </label> -->
							<!--     <hr/> -->

						</form>
						
					</form>
				</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<button id='sumnit' type="submit" class="btn btn-default" data-dismiss="modal">發布訊息</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

<script type='text/javascript'src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script>
<script data-require="marked@*" data-semver="0.3.1"src="http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.1/marked.js"></script>
<script>
$(function(){
	$("#textarea").markdown({autofocus:true,savable: true,
		onSave: function (e) {
			alert("save");
// 			  $('<li class="col-xs-6 pull-right end-markdown">').append(e.parseContent()).prependTo('.posts');
			
		}
	
	})
	
})

</script>






</body>
</html>