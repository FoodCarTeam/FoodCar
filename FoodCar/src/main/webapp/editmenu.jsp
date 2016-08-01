<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="bootstrap/about/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/about/css/style1.css' type='text/css' media='all' />
<style>
   th{font-size:18px}
   td{font-size:15px;font-family:Microsoft JhengHei}
</style>
</head>
<body>
   
  <nav class="navbar navbar-fixed-top" >
  <div id="Header" style="background-color:white;" >
      <div class="row">
        <div class="small-18 large-12 columns"><p></p><p></p>
        </div>
      </div>
    </div>
   <!--列表-->
    <div class="contain-to-grid">
      <nav class="top-bar" id="TopMenu" data-topbar data-options="is_hover: false">
        <section class="top-bar-section">
          <div class="menu-bar">
<!--列表左邊-->
            <ul class="left">
              <li>
                <div class="top-logo">
                  <a class="logo" href="index.jsp"></a>
                  <a class="logo-text" href="index.jsp"></a>
                </div>
              </li>
            </ul>
<!--/列表左邊-->
<!--列表右邊頭像-->
            <ul class="right">
              <li class="top-search">
                <div class="search-bar">
                  <div id="sb-search" class="sb-search">                
                      <img src="${store.sLogo }" />
                  </div>
                </div>
              </li>
       </ul>
          </div>
        </section>
      </nav>
    </div>
<!--/列表-->
            </nav>
    
    
<div style="margin-left: 200px;margin-right: 200px;">
	<table id="productTable" class="table table-striped" style="margin-top: 100px;">
		<thead>
			<tr>
				<th>id</th>
				<th>名稱</th>
				<th>價錢</th>
				<th>狀態</th>
				<th>圖片</th>

				<th><div id="123">
						<button id="btn_insert" class="btn  btn-primary btn-lg"
							data-toggle="modal" data-target="#ins">新增</button>
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
						<button class="btn btn-info glyphicon glyphicon-edit" data-toggle="modal"
							data-target="#dialog${bean.foodID}" style="font-size: 20px;"></button>
						<button class="btn btn-danger glyphicon glyphicon-remove del"
							style="font-size: 20px" fid="${bean.foodID }" id="del"></button>
					</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>
	<!-- dialog-->
	<c:forEach var="bean" items="${menu}">
		<div id="dialog${bean.foodID }" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">餐點編輯</h4>
					</div>
					<div class="modal-body">
						<form class="form-inline" role="form" method="POST" action="MenueditUpdate" enctype="multipart/form-data">
							<div class="form-group">
								<label for="food">餐點:</label> 
								<input name="food" class="form-control" id="food" value="${bean.foodName }">
							</div>
							<input name='s' type='hidden' value='${store.sID}'>
							<input name='f' type='hidden' value='${bean.foodID}'>
							<br>
							<br>
							<div class="form-group">
								<label for="pri">價錢:</label> 
								<input name="pri" class="form-control" id="pri" value="${bean.unitPrice }">
							</div>
							<br>
							<br>
							<div class="form-group">
								<label for="fimg">餐點圖片:</label> 
								<input type="file" id="fimg" name="fimg">
							</div>
								<select name="sell" class="form-control" id="sel1">
                                 <option>有貨</option>
                                 <option>沒貨</option>
                                </select>
							<br>
							<br>
							<button type="submit" class="btn btn-default">送出</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>


	<!-- 新增的dialog -->
	<div id="ins" class="modal fade" role="dialog" >
		<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">餐點編輯</h4>
					</div>
					<div class="modal-body">
						<form class="form-inline" role="form" method="POST" action="MenueditInsert" enctype="multipart/form-data" >
							<div class="form-group">
								<label for="food">餐點:</label> 
								<input name="food" class="form-control" id="food">
							</div>
							<input name='s' type='hidden' value='${store.sID}'>
							<br>
							<br>
							<div class="form-group">
								<label for="pri">價錢:</label> 
								<input name="inpri" class="form-control" id="pri">
							</div>
							<br>
							<br>
							<div class="form-group">
								<label for="fimg">餐點圖片:</label> 
								<input type="file" id="fimg" name="fimg">
							</div>
								
							<br>
							<br>
							<button type="submit" class="btn btn-default">送出</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
	</div>
	<script src="bootstrap/sweetAlert/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="bootstrap/sweetAlert/sweetalert.css">
	<script type="text/javascript">
		var s = $('.status');
		for (var i = 0; i < s.length; i++) {
			var temp = $(s[i]);
			if (temp.text() == 1) {
				console.log("有貨")
				temp.text("有貨")
			} else {
				console.log("沒貨")
				temp.text("沒貨")
			}
		}

		$('.del').on('click', function() {
			var f = $(this).attr('fid');
			swal({
				title : "確定刪除?",
				text : "刪除後無法復原",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "確定",
				cancelButtonText : "取消",
				closeOnConfirm : false
			}, function() {
				swal({
					title : "刪除成功!",
					text : "您的商品已經刪除",
					type : "success"
				}, function() {
					$.ajax({
						'type' : 'get',
						'url' : 'MenueditDelete?f=' + f + '',
						'success' : function() {
							location.reload();
						}

					})
				})

			});

		})
	</script>



</body>
</html>