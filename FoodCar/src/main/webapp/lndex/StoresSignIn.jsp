<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/main.css" />

<title>Product</title>
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>

<h3>Welcome ${user.sName}</h3>

<h3>Stores Table</h3>

<form action="<c:url value="/Signin.jsp" />" method="get">
<table>
	<tr>
		<td>Username : </td>
		<td><input type="text" name="sUsername" value="${param.sUsername}"></td>
		<td></td>
	</tr>
	<tr>
		<td>Password : </td>
		<td><input type="text" name="sPassword" value="${param.sPassword}"></td>
		<td></td>
	</tr>
	<tr>
		<td>Name : </td>
		<td><input type="text" name="sName" value="${param.sName}"></td>
		<td></td>
	</tr>
	<tr>
		<td>BossName : </td>
		<td><input type="text" name="sBossName" value="${param.sBossName}"></td>
		<td><span class="error">${error.sBossName}</span></td>
	</tr>
	<tr>
		<td>Logo : </td>
		<td><input type="text" name="sIntro" value="${param.sIntro}"></td>
		<td><span class="error">${error.sIntro}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="Stores" value="Insert">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>



<h3><span class="error">${errors.action}</span></h3>
<c:if test="${not empty insert}">
	<h3>Insert Product Table Success</h3>
	<table border="1">
		<tr><td>Username:</td><td>${insert.sUsername}</td></tr>
		<tr><td>Password:</td><td>${insert.sPassword}</td></tr>
		<tr><td>Name:</td><td>${insert.sName}</td></tr>
		<tr><td>BossName:</td><td>${insert.sBossName}</td></tr>
		<tr><td>sIntro:</td><td>${insert.sIntro}</td></tr>
		
	
	</table>
	<script type="text/javascript">clearForm();</script>	
</c:if>

</body>
</html>