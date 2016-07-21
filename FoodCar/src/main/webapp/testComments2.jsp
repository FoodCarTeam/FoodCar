<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>
<script type='text/javascript' src="bootstrap/comments/js/bootstrap.js"></script>

<link rel='stylesheet' href='bootstrap/comments/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.css' type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap-theme.css' type='text/css' media='all' />

</head>
<body>

 <script>
// $(function(){
// 	$.ajax({
// 		"type" : "get",
// 		"url" : "CommentsServlet",
// 		"dataType" : "JSON",
// 		"data":{"sID":1},
// 		"success" : function(datas) {
			
// 			var tb = $("#test>ul");
// 			flag = $(document.createDocumentFragment());
// 			tb.empty();
		
// 			$.each(datas,function(index,value){
// 				var ReplyCount=1;
// 					var picture=$("<a class='pull-left' href='#'></a>");
// 					var picture_1=$("<img class='media-object img-circle' src='' alt='profile'></img>");
// // 					以下為更換照片
// 						picture_1.attr("src","https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
// 					picture.append([picture_1]);
						
// 					var data1=$("<div class='media-body'></div>");
// 					var data2=$("<div class='well well-l'></div>");
// 					var data2_1 =$("<h4 class='media-heading text-uppercase reviews'></h4>").text(value.mName);
// 					var data2_2=$("<ul class='media-date text-uppercase reviews list-inline'></ul>");
// 						var cDateTemp=value.cDate;
// 						var year=cDateTemp.substring(0,4);
// 						var month=cDateTemp.substring(5,7);
// 						var day=cDateTemp.substring(8,10);
// 						var hours=cDateTemp.substring(10,13);
// 						var minute=cDateTemp.substring(14,16);
// 						var seconde=cDateTemp.substring(17,19);
// 					var data2_2_1=$("<li class='aaaa'></li>").text(year+"年");
// 					var data2_2_2=$("<li class='mm'></li>").text(month+"月");
// 					var data2_2_3=$("<li class='dd'>22</li>").text(day+"日");
// 					data2_2.append([data2_2_1,data2_2_2,data2_2_3]);
// 					var data2_3=$("<p class='media-comment'></p>").text(value.cContent);
// 					var data2_4_1=$("<a class='btn btn-info btn-circle text-uppercase' href='#' id='reply'><span class='glyphicon glyphicon-share-alt'></span>回覆</a>");
				
// 					if(value.ResponseTrueOrFalse=="true"){
// 						var data2_4_2=$("<a class='btn btn-warning btn-circle text-uppercase' data-toggle='collapse' href=''></a>");
// 						data2_4_2.attr("href","#reply"+ReplyCount);
// 						data2_4_2.html("<span class='glyphicon glyphicon-comment'></span>");
// 						data2_4_2.text(value.ResponseCount+"則回覆");
						
						
						
						
// 						var ReplayTemp1=$("<div class='collapse' id=''>");
// 						ReplayTemp1.attr("id","reply"+ReplyCount);
					
// // 						以下處理如果有回覆

// 					var ReplayTemp2=$("<ul class='media-list'>");
							
						
// 						$.each(value.Response,function(index,value){
							
							
// 							var Replay=$("<li class='media media-replied'></li>");
// 							var Replay_picture=$("<a class='pull-left' href='#'></a>");
// 							var Replay_picture_1=$("<img class='media-object img-circle' src='' alt='profile'>");
// //	 						回覆者的照片
// 							Replay_picture_1.attr("src","https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg");
// 							Replay_picture.append(Replay_picture_1);
							
// 							var Rdata1=$("<div class='media-body'></div>");
// 							var Rdata2=$("<div class='well well-lg'>");
// 							var Rdata2_1=$("<h4 class='media-heading text-uppercase reviews'></h4>");
// 							Rdata2_1.html("<span class='glyphicon glyphicon-share-alt'></span>");
// // 							回覆者名字還沒解決

// 							Rdata2_1.append("asdad");
							
							
// 							Rdata2.append([Rdata2_1]);
// 							Rdata1.append([Rdata2]);
							
							
							
						
// 							Replay.append([Replay_picture,Rdata1]);
// 							ReplayTemp2.append(Replay);

							
						
// 						});
// 						ReplayTemp1.append(ReplayTemp2);
						
						
						
			
						
						
						
						
						
