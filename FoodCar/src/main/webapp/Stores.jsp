<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<title>餐車專區</title>
</head>
<table id="storesTable">
	<thead>
		<tr>
			<th>sID</th>
			<th>sUsername</th>
			<th>sHour</th>
			<th>sName</th>
		</tr>
	</thead>
	<tbody></tbody>
</table>
<body>
	<script type="text/javascript">
		$.ajax({
			'type' : 'post',
			'url' : 'StoresServlet',
			'dataType' : 'json',
			'success' : function(data) {
				var tb = $('#storesTable>tbody')
				var flag = $(document.createDocumentFragment());
				tb.empty();
                alert(tb);
				$.each(data, function(idx, product) {
					var cell1 = $('<td></td>').text(product.sID);
					var cell2 = $('<td></td>').text(product.sUsername);
					var cell3 = $('<td></td>').text(product.sHours);
					var cell4 = $('<td></td>').text(product.sName);

					var row = $("<tr></tr>").append(
							[ cell1, cell2, cell3, cell4 ])
					flag.append(row)
				})
				tb.append(flag)
			}

		})
	</script>

</body>
</html>