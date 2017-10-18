<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>餐饮管理系统-登录</title>
<!-- 			<meta name="viewport" content="width=device-width, initial-scale=1" /> -->
			<link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.min.css"/>
		<link rel="stylesheet" href="${rootPath}css/login.css" />
	</head>
	<body>
		<div class="content">
			<div class="header">
				<span>
					<p class="p1"><span class="title">天堂鸟</span>餐饮管理系统</p>
					<p class="p2">Paradise bird catering management system</p>
				</span>
			</div>
			<div class="login">
				<form action="${rootPath}loginAction">
					<input type="text" class="form-control name" placeholder="手机号" type="tel" maxlength="11" name="user.phone" required="required"/>
						<input type="password" class=" form-control pass" placeholder="请您输入密码" maxlength="15" name="user.password" required="required"/>
						<input type="submit" class="btn btn-info denglu" value="登录">
						<p>&nbsp;${loginMeg}<p>
				</form>
			</div>
		</div>
	</body>
</html>
