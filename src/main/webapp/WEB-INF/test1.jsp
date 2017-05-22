<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="test_addUser.action" method="post">
		name:<input type="text" name="user.name"><br>
		phone:<input type="text" name="user.phone"><br>
		password:<input type="text" name="user.password"><br>
		sort:<input type="text" name="user.sort"><br>
		<input type="submit" value="提交">
	</form>
</body>
</html>