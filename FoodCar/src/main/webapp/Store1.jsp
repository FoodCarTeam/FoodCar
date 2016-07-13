<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery/jquery-3.0.0.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgdzYOT0U2y-fUVpAfkf-XjCvXzY5-e-A&signed_in=true&libraries=places&callback=initMap"></script>
<title>Insert title here</title>
<style type="text/css">
html, body {
 	height: 100%; 
/* 	margin: 0; */
/* 	padding: 0; */
}
#GoogleMap {
	height: 400px;
	width: 400px;
	margin: auto;
}
</style>
<script type="text/javascript">
	function initMap() {
		var lat=${map[0]};
		var lng=${map[1]};
		var myLatLng = {
			lat : lat,
			lng :lng
		};

		var map = new google.maps.Map(document.getElementById('GoogleMap'), {
			zoom : 15,
			center : myLatLng
		});
		

		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : 'Hello World!'
		});
	}
	
</script>
</head>
<body>
  <a href="MenusServlet?sID=${select.sID}">${select.sName}</a>
  <h3>${select.sUsername}</h3>
  <h3>${select["sIntro"]}</h3>
  <h3>${map[0]}</h3><h3>${map[1]}</h3>
  <div id="GoogleMap"></div>

 

 
<%--   <c:forEach var="bean" items="${map}"> --%>
  
<%--     <h3>${bean.location}</h3> --%>
    
    
<%--   </c:forEach> --%>
  

  
</body>
</html>