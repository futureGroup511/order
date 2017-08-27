<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updateuser.css">
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
<center>
${updateUserMsg}
 <div class="updateuser">
       <div class="text">
          <form action="${rootPath}manage/UserManager_updateUser?user.id=${updateUser.id}" method="post">
              <lable ><span style="margin-right: 40px;">账</span>号：</lable>
              <input type="tel" pattern="\d{11}" placeholder="请输入正确账号" name="user.phone" value="${updateUser.phone}" required="required"><br>
               <lable><span style="margin-right: 40px;">密</span>码：</lable>
              <input type="text" placeholder="请输入密码" name="user.password" value="${updateUser.password}" maxlength="10" required="required"><br>
              <lable><span style="margin-right: 40px;">姓</span>名：</lable>
              <input type="text" placeholder="请输入姓名" name="user.name" value="${updateUser.name}" required="required"><br>
              <lable>注册时间：</lable>
              <input type="text" class="time" name="user.createDate" value="${updateUser.createDate}" readonly="readonly"><br>
			  <lable style="margin-left:-55px;"><span style="margin-right: 40px;">身</span>份：</lable>
	          <select name="user.sort"> 
				<option value="cook" <c:if test='${updateUser.sort eq "cook"}'>selected="selected"</c:if> >厨师</option>
	 		  	<option value="manager" <c:if test='${updateUser.sort eq "manager"}'>selected="selected"</c:if>>管理员</option>
	 		  	<option value="cashier" <c:if test='${updateUser.sort eq "cashier"}'>selected="selected"</c:if> >收银员</option>
	 		  </select> 
       </div>
       <div class="button">
          <input style="font-size: 15px;width:100px;" type="submit" value="确认修改" >   
       </div>        
     </form>
     </div>
    </center>
</body>
</html>