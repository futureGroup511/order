<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addingredient.css">
</head>
<body   style="background: url(${rootPath}images/iframebg.jpg);">
		<div style="margin-left: 40%;font-weight: bold;">${addIngerdientMsg}</div>
		<div class="addingredient">
			<form action="Ingredient_addIngredient" method="post">
				<lable id="text"><span style="padding-right:19%">名</span>称：</lable>
				<input type="text" style="margin-left:1%;" class="a1" maxlength="10"  name="ingredient.name" required="required"><br>
				<lable id="text"><span style="padding-right:19%">类</span>型：</lable>
				<select name="ingredient.type" style="margin-left:1%;">
					<option value="原料">原料</option>
					<option value="配料">配料</option>
				</select><br>
				<lable id="text"><span style="padding-right:19%">简</span>介：</lable>
				<div style="margin-left:20%;margin-top:-10%;">
					<textarea style="margin-left:80px;" rows="5" cols="35" name="ingredient.introduce"></textarea>
					</div>
				<div class="button">
					<input type="submit" style="font-size:20px;" value="添加">
				</div>
			</form>
		</div>
</body>
</html>