
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/updateorder.css">
</head>
<body>
<div class="updateorder">
    <form action="${rootPath}manage/OrderAction_Update" method="post">
        <lable id="text">id:</lable><input name="orders.id" value="${order.id}" type="text" readonly="readonly">
        <lable id="text">餐桌id:</lable><input name="orders.tableId" value="${order.tableId}" type="text"><br>
        <lable id="text">餐桌名称:</lable><input name="orders.tableName" value="${order.tableName}" type="text">
        <lable id="text">状态:</lable>
        <select name="orders.status">
            <option value="未付款"  <c:if test='${order.status eq "未付款"}'>selected="selected"</c:if>>未付款</option>
            <option value="已处理"  <c:if test='${order.status eq "已处理"}'>selected="selected"</c:if>>已处理</option>
            <option value="已付款"  <c:if test='${order.status eq "已付款"}'>selected="selected"</c:if>>已付款</option>
        </select><br>
        <lable id="text">总价:</lable><input name="orders.total" value="${order.total}" type="text">
        <lable id="text">订单时间:</lable><input name="orders.createDate" value="${order.createDate}" type="text" readonly="readonly"><br>
        <lable id="text">厨师id:</lable><input name="orders.cookId" value="${order.cookId}" type="text">
        <lable id="text">厨师姓名:</lable><input name="orders.cookName" value="${order.cookName}" type="text"><br>
        <lable id="text">备注:</lable><input name="orders.remark" value="${order.remark}" type="text">
    
    <div class="button">
      <input type="submit" value="修改">        
    </div>
    </form>      
  </div>  
<%-- <form action="${rootPath}manage/OrderAction_Update" method="post">  --%>
<%-- 	<center> --%>
<!-- 	<tr> -->
<!-- 		<td>id:</td> -->
<%-- 		<td><input name="orders.id" value="${order.id}" type="text" readonly="readonly"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>餐桌id:</td> -->
<%-- 		<td><input name="orders.tableId" value="${order.tableId}" type="text"><br></td> --%>
<!-- 		</tr> -->
<!-- 	<tr> -->
<!-- 		<td>餐桌名称:</td> -->
<%-- 		<td><input name="orders.tableName" value="${order.tableName}" type="text"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>总价:</td> -->
<%-- 		<td> <input name="orders.total" value="${order.total}" type="text"><br></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td> 状态:</td> -->
<%--		<td><input name="orders.status" value="${order.status}" type="text"><br></td> --%>
<!-- 		<select name="orders.status"> -->
<%-- 			<option value="未付款"  <c:if test='${order.status eq "未付款"}'>selected="selected"</c:if>>未付款</option> --%>
<%-- 			<option value="已处理"  <c:if test='${order.status eq "已处理"}'>selected="selected"</c:if>>已处理</option> --%>
<%-- 			<option value="已付款"  <c:if test='${order.status eq "已付款"}'>selected="selected"</c:if>>已付款</option> --%>
<!-- 		</select> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>订单时间:</td> -->
<%-- 		<td><input name="orders.createDate" value="${order.createDate}" type="text" readonly="readonly"><br></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>厨师id:</td> -->
<%-- 		<td><input name="orders.cookId" value="${order.cookId}" type="text"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>厨师姓名:</td> -->
<%-- 		<td> <input name="orders.cookName" value="${order.cookName}" type="text"><br></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>备注:</td> -->
<%-- 		<td> <input name="orders.remark" value="${order.remark}" type="text"><br></td> --%>
<!-- 	</tr> -->
<!-- 	         <button type="submit" value="修改">修改</button> -->
<%-- 	</center> --%>
<!-- 	</form> -->
</body>
</html>