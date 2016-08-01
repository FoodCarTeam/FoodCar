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
/* 以下是按讚 */
 .teacher-list-nolove { 
 	position: relative; 
 	cursor: pointer; 
 	float: left; 
 	line-height: 55px; 
 	padding-left: 50px; 
 	background: url("images/likeIcon/loveIcon.png") no-repeat left center; 
 	background-size: 50px auto; 
 } 

.teacher-list-nolove a{ text-decoration:none; color:#333;}
.teacher-list-love{ position: relative; cursor: pointer; float:left; line-height:55px; padding-left: 50px; background: url("images/likeIcon/love.png") no-repeat left center; background-size: 50px auto;}
.teacher-list-love a{ text-decoration:none; color:#333;}
.teacher-love-addnum{ position: absolute; color:#ff4255; right:0; top:0; opacity: 0; font-size:14px;-webkit-animation:lovestar 1.2s 0s 1 ease normal none ;-moz-animation:lovestar 1.2s 0s 1 ease normal none ;animation:lovestar 1.2s 0s 1 ease normal none ;}

@-webkit-keyframes lovestar{
        0%{
            opacity:0;
            -moz-transform:translate3d(0,-10px,0);
        } 50%{
              opacity:1;
              -webkit-transform:translate3d(0,-30px,0) scale(2,2);
          }
        100%{
            opacity:0;
            transform:translate3d(-15px,0,0) scale(.4,.4) rotate(180deg);;
        }
    }
    @-moz-keyframes lovestar{
        0%{
            opacity:0;
            -moz-transform:translateY(-10px);
        } 50%{
              opacity:1;
              -moz-transform:translate3d(0,-30px,0) scale(2,2);
          }
        100%{
            opacity:0;
            transform:translate3d(-15px,0,0) scale(.4,.4) rotate(180deg);
        }
    }
    @keyframes lovestar{
        0%{
            opacity:0;
            transform:translate3d(0,-10px,0);
        } 50%{
              opacity:1;
              transform:translate3d(0,-30px,0) scale(2,2);
          }
        100%{
            opacity:0;
            transform:translate3d(-15px,0,0) scale(.4,.4) rotate(180deg);
        }
    }
}
</style>

<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>


<!-- 編輯的ＣＳＳ -->
<link rel='stylesheet'
	href='bootstrap/comments/Markdown/css/bootstrap-markdown.min.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='bootstrap/comments/css/bootstrap-markdown.less'
	type='stylesheet/less' />

<!-- 以下為sweetAlert -->
<script src="sweetalert2/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="sweetalert2/sweetalert2.min.css">

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
	
	
	
	<jsp:include page="header.jsp"></jsp:include>


	<input type="hidden" id='storeName' value="${store.sName}">
	<input type="hidden" id='storeLogo' value="${store.sLogo}">
	<input type="hidden" id='storeID' value="${store.sID}">


	<input type="hidden" id='memberName' value="${member.mName}">
	<input type="hidden" id='memberImg' value="${member.mIMG}">
	<input type="hidden" id='memberID' value="${member.mID}">







	<script type="text/javascript" src="bootstrap/js/jquery.unveil.js"></script>
	<script type="text/javascript" src="bootstrap/js/page.js"></script>
	<div id="MainContent">
		<div class="row">
			<div class="small-12 large-50 columns">
				<div class="truck-details">
					<div class="content">
						<h1>
							<%-- 							${select.sName} <a href='menu?s=${select.sID}' class="book-button">點餐</a> --%>
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
<!-- 								以下是明天後天營業時間 -->
									<div class="dropdown">
										  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">明後天營業時間
										  <span class="caret"></span></button>
										  <ul class="dropdown-menu">
										    <li><a id='openDay1'></a></li>
										    <li><a id='openDay2'></a></li>
										  </ul>
									</div>
								</div>

								<div class="small-12 medium-7 large-7 columns">
									<div class="right">
										<div class="clock"></div>
										<span id="openTime"></span>
									</div>
								</div>
							</div>
							<div id="GoogleMap">
								<div class="col-sm-10 col-sm-offset-1" style="height: auto;">

									<img data-toggle="modal" data-target="#myModalHorizontal2"
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
								$(function() {
// 									以下是今日營業時間
									$.ajax({
										"url":"SelectStoreOpenTimeServlet",
										"method":"GET",
										"dataType":"JSON",
										"data":{"sID":'${select.sID}'},
										"success":function(data){
											console.log(data);
											$("#openTime").html("今日營業時間："+data[0]);
											$("#openDay1").html("明天營業時間："+data[1]);
											$("#openDay2").html("後天營業時間："+data[2]);
											
											
										}
									});
									
									
									
									
									
									
									
									var location = '${map}';
									console.log('${map}');

									$("#123").attr("src", "http://maps.googleapis.com/maps/api/staticmap?center=" + location + "&zoom=16&size=1200x300&scale=2&markers=icon:http://i.imgur.com/KYhVtYS.png?2|" + location + "&key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A");
									$("#123").on('mouseover', function() {
										$("#123").css({
											"cursor" : "pointer"
										});
									});
									$("#123").on('click', function() {
										$("#123").attr("data-toggle", 'modal');
										$("#123").attr("data-target", '#myModalHorizontal2');
									});

									$('iframe').attr('src', 'https://www.google.com/maps/embed/v1/place?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&q=' + location);

									
									// 以下是按讚
									var recommentCount;
									$("body").on("click", ".teacher-list-nolove", function(e) {
										e.preventDefault();
								        var loves={};
								        loves.num=parseInt($(this).find("span").html())+1;
								        if($(this).attr("data-loves")=="yes"){
// 											以下是刪除
								        	 loves.num=parseInt($(this).find("span").html())-1;
											 loves.addstr="<div class='teacher-love-addnum'>-1</div>";
									            $(this).append(loves.addstr);
									            loves.addone=$(this).find(".teacher-love-addnum");
									            $(this).attr("data-loves","yes");
									            $(this).find("span").html(loves.num);
								        	  	$(this).attr("data-loves","no");


// 											$.ajax({
// 												"menthod" : "GET",
// 												"url" : "DeleteCommendServlet",
// 												"contentType" : "application/json;charset=UTF-8",
// 												"data" : {
// 													"sID" : '${select.sID}',
// 													"mID" : '${member.mID}',
// 												},
// 												"success" : function() {
		
// 													$.ajax({
// 														"menthod" : "GET",
// 														"url" : "SelectRecommendServlet",
// 														"contentType" : "application/json;charset=UTF-8",
// 														"data" : {
// 															"sID" : '${select.sID}',
// 															"mID" : '${member.mID}'
// 														},
// 														"dataType" : "JSON",
// 														"success" : function(data) {
// 															console.log(data.result);
// 															if (data.result) {
// 																console.log("還沒按過");
// 																$("#goodIcon").removeClass("teacher-list-love").addClass("teacher-list-nolove");
// 																recommentCount=recommentCount+1;
// 																$("#goodNumber").html("已經有" +recommentCount+ "人喜歡了！");
// 															} else {
// 																console.log("按過");
// 																recommentCount=recommentCount-1;
// 																$("#goodIcon").removeClass("teacher-list-nolove").addClass("teacher-list-love");
// 																$("#goodNumber").html("已經有" +recommentCount+ "人喜歡了！");
// 															}
// 														}
// 													});
// 												}
// 											});
											
											
											
										} else {
// 											以下是新增
											 loves.addstr="<div class='teacher-love-addnum'>+1</div>";
									            $(this).append(loves.addstr);
									            loves.addone=$(this).find(".teacher-love-addnum");
									            $(this).attr("data-loves","yes");
									            $(this).find("span").html(loves.num);

											
												$.ajax({
													"menthod" : "GET",
													"url" : "InsertRecommendServlet",
													"contentType" : "application/json;charset=UTF-8",
													"data" : {
														"sID" : '${select.sID}',
														"mID" : '${member.mID}',
													},
													//"dataType":"JSON",
													"success" : function() {
														console.log("新增成功");
														
														$.ajax({
															"menthod" : "GET",
															"url" : "SelectRecommendServlet",
															"contentType" : "application/json;charset=UTF-8",
															"data" : {
																"sID" : '${select.sID}',
																"mID" : '${member.mID}'
															},
															"dataType" : "JSON",
															"success" : function(data) {
																console.log(data.result);
																if (data.result) {
																	console.log("按過");
																	recommentCount=recommentCount-1;
																	$("#goodIcon").removeClass("teacher-list-love").addClass("teacher-list-nolove");
																	$("#goodNumber").html("已經有" +recommentCount+ "人喜歡了！");
																} else {
																	console.log("還沒按過");
																	$("#goodIcon").removeClass("teacher-list-nolove").addClass("teacher-list-love");
																	recommentCount=recommentCount+1;
																	$("#goodNumber").html("已經有" +recommentCount+ "人喜歡了！");
																}
															}
														});
													}
												});

												
											
										}
									})

									checkGood();
									
// 									計算有多少人喜歡
									$.ajax({
										"menthod" : "GET",
										"url" : "RecommendCountServlet",
										"contentType" : "application/json;charset=UTF-8",
										"data" : {
											"sID" : '${select.sID}'
										},
										"dataType" : "JSON",
										"success" : function(data) {
											console.log("有多少人喜歡："+data.recommentCount);
											console.log("多少人喜歡型態："+typeof(data.recommentCount));
											recommentCount = data.recommentCount;
// 											console.log("有多少人："+data.recommentCount);
											if (data.recommentCount == 0) {
												console.log("趕快成為第一個喜歡的人！");
												$("#goodNumber").html("趕快成為第一個喜歡的人！");
											} else {
												console.log("多少人喜歡了");
												$("#goodNumber").html("已經有" + data.recommentCount + "人喜歡了！");
												// 				console.log($("#goodCount").val());
											}
										}
									});

									function checkGood() {
										console.log("執行檢查");
										$.ajax({
											"menthod" : "GET",
											"url" : "SelectRecommendServlet",
											"contentType" : "application/json;charset=UTF-8",
											"data" : {
												"sID" : '${select.sID}',
												"mID" : '${member.mID}'
											},
											"dataType" : "JSON",
											"success" : function(data) {
												console.log(data.result);
												if (data.result) {
													console.log("還沒按過");
													$("#goodIcon").removeClass("teacher-list-love").addClass("teacher-list-nolove");
													recommentCount=recommentCount+1;
													$("#goodNumber").html("已經有" +recommentCount+ "人喜歡了！");
												} else {
													console.log("按過");
													recommentCount=recommentCount-1;
													$("#goodIcon").removeClass("teacher-list-nolove").addClass("teacher-list-love");
													$("#goodNumber").html("已經有" +recommentCount+ "人喜歡了！");
												}
											}
										});
									}
								
									
									
									
									
									
									
									
									
									
									
									
									
									

								})
							</script>



							<!--/地圖-->

							<!--菜單-->
							<div class="menu" >
								<div class="row">
									<div class="small-12 large-50 columns">
										<h2>菜單</h2>
									</div>
								</div>
								<div class="pics row">
									<ul class="clearing-feature small-block-grid-6">
										<c:forEach var="bean" items="${menus}">
											<li class="clearing-featured-img"><img
												src="${bean.foodIMG }" style="width:200px;height:150px"/>
												<div class="text-content">
													<span>${bean.foodName}</span>
												</div></li>
										</c:forEach>


									</ul>
								</div>
							</div>
							<!--/菜單-->
							<a href='menu?s=${select.sID}'
								class="btn btn-warning btn-large btn-block lead glyphicon glyphicon-cutlery"
								style="font-size: 30px"> 點餐</a> <br>
							<!-- 							以下為留言板 -->
							<!-- 							<div class="container"> -->
							<!-- 以下為點讚 -->
							<div class='col-sm-12 col-sm-offset-5'>
								<div class="teacher-list-love" id='goodIcon' style="height:50px">
									<span id='goodNumber' style="font-size: 25px;">1</span>
								</div>
							</div>
							<br>
							<br>
							<br>
							<div class="row">

								<!-- 					以下為主流言訊息輸入 -->

								<c:choose>
									<c:when test="${member!=null}">

										<div class='col-sm-6 col-sm-offset-3 well'>
											<form>
												<textarea id='textarea2' name="content"
													data-provide="markdown" clas='status-box md-input' rows="8"></textarea>
											</form>
											<div class='col-md-2 col-md-offset-8'>
												<button id='sumnit2' type="submit"
													class="btn btn-default  well"
													style='margin-top: 5px; margin-bottom: 0px; padding-bottom: 5px; padding-top: 5px'>發布訊息</button>
											</div>
										</div>
									</c:when>
									<c:when test="${member==null}">
									</c:when>
								</c:choose>

								<script>
									$(function() {
										console.log($("#memberName").val());

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
		$(document).ready(function() {
			$('#menu-mobile').slicknav({
				label : '',
				prependTo : '#MenuPhone'
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
						var picture_1 = $("<img class='media-object img-circle' src=''style='width:150px' alt='profile'></img>");
						// 					以下為更換照片

						picture_1.attr("src", value.mImg);
						picture.append([ picture_1 ]);

						var data1 = $("<div class='media-body' style='width:700px;'></div>");
						var data2 = $("<div class='well well-l'></div>");
						var data2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>").text(value.mName);
						var data2_2 = $("<ul class='media-date text-uppercase reviews list-inline'></ul>");
						var cDateTemp = value.cDate;

						var prettyDate = jQuery.format.prettyDate(cDateTemp);

						var prettyDate_1 = $("<li style='font-size:10px;float:right'></li>");
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

						data2_4_1.attr("id", value.cID);

						var cID = value.cID;
						data2_4_1_1_1.attr("value", cID);
						data2_4_1_1.append(data2_4_1_1_1);

						data2_4_1.append(data2_4_1_1);
						data2_4_1.append("回覆");

						if (value.ResponseTrueOrFalse == "true") {
							var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
							data2_4_2.attr("href", "#reply" + value.cID);
							data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");

							data2_4_2.attr("id", value.ResponseCount);
							var ResponseCount1 = data2_4_2.attr("id");

							data2_4_2.text(value.ResponseCount + "則回覆");

							var ReplayTemp1 = $("<div class='collapse' id=''>");
							ReplayTemp1.attr("id", "reply" + value.cID);

							// 						以下處理如果有回覆

							var ReplayTemp2 = $("<ul class='media-list'>");

							$.each(value.Response, function(index, value) {

								var Replay = $("<li class='media media-replied' style='margin-left:50px;'></li>");
								var Replay_picture = $("<a class='pull-left' href='#'></a>");
								var Replay_picture_1 = $("<img class='media-object img-circle' style='width:150px' src='' alt='profile'>");
								//	 						回覆者的照片
								Replay_picture_1.attr("src", value.mImg);
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

								var RprettyDate = jQuery.format.prettyDate(cDateTemp2);

								var RprettyDate_1 = $("<li style='font-size:10px;float:right'></li>");
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
								var button=$('<div class="dropdown" style="float:right"><button class="btn btn-primary dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu" aria-labelledby="menu1"><li role="presentation"><a role="menuitem" tabindex="-1" href="">更改</a></li><li role="presentation"><a role="menuitem" tabindex="-1" href="">刪除</a></li></ul></div>');
								
								Replay.append([ button,Replay_picture, Rdata1 ]);
								ReplayTemp2.append(Replay);

							});
							ReplayTemp1.append(ReplayTemp2);

						} else {
							// 							判斷是否有留言回覆
							var data2_4_2 = "";

						}

						data2.append([ data2_1, data2_2, data2_3, data2_4_1, data2_4_2 ]);
						data1.append([ data2 ]);
						var button=$('<div class="dropdown" style="float:right"><button class="btn btn-primary dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu" aria-labelledby="menu1"><li role="presentation"><a role="menuitem" tabindex="-1" href="">更改</a></li><li role="presentation"><a role="menuitem" tabindex="-1" href="">刪除</a></li></ul></div>');
						
						var row = $("<li class='media'></li>").append([button, picture, data1, ReplayTemp1 ]);
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
				// 			console.log($("#textarea"));
				// 			console.log( $("#textarea").html());
				// 			console.log("回覆即時:"+content);

				var DateTemp = new Date();

				var Date1 = $.format.date(DateTemp.toString(), "yyyy-MM-dd HH:mm:ss");

				var memberName2;
				var storeName2;
				if (typeof ($("#memberName").val()) == "undefined") {
					memberName2 = "";
					storeName2 = $("#storeName").val();
				} else {
					memberName2 = $("#memberName").val();
					storeName2 = $("#storeName").val();
				}

				var data = {
					"rID" : "",
					"cID" : cID,
					"cContent" : content,
					"sName" : storeName2,
					"mName" : memberName2,
					"cDate" : Date1,
					"cIP" : ""
				};
				var cIDD = cID;
				// 					console.log("即時的回覆cIDD："+cIDD);
				// 					console.log("即時的回覆cID："+cID);
				// 						console.log(data);
				// 						console.log(JSON.stringify(data));
				// 			回覆
				$.ajax({
					"menthod" : "GET",
					"url" : "comments/controller/ReplayCommentsServlet",
					"contentType" : "application/json;charset=UTF-8",
					"data" : data,
					"success" : function() {
						//				 	以下為即時增加回覆
						var temp = $("a");

						$.each(temp, function(index, value) {
							if ($(value).attr("id") == cIDD) {
								// 							console.log($(value).html());
								// 							$(value).parent().parent().next().children().show();
								//  						console.log("找cID"+cIDD);
								var Replay = $("<li class='media media-replied' style='margin-left:50px;'></li>");
								var Replay_picture = $("<a class='pull-left' href='#'></a>");
								var Replay_picture_1 = $("<img class='media-object img-circle' style='width:150px' src='' alt='profile'>");
								//	回覆者的照片

								if (typeof (value.mImg) == "undefined") {

									Replay_picture_1.attr("src", value.sLogo);
								} else {

									Replay_picture_1.attr("src", value.mImg);
								}

								if (typeof ($("#memberImg").val()) == "undefined") {

									Replay_picture_1.attr("src", $("#storeLogo").val());
								} else {
									Replay_picture_1.attr("src", $("#memberImg").val());
								}

								Replay_picture.append(Replay_picture_1);

								var Rdata1 = $("<div class='media-body' style='width:500px;'></div>");
								var Rdata2 = $("<div class='well well-lg'>");
								var Rdata2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>");

								// 								var cID=$("<p style='font-size:1'></p>").text(value.cID);

								Rdata2_1.html("<span class='glyphicon glyphicon-share-alt'></span>");
								// 	判斷是餐車還是會員回覆
								// 							if (value.sName == "") {
								// 								Rdata2_1.append(value.mName);
								// 							} else {
								// 								Rdata2_1.append(value.sName);
								// 							}

								if (typeof ($("#memberName").val()) == "undefined") {
									Rdata2_1.append($("#storeName").val());
								} else {
									Rdata2_1.append($("#memberName").val());
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

								var RprettyDate = jQuery.format.prettyDate(cDateTemp2);

								var RprettyDate_1 = $("<li style='font-size:10px;float:right'></li>");
								RprettyDate_1.text(RprettyDate);

								Rdata2_2.append([ Rdata2_2_2, Rdata2_2_3, Rdata2_2_1, Rdata2_2_4, Rdata2_2_5 ]);
								Rdata2_2.append(RprettyDate_1);
								var Rdata2_3 = $("<p class='media-comment'></p>").html(content);

								// 							console.log("即時回覆"+content);

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
								// 							console.log("回覆："+$("#"+cIDD+" ~ a").html());
								if ($("#" + cIDD + " ~ a").html() == null) {

									var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
									data2_4_2.attr("href", "#reply" + cIDD);
									data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");
									//	 								console.log(cIDD);
									// 									data2_4_2.attr("id",cIDD);
									var ResponseCount1 = data2_4_2.attr("id");

									data2_4_2.text(1 + "則回覆");
									data2_4_2.attr("id", 1);
									$(value).parent().append(data2_4_2);

									var ReplayTemp1 = $("<div class='collapse' id=''>");
									ReplayTemp1.attr("id", "reply" + cIDD);

									var ReplayTemp2 = $("<ul class='media-list'>");
									ReplayTemp2.append(Replay);

									ReplayTemp1.append(ReplayTemp2);

									//	 							要重新抓
									//	 							var Rdata1 = $("<div class='media-body' style='width:500px;'></div>");

									$(value).parent().parent().append(ReplayTemp1);

									//	 								Rdata1.append(ReplayTemp1);

								} else {
									// 									以下為更改留言數量
									var tmepCount = $(value).next().attr("id");

									console.log("tmepCount:" + tmepCount);
									var tmepCountNumber = parseInt(tmepCount);
									tmepCountNumber = tmepCountNumber + 1;

									$(value).next().attr("id", tmepCountNumber);

									$(value).next().text("");
									//		 							console.log(tmepCount);
									$(value).next().text(tmepCountNumber + "則回覆")

									console.log($(value));

									$(value).parent().parent().next().children().append(Replay);

								}

								// 							console.log("this:"+$(this).next().html());
								if (typeof ($(value).next().html()) == 'undefined' || 1 == 1) {

								} else {
									//	 							
								}
								var button=$('<div class="dropdown" style="float:right"><button class="btn btn-primary dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu" aria-labelledby="menu1"><li role="presentation"><a role="menuitem" tabindex="-1" href="">更改</a></li><li role="presentation"><a role="menuitem" tabindex="-1" href="">刪除</a></li></ul></div>');
								
								// 							var row = $("<li class='media'></li>").append([ picture, data1, ReplayTemp1 ]);
								Replay.append([ button,Replay_picture, Rdata1 ]);
							}

						});
					}
				});
			});

			//	 		console.log($(".glyphicon glyphicon-search"));
			//	 		$(".glyphicon glyphicon-search").text("預覽");
			// 以下為即時新增主留言
			$("#sumnit2").on('click', function() {
				// 			alert("cID"+cID);

				var FContent = $("#textarea2").data('markdown').parseContent();
				$("#textarea2").val("");
				var nowDate = new Date();
				var cDateTemp = $.format.date(nowDate.toString(), "yyyy-MM-dd HH:mm:ss");

				var memberID;
				var storeID;
				if (typeof ($("#memberID").val()) == "undefined") {
					memberID = '${select.sID}';
					storeID = $("#storeID").val();
				} else {
					memberID = $("#memberID").val();
					storeID = '${select.sID}';
				}
				console.log("memberID:" + memberID)
				console.log("storeID:" + storeID)
				console.log("cDateTemp:" + cDateTemp)
				console.log("FContent:" + FContent)

				$.ajax({
					"menthod" : "POST",
					"url" : "InsertCommentsServlet",
					"contentType" : "application/json;charset=UTF-8",
					"dataType" : "JSON",
					"data" : {
						"mID" : memberID,
						"sID" : storeID,
						"cDate" : cDateTemp,
						"cContent" : FContent,
					},
					"error" : function(a, b, c) {
						console.log(a);
						console.log(b);
						console.log(c);
					},
					"success" : function(data) {
						//	 				alert("新增成功");
						// 					console.log("新增成功");
						//	 				以下為即時新增
						// 新增後的ＰＫ
						// 					console.log("cID1~~:"+data.cID);

						var picture = $("<a class='pull-left' href='#'></a>");
						var picture_1 = $("<img class='media-object img-circle' style='width:150px' src='' alt='profile'></img>");
						// 					以下為更換照片

						if (typeof ($("#memberImg").val()) == "undefined") {
							picture_1.attr("src", $("#storeLogo").val());
						} else {
							picture_1.attr("src", $("#memberImg").val());
						}

						picture.append([ picture_1 ]);

						var data1 = $("<div class='media-body' style='width:700px;'></div>");
						var data2 = $("<div class='well well-l'></div>");

						var data2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>");

						if (typeof ($("#memberName").val()) == "undefined") {
							data2_1.append($("#storeName").val());
						} else {
							data2_1.append($("#memberName").val());
						}

						var data2_2 = $("<ul class='media-date text-uppercase reviews list-inline'></ul>");

						var prettyDate = jQuery.format.prettyDate(nowDate);

						var prettyDate_1 = $("<li style='font-size:10px;float:right'></li>");
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

						//			 		cID
						data2_4_1.attr("id", data.cID);

						var cID = 1;
						data2_4_1_1_1.attr("value", data.cID);
						data2_4_1_1.append(data2_4_1_1_1);

						data2_4_1.append(data2_4_1_1);
						data2_4_1.append("回覆");

						//			 			var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
						//			 			data2_4_2.attr("href", "#reply" + 99);
						//			 			data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");

						//			 			data2_4_2.attr("id",99);
						//			 			var ResponseCount1=data2_4_2.attr("id");

						//			 			data2_4_2.text(value.ResponseCount + "則回覆");

						//			 			var ReplayTemp1 = $("<div class='collapse' id=''>");
						//			 			ReplayTemp1.attr("id", "reply" + 99);

						data2.append([ data2_1, data2_2, data2_3, data2_4_1 ]);
						data1.append(data2);
						var button=$('<div class="dropdown" style="float:right"><button class="btn btn-primary dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu" aria-labelledby="menu1"><li role="presentation"><a role="menuitem" tabindex="-1" href="">更改</a></li><li role="presentation"><a role="menuitem" tabindex="-1" href="">刪除</a></li></ul></div>');
						
						var row = $("<li class='media'></li>").append([button, picture, data1 ]);
						$("#testTop").prepend(row);

					}

				})

			});

		})

		cID = 0;
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

	<script type='text/javascript'
		src="bootstrap/comments/js/bootstrap-markdown.zh-tw.js"></script>



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
							<textarea id='textarea' name="content" data-provide="markdown"
								clas='status-box md-input' rows="10"></textarea>
							<!--     <label class="checkbox"> -->
							<!--       <input name="publish" type="checkbox"> sddsa -->
							<!--     </label> -->
							<!--     <hr/> -->

						</form>

					</form>
				</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<button id='sumnit' type="submit" class="btn btn-default"
						data-dismiss="modal">發布訊息</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<script type='text/javascript'
		src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script>
	<script data-require="marked@*" data-semver="0.3.1"
		src="http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.1/marked.js"></script>
	<script>
		$(function() {
			$("#textarea").markdown({
				autofocus : true,
				savable : true,
				onSave : function(e) {
					alert("save");
					// 			  $('<li class="col-xs-6 pull-right end-markdown">').append(e.parseContent()).prependTo('.posts');

				}

			})

		})
	</script>






</body>
</html>