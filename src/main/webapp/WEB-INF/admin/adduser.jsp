<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/adduser.css">
</head>
<body>
	<center>
	${addMsg }
	<div class="adduser">
   <form action="${rootPath}manage/UserManager_addUser" method="post">
     <lable>账号：</lable><input type="text" name="user.phone" maxlength="11" placeholder="请输入手机号/账号"><br>
     <lable>密码：</lable><input type="text" type="password" name="user.password" maxlength="10"><br>
     <lable>姓名：</lable><input type="text" name="user.name"><br>
      身份：<select name="user.sort">
        <option value="cook">厨师</option>
        <option value="manager">管理员</option>
      </select>
    
      <div class="button">
        <input type="submit" value="提交">          
      </div>
      </form> 
</div> 
<%-- 	${addMsg } --%>
<%-- 	<form action="${rootPath}manage/UserManager_addUser" method="post"> --%>
<!-- 		账&nbsp;号：<input type="text" name="user.phone" maxlength="11" placeholder="请输入手机号/账号"><br> -->
<!-- 		密&nbsp;码:<input type="password" name="user.password" maxlength="10"><br> -->
<!-- 		姓&nbsp;名:<input type="text" name="user.name"><br> -->
<!-- 		身&nbsp;份： -->
<!-- 			<select name="user.sort"> -->
<!-- 			   <option value="cook">厨师</option> -->
<!-- 			   <option value="manager">管理员</option> -->
<!-- 			</select><br><br><br> -->
<!-- 		<input type="submit" value="添加"> -->
<!-- 	</form> -->
	</center>
</body>
</html>