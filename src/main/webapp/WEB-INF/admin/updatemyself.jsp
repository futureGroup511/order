<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatemyself.css">
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
<div class="updatemyself">
   <form action="${rootPath}manage/UserManager_updateMyself" method="post">
     <lable id="text">姓名：</lable><input type="text" name="user.name" value="${manager.name}" required="required"><br>
     <lable id="text">账号：</lable><input type="tel" pattern="\d{11}" name="user.phone" value="${manager.phone}" required="required"><br>
     <lable id="text">密码：</lable><input type="text" maxlength="10" name="user.password" value="${manager.password}" required="required"><br>
     <lable id="text">身份：</lable><input type="text" value="管理员" readonly="readonly"><br>    
     <lable id="text">注册时间：</lable><input type="text"  value="${manager.createDate}" readonly="readonly"><br>    
      <div class="button">
        <input type="submit" value="确认修改">
      </div>
    </form>   
   </div> 
</body>
</html>