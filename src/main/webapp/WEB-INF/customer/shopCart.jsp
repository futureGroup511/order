<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD:src/main/webapp/WEB-INF/customer/shopCart.jsp
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
=======
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
>>>>>>> 16a25f24e8b093782a2c8ae8ec4e7dc44c940041:src/main/webapp/WEB-INF/customer/shopcart.jsp
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<<<<<<< HEAD:src/main/webapp/WEB-INF/customer/shopCart.jsp
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
<a href="${rootPath}customer/cart_getCart">购物车</a>
<a href="${rootPath}customer/cart_getorderDetails">提交</a>
<a href="${rootPath}customer/cart_getOrder">我的订单</a>
<a href="${rootPath}customer/cart_delete">清空购物车</a>
<s:property value="#request.total"/>
=======
	<center>
		<table border="1" width="300px" height="200px">
			<tr>
				<th>菜品名称</th>
				<th>单价</th>
				<th>数量</th>
				<th>管理</th>
			</tr>
			<c:forEach items="${ShopCart}" var="ShopCart">
				<tr>
					<td>${ShopCart.menuName}</td>
					<td>${ShopCart.price}</td>
					<td>
						<a href="${rootPath}customer/shopcart_updateNum?msg=reduce&shopCart.id=${ShopCart.id}">-</a>
						<input type="text" name="ShopCart.menuNum" value="${ShopCart.menuNum}" size="1">
						<a href="${rootPath}customer/shopcart_updateNum?msg=add&shopCart.id=${ShopCart.id}">+</a>
					</td>
					<td><a href="${rootPath}customer/shopcart_deleteShopCart?shopCart.id=${ShopCart.id} ">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		目前添加的总价为${sum}
		<a href="${rootPath}customer/shopcart_submitToOrder">确定点菜</a>
	</center>
	<a href="${rootPath}customer/customer_toIndex?id=${userId}">首页</a>
	<a href="${rootPath}customer/cart">购物车</a>
	<a href="">我的订单</a>
>>>>>>> 16a25f24e8b093782a2c8ae8ec4e7dc44c940041:src/main/webapp/WEB-INF/customer/shopcart.jsp
</body>
</html>