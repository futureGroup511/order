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
<p align="center"><p>
<table align="center" width="100%" border="1">
	<tr>
	<th>名字</th>
	<th>地址</th>
	<th>介绍</th>
	<th>类型编号</th>
	<th>类型名</th>
	<th>价格</th>
	<th>数量</th>
	<th>是否存在</th>
	<th>时间</th>

	</tr>
		<tr>
		<td>${menu.name}</td>
		<td>${menu.imgUrl}</td>
		<td>${menu.introduce}</td>
		<td>${menu.typeId}</td>
		<td>${menu.typeName}</td>
		<td>${menu.price}</td>
		<td>${menu.num}</td>
		<td>${menu.exist}</td>
		<td>${menu.createDate}</td>
		
		</tr>
</table>
<table align="center" width="100%" border="1">
	<tr>
	<th>菜品id</th>
	<th>菜品名称</th>
	<th>配料id</th>
	<th>配料名称</th>
	<th>需求量</th>
	<th>进货时间</th>
	</tr>
	<c:forEach items="${menumaterials}" var="m">
		<tr>
			<td>${m.menuId}</td>
			<td>${m.menuName}</td>
			<td>${m.ingId}</td>
			<td>${m.ingName}</td>
			<td>${m.num}</td>
			<td>${m.stockDate}<a href="${rootPath}customer/customer_getStockDate?id=${m.ingId}">更多进货时间信息</a>&nbsp;</td>
		</tr>
	</c:forEach>	
</table>
<a href="${rootPath}customer/customer_toIndex?id=${userId}">首页</a>
<a href="${rootPath}customer/cart_getCart">购物车</a>
<a href="">我的订单</a>
</body>
</html>