<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../css/updateingredient.css">
</head>
<body>
		<div class="updateingredient">
			<form
				action="${rootPath}manage/Ingredient_updateIngredient?ingredient.id=${updateIngredient.id}"
				method="post">
				<lable id="text">名称：</lable>
				<input type="text" name="ingredient.name"
					value="${updateIngredient.name}"><br>
				<lable id="text">单价（元/kg）：</lable>
				<input type="text" name="ingredient.price"
					value="${updateIngredient.price}"><br>
				<lable id="text">库存（kg）：</lable>
				<input type="text" name="ingredient.num"
					value="${updateIngredient.num}"><br>
				<lable id="text">类型：</lable>
				<select name="ingredient.type" >
					<option value="配料"
						<c:if test='${order.status eq "配料"}'>selected="selected"</c:if>>配料</option>
					<option value="原料"
						<c:if test='${order.status eq "原料"}'>selected="selected"</c:if>>原料</option>
				</select><br>
				<lable id="text">简介：</lable>
				<textarea rows="10" cols="30" name="ingredient.introduce">${updateIngredient.introduce}</textarea>
				<br>
				<lable id="text">注册时间：</lable>
				<input type="text" name="ingredient.createDate"
					value="${updateIngredient.createDate}" veadonly="veadonly"
					readonly="readonly" class="sang_Calender"><br>
				<script type="text/javascript" src="../js/datetime.js"></script>
				<div class="button">
					<input type="submit" value="修改">
				</div>
			</form>
		</div>
	<!-- 	<center> -->
	<%-- 	<form action="${rootPath}manage/Ingredient_updateIngredient?ingredient.id=${updateIngredient.id}" method="post"> --%>
	<%-- 		名称：<input type="text" name="ingredient.name" value="${updateIngredient.name}"><br> --%>
	<%-- 		单价(元/kg)：<input type="text" name="ingredient.price" value="${updateIngredient.price}"><br> --%>
	<%-- 		库存(kg)：<input type="text" name="ingredient.num" value="${updateIngredient.num}"><br> --%>
	<%-- 		简介：<input type="text" name="ingredient.introduce" value="${updateIngredient.introduce}"><br> --%>
	<%-- 		注册时间：<input type="text" name="ingredient.createDate" value="${updateIngredient.createDate}" readonly="readonly"><br> --%>
	<!-- 		<input type="submit" value="修改"> -->
	<!-- 	</form> -->
	<!-- 	</center> -->
</body>
</html>