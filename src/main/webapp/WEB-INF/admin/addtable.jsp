<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>addtable</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addtable.css">
</head>
<body>
<center>${addTableMsg}</center>
  <div class="wall"> 
    <form action="${rootPath}manage/TableManager_addTable" method="post">
       <span style="font-size: 20px;">餐桌名称：</span><input class="input" type="text" name="table.name"><br>
		<input class="button" type="submit" value="确认添加"> 
    </form>
    <div class="move-font">
        <marquee behavior="scroll"><p>温馨提示：新添加的餐桌并没有生成二维码，请手动生成二维码！</p></marquee>
    </div>
     
  </div>  
</body>
</html>
<%-- 	<center>${addTableMsg}</center> --%>
<%-- 	<form action="${rootPath}manage/TableManager_addTable" method="post"> --%>
<!-- 		<input type="text" name="table.name"> -->
<!-- 		<input type="submit" value="确认添加"> -->
<!-- 	</form> -->
<!-- 	<center>温馨提示：新添加的餐桌并没有生成二维码，请手动生成二维码</center> -->
<!-- </body> -->
<!-- </html> -->