<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmenu.css">
</head>
<body>
 <div class="addmenu">
 <h4>${addMsg}</h4>
   <form action="${rootPath}manage/MenuManager_addMenu" method="post" enctype="multipart/form-data">
     <lable>菜&nbsp;&nbsp;&nbsp;&nbsp;名：</lable><input type="text" name="menu.name"><br>
     <lable>类型名称&nbsp;：</lable>
     <select name="menu.typeName" class="select"> 
 			<c:forEach items="${Typelist}" var="item">  
 	           	<option value="${item.name}">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
     <lable>价&nbsp;&nbsp;&nbsp;&nbsp;格&thinsp;：</lable><input type="text" name="menu.price"><br>
     <lable>被定次数&nbsp;：</lable><input type="text" name="menu.num"><br>
     <lable>是否可以做：</lable>
     <select name="menu.exist" class="select">
      <option value="1">可做</option>
       <option value="0">暂缺</option>
     </select><br>
     <label>简介：</label>
     <div style="margin-left:15%;margin-top:-5%;">
     	<textarea rows="5" cols="50" name="menu.introduce"></textarea>
     </div>
     <label>示例图片：</label>
     <input type="file" name="file" accept="image/*" value="选择图片" style="border:none; outline:none;margin-left:2.5%">
      <div class="button">
        <input type="submit" value="添加">          
      </div>
    </form>   
   </div> 
</body>
</html>