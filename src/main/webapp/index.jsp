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
	<link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${rootPath}css/login.css">
</head>
<body>
<div class="login">
<p class="loginp">订餐管理系统</p>
		<div class="logincenter" >
			 <div class="dz" id="dz">
			    <!--  <p class="">注册</p> -->
			     <p class="">登录</p>
			 </div>
			 <div class="zlogin" id="zlogin">
			 <form action="${rootPath}manage/loginAction" method="post">
			     <div class="in1">
			     	<p class="left">账户</p>
			     	 <input type="text" class="form-control" id="inputText" placeholder="请输入账号" name="user.phone">
			     </div>
			     <div class="in1">
			     	<p class="left">密码</p>
			     	 <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" name="user.password">
			     </div>
			     <div class="in2">
			     	<button type="submit" class="btn btn-info left" onclick="goout()">登录</button>
			     	<button type="reset" class="btn btn-info right" onclick="overset()">重置</button><br>
			     	 <h4>${loginMeg}</h4>
			     </div>
			     </form>
			 </div>	
		 </div>
		</div>
</div>
<!-- 	<center> -->
<%-- 		<form action="${rootPath}manage/loginAction" method="post"> --%>
<!-- 			账&nbsp;号：<input type="text" name="user.phone"><br> -->
<!-- 			密&nbsp;码：<input type="password" name="user.password"><br> -->
<%-- <%-- 			验证码：<img alt="验证码" id="imagecode"  src="${rootPath}manage/CodeAction.action" width="120" height="40"> --%> 
<!-- <!-- 	 			<input type="text" name="randStr"><a href="javascript:reloadCode();">看不清楚</a><br> -->
<%-- 	 			 <h4>${loginMeg}</h4>   --%>
<!-- 			<input type="submit" value="提交"> -->
<!-- 		</form> -->
<!-- 	</center> -->

</body>
<script>
	 function $(a){
           return document.getElementById(a);
	 }
     function goout(){
	    if($('inputText').value==''){
            alert("账户不能为空");
	    }
	    if($('inputPassword').value==''){
	    	alert("密码不能为空");
	    }
    }
    function overset(){
         $('inputText').value = '';
         $('inputPassword').value='';
    }
</script>
</html>