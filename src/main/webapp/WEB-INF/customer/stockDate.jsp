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
<table align="center" width="100%" border="1">
	<tr>
	<th>配料名称</th>
	<th>进货时间</th>
	</tr>
	<c:forEach items="${stockDetails}" var="s">
		<tr>
			<td>${s.ingName}</td>
			<td>${s.createDate}</td>
		</tr>
	 </c:forEach>
</table>
<a href="${rootPath}customer/customer_toIndex?id=${userId}">首页</a>
<a href="${rootPath}customer/cart_getCart">购物车</a>
<a href="">我的订单</a>
</body>
</html>