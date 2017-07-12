<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatedetails.css">
</head>
<body>
<div class="updatedetails">
    <form action="${rootPath}manage/OrderDetailsAction_Update" method="post">
        <lable id="text">id:</lable><input name="details.id" value="${ordernews.id}" type="text" readonly="readonly">
        <lable id="text">餐桌id:</lable><input name="details.tableId" value="${ordernews.tableId}" type="text"><br>
        <lable id="text">餐桌名称:</lable><input name="details.tableName" value="${ordernews.tableName}" type="text">
        <lable id="text">订单id:</lable><input name="details.orderId" value="${ordernews.orderId}" type="text" readonly="readonly"><br>
        <lable id="text">菜品id:</lable><input name="details.menuId" value="${ordernews.menuId}" type="text">
        <lable id="text">菜品名称:</lable><input name="details.menuName" value="${ordernews.menuName}" type="text"><br>
        <lable id="text">数量:</lable><input name="details.menuNum" value="${ordernews.menuNum}" type="text">
        <lable id="text">状态:</lable>
       <select name="details.status">
            <option value="未完成" <c:if test='${ordernews.status eq "未完成"}'> selected="selected"</c:if>>未完成</option>
            <option value="已处理" <c:if test='${ordernews.status eq "已处理"}'> selected="selected"</c:if>>已处理</option>
            <option value="已完成" <c:if test='${ordernews.status eq "已完成"}'> selected="selected"</c:if>>已完成</option>
        </select><br>
        <lable id="text">订单时间:</lable><input name="details.creatDate" value="${ordernews.creatDate}" type="text" readonly="readonly">
        <lable id="text">厨师id:</lable><input name="details.cookId" value="${ordernews.cookId}" type="text"><br>
        <lable id="text">厨师姓名:</lable><input name="details.cookName" value="${ordernews.cookName}" type="text">
        <lable id="text">单价(元):</lable><input name="details.remark" value="${ordernews.remark}" type="text"> 
    <div class="button">
      <input type="submit" value="修改">        
    </div>
   </form>     
  </div>  
</body>
</html>