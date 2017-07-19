<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updaterestaurant.css">
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
	<div class="wall">
	<form action="${rootPath}manage/Restaurant_Update?restaurant.id=${rest.id}" method="post" enctype="multipart/form-data">
		<label>店名：</label><input type="text" name="restaurant.name" value="${rest.name}" required="required"><br>
		<label>电话：</label><input type="text" name="restaurant.phone" value="${rest.phone}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="12" name="restaurant.phone" required="required"><br>
		<label>地址：</label><input type="text" name="restaurant.address" value="${rest.address}" required="required"><br>
		<label>简介：</label>
			<textarea style="margin-left:40%;margin-top:-7%;" rows="5" cols="30" name="restaurant.introduce">${rest.introduce}</textarea>
		<input type="file" name="file" accept="image/*" class="input1" value="选择图片" style="border:none; outline:none;margin-left:40%;margin-top: 1%;"><br>
		<button class="btn" type="submit">修改</button><br>		
	</form>
	</div>
	<div class="picture-wall">
       <img src="${rootPath}uploadImg/${rest.imgUrl}">
    </div>
</body>
</html>