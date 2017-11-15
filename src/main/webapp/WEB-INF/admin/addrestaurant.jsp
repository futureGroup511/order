<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加饭店</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addrestaurant.css">
<style type="text/css">
.btn{
	width:100px;
 	background-color: #1BAFE0;
	font-size:15px;
	border-radius: 5px;
	margin-left:35%;
	height:30px;
}
.file{
	border:none; outline:none;margin-left:200px;margin-top:1%;font-size:12px;
}

</style>
</head>
<body   style="background: url(${rootPath}images/iframebg.jpg);">
	<div class="wall">
		<div style="margin-left: 35%;font-weight: bold;">${addrest}</div>
		<form action="${rootPath}manage/Restaurant_AddRestaurant" method="post" enctype="multipart/form-data">
			<label>店名：</label><input type="text" name="restaurant.name" required="required" maxlength="10"><br>
			<label>电话：</label><input type="text" name="restaurant.phone" required="required" placeholder="请输入电话号" maxlength="22"><br>
			<label>地址：</label><input type="text" name="restaurant.address" required="required" placeholder="请输入详细地址"><br>
			<labe><span class="txt" style="padding-top:22px;display:block">简介: </span></label>
			<textarea style="margin-left:200px;resize:none;" maxlength="254"  rows="6" cols="38" name="restaurant.introduce"></textarea>
			<input type="file" value="选择图片" name="file" accept="image/*" class="file"><br>
			 <div class="move-font">
        <marquee behavior="scroll"><p>温馨提示：不可以上传中文名称图片！</p></marquee>
    </div>
			<button type="submit" class="btn">提交</button>
		</form>
	</div>
</body>
</html>