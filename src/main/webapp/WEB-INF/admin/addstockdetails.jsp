<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addstockdetails.css">
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">

<div class="wall">
	<div style="margin-left:35%;font-weight: bold;">${addMsg}</div>
	<form action="${rootPath}manage/StockDetailsAction_AddDetails" method="post">
     <lable>配料名称:</lable>
      <select name="details.ingName"> 
 			<c:forEach items="${Ientlist}" var="item">  
 	           	<option value="${item.name}">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
     <lable>重量(kg):</lable><input style="margin-left: 1%;" type="number" name="details.num" required="required" placeholder="请输入数字"><br>
     <lable>价格(kg):</lable><input style="margin-left: 1%;" type="number"  name="details.price" required="required" placeholder="请输入数字"><br>
     <lable>溯源:</lable>
     <div style="margin-left:45%;margin-top:-10%;">
     <textarea style="" rows="5" cols="55" name="details.origins"></textarea><br>
     </div>
      <div class="button">
        <input style="background-color: #1BAFE0;margin-top:20%;width:100px;" type="submit" value="提交">          
      </div>
    </form>
</div>
</body>
</html>