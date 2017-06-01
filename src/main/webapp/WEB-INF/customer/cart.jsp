<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<tr>
	<th>菜名</th>
	<th>地址</th>
	<th>简介</th>
	<th>类型ID</th>
	<th>类型名称</th>
	<th>价格</th>
	<th>被订次数</th>
	<th>是否可以做</th>
	<th>创建时间</th>
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
<form action="cart_nullbasket" method="post">
	<input type="submit" value="清空购物车"/>
</form>
</body>
</html>