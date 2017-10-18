<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatemyself.css">
</head>
<body   style="background: url(${rootPath}/images/iframebg.jpg);">
<div class="updatemyself">
   <form action="${rootPath}manage/DomainAction_updateIp" method="post">
     <lable id="text">域名编号：</lable><input type="text" name="domain.id" value="${domain.id}" readonly="readonly"><br>
     <lable id="text">域名：</lable><input type="text" name="domain.ip" placehold="请输入域名或id"  value="${domain.ip}" required="required"><br>    
      <div class="button">
        <input type="submit" value="确认修改">
      </div>
    </form>   
   </div> 
</body>
</html>