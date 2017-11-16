<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> 
	//厨师处修改个人资料
	var msg = '${updateUserMsg}';
	console.info(msg);
	this.location.href= "${rootPath}cook/Cookdetail_updateUser?msg="+msg+"";
</script>
</head> 
<body>
</body>
</html>