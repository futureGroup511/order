<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顾客首页</title>
</head>
<body>
<script>
	location.replace("${rootPath}customer/customer_getMenuType");
</script>
<body>
<a href="${rootPath}customer/customer_getMenuByTypeId?id=1">菜品类型1</a>
<a href="${rootPath}customer/customer_getMenuByTypeId?id=2">菜品类型2</a>
<a href="${rootPath}customer/customer_getMenuByTypeId?id=3">菜品类型3</a>
<a href="${rootPath}customer/customer_getMenuByTypeId?id=4">菜品类型4</a>
<a href="${rootPath}customer/customer_getMenuByTypeId?id=5">菜品类型5</a>
<a href="${rootPath}customer/customer_getMenuByTypeId?id=6">菜品类型6</a>

<h3>推荐菜品</h3>
<c:forEach items="${menus}" var="m" >
	名称：${m.name}  价格：${m.price} <a href="${rootPath}customer/customer_getMenuMaterial?id=${m.id}">详情</a> 
	<a href="${rootPath}customer/customer_joinCart?id=${m.id}">加入购物车</a><br>
</c:forEach> 
</body>
</html>