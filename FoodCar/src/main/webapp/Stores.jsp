<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">

<!-- 最新編譯和最佳化的 JavaScript -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<title>餐車專區</title>
</head>

<body>
    <div class="row" style="border:black 5px solid;" id="stroes"></div>
<!-- 	<table id="storesTable" class="table"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>sUsername</th> -->
<!-- 				<th>sHour</th> -->
<!-- 				<th>sName</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody></tbody> -->
<!-- 	</table> -->
	
	<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
	<script type="text/javascript">
	$.ajax({
			'type' : 'post',
			'url' : 'StoresServlet',
			'dataType' : 'json',
			'data' : {},
			'success' : function(data) {
				var tb = $('#stroes')
				var flag = $(document.createDocumentFragment());
				tb.empty();

				$.each(data, function(idx, store) {
                   
					var cell = $('<div class="col-sm-4" style="border:black 5px solid;"></div>')
					.html('<a href="StoreServlet?sID='+store.sID+'">'+store.sName+'</a><h4>'+store.sUsername+'</h4><h4>'+store.sHours+'</h4>');

					flag.append([cell])
				})
				tb.append(flag)

			}
		})
// 		$.ajax({
// 			'type' : 'post',
// 			'url' : 'StoresServlet',
// 			'dataType' : 'json',
// 			'data' : {},
// 			'success' : function(data) {
// 				var tb = $('#storesTable>tbody')
// 				var flag = $(document.createDocumentFragment());
// 				tb.empty();

// 				$.each(data, function(idx, store) {

					
// 					var cell1 = $('<td></td>').text(store.sUsername);
// 					var cell2 = $('<td></td>').text(store.sHours);
// 					var cell3 = $('<td></td>').text(store.sName);

// 					var row = $("<tr></tr>").append(
// 							[ cell1, cell2, cell3])
// 					flag.append(row)
// 				})
// 				tb.append(flag)

// 			}
// 		})
	</script>

</body>
</html>