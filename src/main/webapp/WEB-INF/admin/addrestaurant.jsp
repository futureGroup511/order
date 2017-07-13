<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
<center>
${addrest}
	<form action="${rootPath}manage/Restaurant_AddRestaurant" method="post">
		<label>店名：</label><input type="text" name="restaurant.name">
		<label>电话：</label><input type="text" name="restaurant.phone"><br>
		<label>地址：</label><input type="text" name="restaurant.address">
		<label>简介：</label><input type="text" name="restaurant.introduce"><br>
		<button type="submit">提交</button>
	</form>
</center>
</body>
</html>