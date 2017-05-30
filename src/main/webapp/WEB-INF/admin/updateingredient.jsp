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
	<form action="${rootPath}manage/Ingredient_updateIngredient?ingredient.id=${updateIngredient.id}" method="post">
		名称：<input type="text" name="ingredient.name" value="${updateIngredient.name}"><br>
		单价(元/kg)：<input type="text" name="ingredient.price" value="${updateIngredient.price}"><br>
		库存(kg)：<input type="text" name="ingredient.num" value="${updateIngredient.num}"><br>
		简介：<input type="text" name="ingredient.introduce" value="${updateIngredient.introduce}"><br>
		注册时间：<input type="text" name="ingredient.createDate" value="${updateIngredient.createDate}" readonly="readonly"><br>
		<input type="submit" value="修改">
	</form>
	</center>
</body>
</html>