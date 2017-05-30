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
	<th>评论</th>
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
		<td>${menu.remark}</td>
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
	<c:forEach items="${list }" var="menumaterial">
		<tr>
			<td>${menumaterial.menuId}</td>
			<td>${menumaterial.menuName}</td>
			<td>${menumaterial.ingId}</td>
			<td>${menumaterial.ingName}</td>
			<td>${menumaterial.num}</td>
			<td>${menumaterial.stockDate}<a href="${rootPath}customer/customer_StockDetails?id=${menumaterial.ingId}">更多进货时间信息</a>&nbsp;</td>
		</tr>
	</c:forEach>	
</table>
<table align="center" width="100%" border="1">
	<tr>
	<th>配料名称</th>
	<th>进货时间</th>
	</tr>
	<c:forEach items="${list1}" var="StockDetails">
		<tr>
		<td>${StockDetails.ingName}</td>
		<td>${StockDetails.createDate}</td>
		</tr>
	 </c:forEach>
</table>
</body>
</html>