<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmenu.css">
<style type="text/css">
.file {
margin-left:-1%;
border: 1px solid #99D3F5;
}
.txt{
margin-top:-5%;
display:inline-block;
}
</style>
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
 <div class="addmenu">
 <h4>${addMsg}</h4>
   <form action="${rootPath}manage/MenuManager_addMenu" method="post" enctype="multipart/form-data">
     <lable><span style="padding-right:9%">菜</span>名：</lable><input type="text" name="menu.name"><br>
     <lable><span style="padding-right:1%">类</span><span style="padding-right:1%">型</span><span style="padding-right:1%">名</span>称：</lable>
     <select name="menu.typeName" class="select"> 
 			<c:forEach items="${Typelist}" var="item">  
 	           	<option value="${item.name}">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
     <lable><span style="padding-right:9%">价</span>格：</lable><input style="width:205px;" type="text" name="menu.price"><br>
     <lable>是否可以做：</lable>
     <select name="menu.exist" class="select">
      <option value="1">可做</option>
       <option value="0">暂缺</option>
     </select><br>
     <label><span style="padding-right:9%">简</span>介：</label>
     <div style="margin-left:16%;margin-top:-5%;">
     	<textarea rows="5" cols="50" name="menu.introduce"></textarea>
     </div>
      <lable><span style="padding-right:1%">示</span><span style="padding-right:1%">例</span><span style="padding-right:1%">图</span>片：</lable>
     <input type="file" name="file" class="file" accept="image/*" value="选择图片">
       <div class="move-font">
        <marquee behavior="scroll"><p>温馨提示：不可以上传中文名称图片！</p></marquee>
    </div>
      <div class="button">
        <input type="submit" value="添加">          
      </div>
    </form>   
   </div> 
</body>
</html>