// 					}else{
// 						var data2_4_2="";		
						
						
// 					}
					
				
					
					
// 					data2.append([data2_1,data2_2,data2_3,data2_4_1,data2_4_2]);
// 					data1.append([data2]);
// 					var row = $("<li class='media'></li>").append([picture,data1,ReplayTemp1]);
// 					flag.append(row);
				
			
// 					ReplyCount=ReplyCount+1;
// 			})
// 			tb.append(flag);
			
		
		
// 		}
	
	
// 	})
	
 		
// })
 </script>






<div class="container">
  <div class="row">
    <div class="col-sm-10 col-sm-offset-1" id="logout">
       
       
<!--         <div class="comment-tabs"> -->
<!--             <ul class="nav nav-tabs" role="tablist"> -->
<!--                 <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Comments</h4></a></li> -->
<!--                 <li><a href="#add-comment" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Add comment</h4></a></li> -->
<!--             </ul>             -->
            
            
            
            <div class="tab-content">
                <div id='test' class="tab-pane active" id="comments-logout">                
                    <ul class="media-list">
<!--                     以下開始為一則討論文章的主體 -->
                      <li class="media">
                        <a class="pull-left" href="#">
                          <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews">Marco </h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                                <li class="dd">22</li>
                                <li class="mm">09</li>
                                <li class="aaaa">2014</li>
                              </ul>
                              <p class="media-comment">
                                Great snippet! Thanks for sharing.qdqdqqdq
                              </p>
                              <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
<!--                               以下為回覆統計 -->
                              <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyOne"><span class="glyphicon glyphicon-comment"></span> 3 comments</a>
                          </div>              
                        </div>
<!--                         關閉時collapse，開啟（關閉）中collapsing，開啟collapse in -->
                        <div class="collapse" id="replyOne">
                            <ul class="media-list">
<!--                             以下為回覆 -->


                                <li class="media media-replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/ManikRathee/128.jpg" alt="profile">
                                    </a>
                                    
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> The Hipster</h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Nice job Maria.123
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                    
                                </li>
                                
                                 <li class="media media-replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/ManikRathee/128.jpg" alt="profile">
                                    </a>
                                    
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> The Hipster</h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Nice job Maria.123
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                    
                                </li>
                                
                                
                                
                            </ul>  
                        </div>
                      </li>          
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                      <li class="media">
                        <a class="pull-left" href="#">
                          <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/lady_katherine/128.jpg" alt="profile">
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews">Kriztine</h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                                <li class="dd">22</li>
                                <li class="mm">09</li>
                                <li class="aaaa">2014</li>
                              </ul>
                              <p class="media-comment">
                                Yehhhh... Thanks for sharing.
                              </p>
                              <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                              <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyTwo"><span class="glyphicon glyphicon-comment"></span> 1 comment</a>
                          </div>              
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        <div class="collapse" id="replyTwo">
                            <ul class="media-list">
                                <li class="media media-replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg" alt="profile">
                                    </a>
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> Lizz</h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Classy!
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                </li>
                            </ul>  
                            
                             <ul class="media-list">
                                <li class="media media-replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg" alt="profile">
                                    </a>
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> Lizz</h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Classy!
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                </li>
                            </ul>  
                            
                            
                            
                        </div>
                      </li>
                      
                      
                      
                      
                      
                      
                      
                      
                      
                    </ul> 
                </div>
                
                
<!--                 以下為新增文章的格式 -->
<!--                 <div class="tab-pane" id="add-comment"> -->
<!--                     <form action="#" method="post" class="form-horizontal" id="commentForm" role="form">  -->
<!--                         <div class="form-group"> -->
<!--                             <label for="email" class="col-sm-2 control-label">Comment</label> -->
<!--                             <div class="col-sm-10"> -->
<!--                               <textarea class="form-control" name="addComment" id="addComment" rows="5"></textarea> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="uploadMedia" class="col-sm-2 control-label">Upload media</label> -->
<!--                             <div class="col-sm-10">                     -->
<!--                                 <div class="input-group"> -->
<!--                                   <div class="input-group-addon">http://</div> -->
<!--                                   <input type="text" class="form-control" name="uploadMedia" id="uploadMedia"> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <div class="col-sm-offset-2 col-sm-10">                     -->
<!--                                 <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span> Summit comment</button> -->
<!--                             </div> -->
<!--                         </div>             -->
<!--                     </form> -->
<!--                 </div> -->
<!--                 <div class="tab-pane" id="account-settings"> -->
                    
                </div>
            </div>
        </div>
	</div>
  </div>
  
 
</div>






</body>
</html>