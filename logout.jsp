<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheSSOK::The Best Shoppingmall</title>
</head>
<body>
<h3>Log Out successfully!</h3>
<%
session.invalidate();
%>
<button type="button" onclick="location.href='login.html' ">LogIn</button>
	<br/>
</body>
</html>