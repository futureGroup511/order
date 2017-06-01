<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>	
	<form action="${rootPath}manage/MenuManager_updateMenu?menu.id=${updateMenu.id}" method="post">
		<table>
			<tr>
				<td>菜名</td>
				<td><input type="text" name="menu.name" value="${updateMenu.name}"></td>
			</tr>
			<tr>
				<td>类型id</td>
				<td><input type="text" name="menu.typeId" value="${updateMenu.typeId}"></td>
			</tr>
			<tr>
				<td>类型名称</td>
				<td><input type="text" name="menu.typeName" value="${updateMenu.typeName}"></td>
			</tr>
			<tr>
				<td>价格</td>
				<td><input type="text" name="menu.price" value="${updateMenu.price}"></td>
			</tr>
			<tr>
				<td>被定次数</td>
				<td><input type="text" name="menu.num" value="${updateMenu.num}" readonly="readonly"></td>
			</tr>
			<tr>	
				<td>是否可以做</td>
				<td><input type="text" name="menu.exist" value="${updateMenu.exist}"></td>
			</tr>
			<tr>
				<td>简介</td>
				<td><input type="text" name="menu.introduce" value="${updateMenu.introduce}"></td>
			</tr>
			<tr>
				<td>图片</td>
				<td><img alt="加载中" src="${updateMenu.imgUrl}" name="menu.imgUrl"></td>
			</tr>
			<tr>
				<td><input type="submit" value="修改">&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/MenuManager_deleteMenu?menu.id=${updateMenu.id}">删除</a></td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>