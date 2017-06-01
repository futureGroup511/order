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
<table>
	<tr>
		<th>类型名称</th>
		<th>备注</th>
		<th>获取菜品类型中的菜</th>
	</tr>
	<c:forEach items="${list}" var="list1">
	<tr>
		<td>${list1.name}</td>
		<td>${list1.remark}</td>
		<td><a href="customer_ByName?name=${list1.name}">菜品信息</a></td>
	</tr>
	</c:forEach>
</table>
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
		<th>评论</th>
		<th>加入购物车</th>
		<th>rrrr</th>
	</tr>
	<c:forEach items="${menu1}" var="menu1">
		<tr>
			<td>${menu1.name}</td>
			<td>${menu1.imgUrl}</td>
			<td>${menu1.introduce}</td>
			<td>${menu1.typeId}</td>
			<td>${menu1.typeName}</td>
			<td>${menu1.price}</td>
			<td>${menu1.num}</td>
			<td>${menu1.exist}</td>
			<td>${menu1.createDate}</td>
			<td>${menu1.remark}</td>
			<td><a href="customer_menu.action?id=${menu1.id}">菜品信息</a>&nbsp;
		</tr>
	 </c:forEach>
</table>
</body>
</html>