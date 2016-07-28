<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="bootstrap/about/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
</head>
<body>
	<table id="productTable" class="table table-striped">
		<thead>
			<tr>
				<th>id</th>
				<th>名稱</th>
				<th>價錢</th>
				<th>狀態</th>
				<th>圖片</th>

				<th><div id="123">
						<button id="btn_insert" class="btn btn-primary">新增</button>
					</div></th>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach var="bean" items="${menu}">
				<tr>
					<td>${bean.foodID }</td>
					<td>${bean.foodName }</td>
					<td>${bean.unitPrice}</td>
					<td class="status">${bean.statusID }</td>
					<td><img src="${bean.foodIMG }"
						style="width: 80px; height: 60px" class="img-thumbnail"></td>

					<td>
						<button class="glyphicon glyphicon-edit" data-toggle="modal"
							data-target="#dialog${bean.foodID}" style="font-size: 20px;"></button>
						<button class="glyphicon glyphicon-remove del" style="font-size: 20px" fid ="${bean.foodID }" id="del"></button>
					</td>
				</tr>
				<!-- dialog-->
				<div id="dialog${bean.foodID }" class="modal fade" role="dialog">
				
					<div class="modal-dialog">
					
						<div class="modal-content">
						    <form>
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">餐點編輯</h4>
							</div>
							<div style="margin:40px">
							餐點名稱:<input name="fName"type="text" class="form-control" value="${bean.foodName }">
							價錢:<input name="fPirce"type="text" class="form-control" value="${bean.unitPrice }" >
							<br>
							<input type="checkbox" data-toggle="toggle" data-on="有貨" data-off="沒貨">
							<br>
						    <br>
									
							<input type="file" id="menuIMG" name="menuIMG" >
							</div>
							<div class="modal-footer">
							    <input  class="btn btn-success" type="submit" name="menuSubmit" value="送出">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">返回</button>
							</div>
							</form>
						</div>
					</div>
					
				</div>
			</c:forEach>

		</tbody>
	</table>
<script src="bootstrap/sweetAlert/sweetalert.min.js"></script> 
<link rel="stylesheet" type="text/css" href="bootstrap/sweetAlert/sweetalert.css">
<script type="text/javascript">
     var s = $('.status');
     for(var i =0;i<s.length;i++){
    	 var temp = $(s[i]);
    	 if(temp.text()==1){
        	console.log("有貨")
        	temp.text("有貨")
         }else{
    		 console.log("沒貨")
    		 temp.text("沒貨")
         }
     }
    
    $('.del').on('click',function(){
    	var f = $(this).attr('fid');
    	swal({   title: "確定刪除?",   
    			text: "刪除後無法復原",   
    			type: "warning",   
    			showCancelButton: true,   
    			confirmButtonColor: "#DD6B55",   
    			confirmButtonText: "確定",   
    			cancelButtonText: "取消",
    			closeOnConfirm: false
    			}, 
    			function(){   
    				swal({
    					title: "刪除成功!",   
    	    			text: "您的商品已經刪除", 
    	    			type: "success"
    				},function(){
    					$.ajax({
        		    		'type' : 'get',
        					'url' : 'MenueditDelete?f='+f+'',
        					'success': function(){
        						location.reload();
        					}

        		    	})
    				})
    				
    			});
    	
    	
    	
    	
    })
     
</script>



</body>
</html>