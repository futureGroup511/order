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
	<th>时间</th>
	<th>是否存在</th>
	<th>地址</th>
	<th>介绍</th>
	<th>名字</th>
	<th>价格</th>
	<th>评论</th>
	<th>数量</th>
	<th>类型编号</th>
	<th>类型名</th>
	<th>管理</th>
	<th>rrrr</th>
	</tr>
	<c:forEach items="${menu}" var="menu">
		<tr>
		<td>${menu.createDate}</td>
		<td>${menu.exist}</td>
		<td>${menu.imgUrl}</td>
		<td>${menu.introduce}</td>
		<td>${menu.name}</td>
		<td>${menu.price}</td>
		<td>${menu.remark}</td>
		<td>${menu.num}</td>
		<td>${menu.typeId}</td>
		<td>${menu.typeName}</td>
		<td><a href="customer_menu.action?id=${menu.id}">菜品信息</a>&nbsp;
		</tr>
	 </c:forEach>
</table>
</body>
</html>