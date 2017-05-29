<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="0" cellpadding="4" cellspacing="1" bgcolor="	#4F4F4F" width="100%">
		<tr align="center" bgcolor=	#ADADAD">
			<td>ID</td>
			<td>姓名</td>
			<td>Phone</td>
			<td>角色</td>
			<td>注册时间</td>
			<td>备注</td>
		</tr>
		<c:forEach items="${myself}" var="list">
		<tr>
			<td>${list.id}</td>
			<td>${list.name}</td>
			<td>${list.phone}</td>
			<td>${list.sort}</td>
			<td>${list.createDate}</td>
			<td>${list.remark}</td>
			<td><a href="">修改个人资料</a>
			</td>
		</tr>
			</c:forEach>
	</table>
</body>
</html>