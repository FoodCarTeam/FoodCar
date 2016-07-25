<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

.content_box{  
        display: inline-block;
        overflow:hidden;
        width:800px; 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>
<script type='text/javascript' src="bootstrap/comments/js/bootstrap.js"></script>
<script type='text/javascript' src="bootstrap/comments/Markdown/locale/bootstrap-markdown.zh-tw.js"></script>
<link rel='stylesheet' href='bootstrap/comments/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap-theme.css' type='text/css' media='all' />
<!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/stores/css/style.css' type='text/css' media='all' />

<!-- 以下為訊息編輯 -->
<script type='text/javascript'
	src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script>
<script data-require="marked@*" data-semver="0.3.1"
	src="http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.1/marked.js"></script>
<script data-require="marked@*" data-semver="0.3.1"
	src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script>
<link rel='stylesheet'
	href='bootstrap/comments/Markdown/css/bootstrap-markdown.min.css'
	type='text/css' media='all' />



<script type='text/javascript'
	src="bootstrap/comments/Masonry/jquery.masonry.min.js"></script>


</head>
<body>

	<script>
		$(function() {
			$.ajax({
				"type" : "get",
				"url" : "CommentsServlet",
				"dataType" : "JSON",
				"data" : {
					"sID" : 1
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

						var data1 = $("<div class='media-body'></div>");
						var data2 = $("<div class='well well-l'></div>");
						var data2_1 = $("<h4 class='media-heading text-uppercase reviews'></h4>").text(value.mName);
						var data2_2 = $("<ul class='media-date text-uppercase reviews list-inline'></ul>");
						var cDateTemp = value.cDate;
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
						var data2_3 = $("<p class='media-comment'></p>").text(value.cContent);
						var data2_4_1 = $("<a onClick='replay($(this).children().children())' id='replyButton' data-toggle='modal' data-target='#myModalHorizontal' class='btn btn-info btn-circle text-uppercase' href='' id='reply'></a>");
						var data2_4_1_1 = $("<span class='glyphicon glyphicon-share-alt'></span>");
						var data2_4_1_1_1 = $("<input type='hidden' value=''/>");

						var cID = value.cID;
						data2_4_1_1_1.attr("value", cID);
						data2_4_1_1.append(data2_4_1_1_1);

						data2_4_1.append(data2_4_1_1);
						data2_4_1.append("回覆");

						if (value.ResponseTrueOrFalse == "true") {
							var data2_4_2 = $("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
							data2_4_2.attr("href", "#reply" + ReplyCount);
							data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");
							data2_4_2.text(value.ResponseCount + "則回覆");

							var ReplayTemp1 = $("<div class='collapse' id=''>");
							ReplayTemp1.attr("id", "reply" + ReplyCount);

							// 						以下處理如果有回覆

							var ReplayTemp2 = $("<ul class='media-list'>");

							$.each(value.Response, function(index, value) {

								var Replay = $("<li class='media media-replied'></li>");
								var Replay_picture = $("<a class='pull-left' href='#'></a>");
								var Replay_picture_1 = $("<img class='media-object img-circle' src='' alt='profile'>");
								//	 						回覆者的照片
								Replay_picture_1.attr("src", "https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
								Replay_picture.append(Replay_picture_1);

								var Rdata1 = $("<div class='media-body' ></div>");
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
								Rdata2_2.append([ Rdata2_2_2, Rdata2_2_3, Rdata2_2_1, Rdata2_2_4, Rdata2_2_5 ]);
								var Rdata2_3 = $("<p class='media-comment'></p>").text(value.cContent)
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

			// 			以下處理訊息輸入 
			$("#sumnit").on("click", function() {
			var temp = $(this).parents("div").html();
		
			console.log(cID);
// 			var title = $("input[name='title']").val();
			var content = $("textarea[name='content']").val();
			
// 			回覆
			$.ajax({
				"type:":"POST",
				"url":"ReplyComments",
				"contentType":"application/json;charset=UTF-8",
				"data":JSON.stringify({
					"cID":cID,
					"cContent":content,
					"sName":"",
					"mName":"",
					"cDate":Date(),
				}),
				"success":function(){
					console.log("成功");
				}
				
				
			})
			
			

		})
		
		
		
		
		
		
		
		  $('#test').imagesLoaded(function() {
	            $('#test').masonry({
	                itemSelector: '.content_box',
	                columnWidth: 1000,
	                animate: true
	            });
	        });
		
		
			
			
			
		})

		var cID=0;
		//	 		回覆的功能cID
		function replay(x) {
			 cID = $(x).val();
			console.log(cID);
		
			
			
			
		}


		
	</script>

	



	<!-- 				  回覆的彈跳視窗 -->
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
					<button id='sumnit' type="submit" class="btn btn-default">發布訊息</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>









	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1" id="logout">
				<div class="tab-content">
					<div id='test' class="tab-pane active" id="comments-logout"  style="height:500px;overflow: auto">
						<ul class="media-list content_box">

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>