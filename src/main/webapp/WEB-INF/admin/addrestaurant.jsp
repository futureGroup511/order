<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addrestaurant.css">
<style type="text/css">
.btn{
	width:100px;
	background-color: #ADD2ED;
	font-size:15px;
	border-radius: 5px;
	margin-left:35%;
}
.file{
	border:none; outline:none;margin-left:35%;margin-top:1%;font-size:12px;
}
</style>
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
	<div class="wall">
		${addrest}
		<form action="${rootPath}manage/Restaurant_AddRestaurant" method="post" enctype="multipart/form-data">
			<label>店名：</label><input type="text" name="restaurant.name"><br>
			<label>电话：</label><input type="text" name="restaurant.phone"><br>
			<label>地址：</label><input type="text" name="restaurant.address"><br>
			<label>简介：</label><input type="text" name="restaurant.introduce"><br>
			<input type="file" value="选择图片" name="file" accept="image/*" class="file"><br>
			<button type="submit" class="btn">提交</button>
		</form>
	</div>
</body>
</html>