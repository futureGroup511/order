<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="300px" height="200px">
			<tr>
				<th>菜品名称</th>
				<th>菜品数量</th>
				<th>状态</th>
				<th>桌子id</th>
				<th>桌子名称</th>
			</tr>
			<c:forEach items="${orderDetails}" var="o">
				<tr>
					<td>${o.menuName}</td>
					<td>${o.menuNum}</td>
					<td>${o.status}</td>
					<td>${o.tableId}</td>
					<td>${o.tableName}</td>
				</tr>	
			</c:forEach>	
</table>
</body>
</html>