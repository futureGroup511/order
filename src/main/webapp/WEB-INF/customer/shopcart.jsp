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
<table width="100%">
	<tr>
		<th>餐桌id</th>
		<th>餐桌名称</th>
		<th>菜品id</th>
		<th>菜品名称</th>
		<th>该菜品数量</th>
		<th>单价</th>
		<th>数量</th>
		<th>备注</th>
		<th>管理</th>
	</tr>
	<c:forEach items="${shopcart}" var="shopcart">
		<tr>
			<td>${shopcart.tableId}</td>
			<td>${shopcart.tableName}</td>
			<td>${shopcart.menuId}</td>
			<td>${shopcart.menuName}</td>
			<td>${shopcart.menuNum}</td>
			<td>${shopcart.price}</td>
			<td>${shopcart.num}</td>
			<td>${shopcart.remark}</td>
			<td>
				<a href="cart_delete.action?id=${shopcart.id} ">删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
<a href="cart_deleteAll.action">清空购物车</a>
</body>
</html>