<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addtable.css">
</head>
<body style="background: url(${rootPath}/images/iframebg.jpg);">
	<div style="font-size: 20px;margin-left:41%;font-weight: bold;margin-top:2%;">${mark}</div>
  <div class="wall"> 
    <form action="${rootPath}manage/Payment_addPayment" method="post">
       <span style="font-size: 20px;">支付方式：</span><input class="input" type="text" name="payment.ways" required="required" maxlength="10"><br>
		<input class="button" type="submit" value="确认添加"> 
    </form>
  </div>  
</body>
</html>