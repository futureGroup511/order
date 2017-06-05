<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/updatemyself.css">
</head>
<body>
<div class="updatemyself">
   <form action="${rootPath}manage/UserManager_updateUser?user.id=${user.id}&userId=2" method="post">
     <lable id="text">姓名：</lable><input type="text" name="user.name" value="${user.name}"><br>
     <lable id="text">账号：</lable><input type="text" name="user.phone" value="${user.phone}"><br>
     <lable id="text">密码：</lable><input type="text" name="user.password" value="${user.password}"><br>
     <lable id="text">身份：</lable><input type="text" name="user.sort" value="${user.sort}" readonly="readonly"><br>
     <lable id="text">注册时间：</lable><input type="text"  name="user.createDate" value="${user.createDate}" readonly="readonly"><br>
      <div class="button">
        <input type="submit" value="确认修改">          
      </div>
    </form>   
   </div> 
<!-- 	<center> -->
<%-- 		<form action="${rootPath}manage/UserManager_updateUser?user.id=${user.id}&userId=2" method="post"> --%>
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<td>姓名：</td> -->
<%-- 				<td><input type="text" name="user.name" value="${user.name}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>账号：</td> -->
<%-- 				<td><input type="text" name="user.phone" value="${user.phone}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>密码：</td> -->
<%-- 				<td><input type="text" name="user.password" value="${user.password}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>身份：</td> -->
<%-- 				<td><input type="text" name="user.sort" value="${user.sort}" readonly="readonly"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>注册时间：</td> -->
<%-- 				<td><input type="text" name="user.createDate" value="${user.createDate}" readonly="readonly"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><input type="submit" value="确认修改"></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		</form> -->
<!-- 	</center> -->
</body>
</html>