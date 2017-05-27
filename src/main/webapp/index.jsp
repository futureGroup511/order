<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${rootPath}test_toAddUser.action">添加用户</a>
	
	<form action="${rootPath}manage/loginAction.action" method="post">
		手机号：<input type="text" name="user.phone">
		密&nbsp;码：<input type="password" name="user.password">
		验证码：
		<img alt="点击刷新" src="${rootPath }validation" id="yan" /></a>
		<input type="submit" value="提交">
	</form>
</body>
</html>