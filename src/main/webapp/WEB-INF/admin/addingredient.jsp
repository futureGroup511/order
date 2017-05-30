<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	${addIngerdientMsg}
		<form action="Ingredient_addIngredient" method="post">
			名称：<input type="text" name="ingredient.name"><br>
			单价(元/kg)：<input type="text" name="ingredient.price"><br>
			库存量(kg)：<input type="text" name="ingredient.num"><br>
			简介：<textarea rows="10" cols="30" name="ingredient.introduce"></textarea><br>
			<input type="submit" value="添加">
		</form>
	</center>
</body>
</html>