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
	<!-- <th>时间</th> -->
	<th>菜名</th>
	<!-- <th>数量</th>
	<th>价格</th>
	<th>评价</th>
	<th>溯源</th>
	<th>管理</th> -->
	</tr>
	<c:forEach items="${ingredient}" var="ingredient">
		<tr>
		<%-- <td>${ingredient.createDate}</td> --%>
		<td>${ingredient.name}</td>
		<%-- <td>${ingredient.num}</td>
		<td>${ingredient.price}</td>
		<td>${ingredient.remark}</td>
		<td>${ingredient.source}</td> --%>
		<td><a href="test_cart.action?id=${ingredient.id}">详细信息</a>&nbsp;
		</tr>
	 </c:forEach>
</table>
</body>
</html>