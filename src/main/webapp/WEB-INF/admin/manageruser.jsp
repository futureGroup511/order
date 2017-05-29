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
	${deleteUserMsg}
		<table border="1">
			<tr>
				<td>账号</td>
				<td>姓名</td>
				<td>注册时间</td> 
				<td>身份</td>
				<td>操作</td>
				<td>操作</td>
			</tr>
		<c:forEach items="${allUser}" var="item">
			<tr>
				<td><input type="text" name="user.phone" value="${item.phone }" readonly="readonly"></td>
				<td><input type="text" name="user.name" value="${item.name }" readonly="readonly"></td>
				<td><input type="text" name="user.createDate" value="${item.createDate }" readonly="readonly"></td> 
				<td><input type="text" name="user.sort" value="${item.sort }" readonly="readonly"></td>
				<td><a href="${rootPath}manage/UserManager_toUpdateUser?userId=${item.id}">修改</a></td>
				<td><a href="${rootPath}manage/UserManager_deleteUser?user.id=${item.id}">删除</a></td>
			</tr> 
		</c:forEach>
		</table>
	</center>
</body>
</html>