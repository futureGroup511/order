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
	${updateUserMsg}
	<form action="${rootPath}manage/UserManager_updateUser?user.id=${updateUser.id}&user.password=${updateUser.password}" method="post">
		<table>
			<tr>	
				<td>账号：</td>
				<td><input type="text" name="user.phone" value="${updateUser.phone}"></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="text" name="user.password" value="${updateUser.password}"></td>
			</tr>
			<tr>
				<td>姓名：</td>
				
				<td><input type="text" name="user.name" value="${updateUser.name}"></td>
			</tr>
			<tr>
				<td>注册时间：</td>
				<td><input type="text" name="user.createDate" value="${updateUser.createDate}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>身份：</td>
				<td>
					<select name="user.sort">
						<option value="cook" <c:if test='${updateUser.sort eq "cook"}'>selected="selected"</c:if>>cook</option>
						<option value="manager" <c:if test='${updateUser.sort eq "manager"}'>selected="selected"</c:if>>manager</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="修改"></td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>