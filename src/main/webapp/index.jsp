<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 		function reloadCode(){
 			var time=new Date().getTime();
			document.getElementById("imagecode").src="${rootPath}manage/CodeAction.action?d="+time;
 	}
</script>

</head>
<body>
	<center>
		<form action="${rootPath}manage/loginAction" method="post">
			手机号：<input type="text" name="user.phone"><br>
			密&nbsp;码：<input type="password" name="user.password"><br>
<%-- 			验证码：<img alt="验证码" id="imagecode"  src="${rootPath}manage/CodeAction.action" width="120" height="40"> --%>
<!-- 	 			<input type="text" name="randStr"><a href="javascript:reloadCode();">看不清楚</a><br> -->
	 			 <h4>${loginMeg}</h4>  
			<input type="submit" value="提交">
		</form>
	</center>
</body>
</html>