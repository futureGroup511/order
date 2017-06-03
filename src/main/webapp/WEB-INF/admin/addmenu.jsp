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
		${addMsg}
		<form action="${rootPath}manage/MenuManager_addMenu" method="post" enctype="multipart/form-data">
			 <table>
			 	<tr>
			 		<td>菜名：</td>
			 		<td><input type="text" name="menu.name"></td>
			 	</tr>
			 	<tr>
			 		<td>类型名称：</td>
			 		<td><input type="text" name="menu.typeName"></td>
			 	</tr>
			 	<tr>
			 		<td>价格：</td>
			 		<td><input type="text" name="menu.price"></td>
			 	</tr>
			 	<tr>
			 		<td>被定次数：</td>
			 		<td><input type="text" name="menu.num"></td>
			 	</tr>
			 	<tr>
			 		<td>是否可以做：</td>
			 		<td>
			 			<select name="menu.exist">
			 				<option value="1">可做</option>
			 				<option value="0">暂缺</option>
			 			</select>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td>简介：</td>
			 		<td><textarea rows="10" cols="40" name="menu.introduce"></textarea></td>
			 	</tr>
			 	<tr>
			 		<td>示例图片</td>
			 		<td><input type="file" name="file" accept="image/*"></td>
			 	</tr>
			 	<tr>
			 		<td><input type="submit" value="添加"></td>
			 	</tr>
			 </table>
		</form>
	</center>
</body>
</html>