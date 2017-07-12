<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function print() {
		window.open ("print.jsp", "newwindow", "height=400, width=200, top=50, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no"); //写成一行
	}
</script>
</head>
<body>
	<input type="button" onclick="print()" value="打印">
</body>
</html>