<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<table width="100%">
	<tr>		
		<th>餐桌名称</th>		
		<th>菜品名称</th>
		<th>数量</th>
		<th>单价</th>		
		<th>管理</th>
		<th>数量的增减</th>
	</tr>
	<c:forEach items="${shopCarts}" var="s">
		<tr>			
			<td>${s.tableName}</td>		
			<td>${s.menuName}</td>
			<td>${s.menuNum}</td>
			<td>${s.price}</td>
			<td>${s.remark}</td>
			<td>
				<a href="${rootPath}customer/cart_deleteCart?id=${s.id} ">删除</a>
			</td>
			<td><a href="${rootPath}customer/cart_add?id=${s.id}">+1</a></td>
			<td><a href="${rootPath}customer/cart_reduce?id=${s.id}">-1</a></td>
			
		</tr>
	</c:forEach>
	 
</table>
<h3>${addMeg}</h3>
<a href="${rootPath}customer/customer_toIndex?id=${userId}">首页</a>
<a href="${rootPath}customer/getCart">购物车</a>
<a href="${rootPath}customer/cart_getHand">提交</a>
<a href="${rootPath}customer/cart_getOrderDetails">我的订单</a>
<s:property value="#request.total"/>
</body>
</html>