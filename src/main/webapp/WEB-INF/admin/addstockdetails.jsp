<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}wangEditor/css/wangEditor.min.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addstockdetails.css">
<style>
</style>
 <script type="text/javascript">
     function modifyContent() {    	
     	        var content = document.getElementById("content");   	    
     	        content.value = editor.$txt.html();
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
     <lable>重量(kg):</lable><input style="margin-left: 1%;" type="text" name="details.num" required="required" placeholder="请输入数字" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"><br>
     <lable>价格(kg):</lable><input style="margin-left: 1%;" type="text"  name="details.price" required="required" placeholder="请输入数字" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"><br>
     <div class="suyuan">
   	<lable style="margin-left:0%;">溯源:</lable>
     <textarea rows="5" cols="100" name="details.origins" style="display:none;" id="content"></textarea><br>
      <div id="editor" style="width:800px;height:310px;"></div>
      <script type="text/javascript" src="${rootPath}wangEditor/js/lib/jquery-1.10.2.min.js"></script>
     <script type="text/javascript" src="${rootPath}wangEditor/js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('editor')    		 
     	editor.config.uploadImgUrl = '${rootPath}manage/StockDetailsAction_uploadImg'
     	editor.config.uploadImgFileName = 'myFileName'
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