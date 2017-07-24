<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addstockdetails.css">
<style>
</style>
 <script type="text/javascript">
     function modifyContent() {    	
     	        var content = document.getElementById("content");
     	        var arr = [];
     	        arr.push(editor.txt.html());
     	        content.value = arr;
   }
</script> 
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
<div class="wall">
	<div style="margin-left:35%;font-weight: bold;">${addMsg}</div>
	<form action="${rootPath}manage/StockDetailsAction_AddDetails" method="post" onsubmit="modifyContent()">
     <lable>配料名称:</lable>
      <select name="details.ingName"> 
 			<c:forEach items="${Ientlist}" var="item">  
 	           	<option value="${item.name}">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
     <lable>重量(kg):</lable><input style="margin-left: 1%;" type="number" name="details.num" required="required" placeholder="请输入数字"><br>
     <lable>价格(kg):</lable><input style="margin-left: 1%;" type="number"  name="details.price" required="required" placeholder="请输入数字"><br>
     <div style="font-size:20px;font-weight: bold;width:5%;margin-left:-100px;">溯源:</div><br>
     <div class="suyuan">
     <textarea rows="5" cols="100" name="details.origins" style="display:none;" id="content"></textarea><br>
         <div id="editor"></div>
    <script type="text/javascript" src="${rootPath}wangEditor/release/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        editor.create()
    </script>
     </div> 
      <div class="button">
        <input id="btn1" style="background-color: #1BAFE0;margin-top:10%;width:100px;" type="submit" value="提交">          
      </div>
    </form>
</div>
</body>
</html>