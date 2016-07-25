<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
  .dropdown-menu li:hover .sub-menu {  
  	visibility: visible;  
  }  

  .dropdown:hover .dropdown-menu {  
  	display: block;  
  }  
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>

<script type='text/javascript' src="star/jquery.raty.js"></script>

<link rel='stylesheet' href='star/Site.css' type='text/css' media='all' />
<link rel='stylesheet' href='star/stylesheet.css' type='text/css'
	media='all' />

<script type='text/javascript' src="bootstrap/comments/js/bootstrap.js"></script>

<!-- <link rel='stylesheet' href='bootstrap/comments/style.css' type='text/css' media='all' /> -->
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.min.css'
	type='text/css' media='all' />
<!-- <link rel='stylesheet' href='bootstrap/comments/css/bootstrap.css' type='text/css' media='all' /> -->
<!-- <link rel='stylesheet' href='bootstrap/comments/css/bootstrap-theme.css' type='text/css' media='all' /> -->

</head>
<body>
	<div id="star"></div>
	<div id="result"></div>

	
	
	
	
	
	<script>
		$(function() {
			$("#result").hide();
			$('#star').raty({
				path : "star/img",
				starOff : 'star-off-big.png',
				starOn : 'star-on-big.png',
				size : 24,
				target : '#result',
				targetKeep : true,

				hints : [ '1', '2', '3', '4', '5' ],
				click : function(score, evt) {
					console.log("評價分數" + score);
				}

			});

		});
	</script>



</body>
</html>