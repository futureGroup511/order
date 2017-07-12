<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="center"><p>
<table align="center" width="100%" border="1">
	<tr>
		<th>桌子编号</th>
		<th>桌子名称</th>
		<th>总价</th>
		<th>订单详情</th>
	</tr>
	<c:forEach items="${orders}" var="order">
		<tr>
			<td>${order.tableId}</td>
			<td>${order.tableName}</td>
			<td>${order.total}</td>
			<td><a href="${rootPath}customer/cart_getHand?id=${order.id}">订单详情</a></td>
		</tr>
	 </c:forEach>
</table>
</body>
</html>