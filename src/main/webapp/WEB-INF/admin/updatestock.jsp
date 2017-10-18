<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatestock.css">
</head>
<body  style="background: url(${rootPath}images/iframebg.jpg);">
 <div class="updatestock">
      <form action="${rootPath}manage/StockAction_Update" method="post">
          <lable id="text">编&nbsp;&nbsp;&nbsp;号：</lable><input name="stocks.id" value="${stock.id}" type="text" readonly="readonly"><br>
          <lable id="text">进货地点：</lable><input name="stocks.site" value="${stock.site}" type="text" required="required" readonly="readonly"><br>
          <lable id="text">进货总支出：</lable><input name="stocks.total" value="${stock.total}" type="text" required="required" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"><br>
          <lable id="text">进货时间：</lable><input name="stocks.createDate" value="${stock.createDate}" type="text" class="sang_Calender" required="required">
          	<script type="text/javascript" src="../js/datetime.js"></script><br>
          <lable id="text">备&nbsp;&nbsp;&nbsp;注：</lable><input name="stocks.remark" value="${stock.remark}" type="text">
      <div class="button">
         <input type="button"  style="width:100px;height:30px;background: #1bafe0;margin-left:2%;" onclick="window.location='${rootPath}manage/StockAction_Add?id=${stock.id}';" value="添加进货详情">
         <input style="width:100px;margin-left: 6%;height:30px;" type="submit" value="修改">
      </div> 
       </form>       
    </div>
</body>
</html>