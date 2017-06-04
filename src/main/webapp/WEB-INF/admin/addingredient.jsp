<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/addingredient.css">
</head>
<body>
<center> 
${addIngerdientMsg}
	<div class="addingredient">
      <form action="Ingredient_addIngredient" method="post">
          <lable id="text">名称：</lable><input type="text" name="ingredient.name"><br>
          <lable id="text">单价(元/kg)：</lable><input type="text" name="ingredient.price"><br>
          <lable id="text">库存量(kg)：</lable><input type="text" name="ingredient.num"><br>
          <lable id="text">简介：</lable>
          <textarea rows="10" cols="30" name="ingredient.introduce"></textarea>      
      <div class="button">
         <input type="submit" value="添加">
      </div>
      </form>        
    </div>
</center>
<!-- 	<center> -->
<%-- 	${addIngerdientMsg} --%>
<!-- 		<form action="Ingredient_addIngredient" method="post"> -->
<!-- 			名称：<input type="text" name="ingredient.name"><br> -->
<!-- 			单价(元/kg)：<input type="text" name="ingredient.price"><br> -->
<!-- 			库存量(kg)：<input type="text" name="ingredient.num"><br> -->
<!-- 			简介：<textarea rows="10" cols="30" name="ingredient.introduce"></textarea><br> -->
<!-- 			<input type="submit" value="添加"> -->
<!-- 		</form> -->
<!-- 	</center> -->
</body>
</html>