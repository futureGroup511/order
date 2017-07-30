<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatetable.css">
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
	<div class="wall">
        <form action="${rootPath}manage/Payment_updatePayWays" method="post">
            <label>支<span style="margin-right: 10px;">付</span>编号:</label>
              <input type="text" name="payment.id" value="${payways.id}" readonly="readonly"><br>
            <label>支付方式:</label>
              <input type="text" name="payment.ways" value="${payways.ways}" required="required"><br>
              <button style="background-color: #1BAFE0" type="submit">确认修改</button>
        </form>
    </div>
</body>
</html>