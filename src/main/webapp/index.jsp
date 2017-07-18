<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐饮管理系统-登陆</title>
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
		<div class="logincenter" >
			 <div class="dz" id="dz">
			    <!--  <p class="">注册</p> -->
			     <p class="">登录</p>
			 </div>
			 <div class="zlogin" id="zlogin">
			 <form action="${rootPath}loginAction" method="post">
			     <div class="in1">
			     	<p class="left">账户</p>
			     	 <input type="tel" pattern="\d{11}" class="form-control" id="inputText" placeholder="请输入账号" name="user.phone">
			     </div>
			     <div class="in1">
			     	<p class="left">密码</p>
			     	 <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" name="user.password">
			     </div>
			     <div class="in2">
			     <h4 style="color:red;">${loginMeg}</h4>
			     	<button type="submit" class="btn btn-info left" onclick="goout()">登录</button>
			     	<button type="reset" class="btn btn-info right" onclick="overset()">重置</button><br>
			     </div>
			     </form>
			 </div>	
		 </div>
</div>

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