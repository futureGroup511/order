<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style>
	.s{
		width: 300px;
		height: 300px;
		border: 1px solid #000;
	}
	.id{
		border: 1px solid #000;
	}
	</style> -->
</head>
<body>
<%-- <div class="s">
	<img src="1.jpg" width="300" height="100">
	<h4>鱼香肉丝的原料</h4>
	createDate:${ingredient.createDate}<br>
	name:${ingredient.name}<br>
	num:${ingredient.num}<br>
	price:${ingredient.price}<br>
	remark:${ingredient.remark}<br>
	source:${ingredient.source}<br>
<div class="id">
	gsrg
</div>
</div>
<form action="cartAdd.action" method="post">
	<input type="text" name="name" value="鱼香肉丝">
	<input type="submit" value="加入购物车">
</form> --%>
<p align="center"><p>
<table align="center" width="100%" border="1">
	<tr>
	<th>时间</th>
	<th>菜名</th>
	<th>数量</th>
	<th>价格</th>
	<th>评价</th>
	<th>溯源</th>
	<th>管理</th>
	</tr>
		<tr>
		<td>${ingredient.createDate}</td>
		<td>${ingredient.name}</td>
		<td>${ingredient.num}</td>
		<td>${ingredient.price}</td>
		<td>${ingredient.remark}</td>
		<td>${ingredient.source}</td>
		<%-- <td><a href="customer/test_cart.action?id=${ingredient.id}">详细信息</a>&nbsp; --%>
		</tr>
	 
</table>
</body>
</html>