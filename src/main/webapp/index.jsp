<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />  
		<title>餐饮管理系统-登录</title>
		<link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.min.css"/>
		<link rel="stylesheet" href="${rootPath}css/login.css" />
		
	</head>
	<body>
		<div class="center">
			<div class="header">
				<div class="row">
					<div class="col-lg-7 col-lg-offset-3 col-md-6 col-md-offset-2 col-sm-7 col-sm-offset-2 col-xs-6 col-xs-offset-2">
						<p>欢迎来到餐饮管理系统</p>
					</div>
				</div>
			</div>
			<div class="login">
				<form action="${rootPath}loginAction" method="post">
					<div class="name">
						<label class="form-inline">账户<input type="tel" pattern="\d{11}" placeholder="手机号" class="form-control input-lg" name="user.phone" required="required"/></label>
					</div>
					<div class="pass">
						<label class="form-inline">密码<input type="password" maxlength="15" placeholder="密码" class="form-control input-lg" name="user.password" required="required"/></label>
					</div>
					<div class="btn-g">
						<div style="text-align: center;"><h4 style="color:red;">${loginMeg}</h4></div>
						<input type="submit" class="btn btn-info" value="登录"/>
						<input type="reset" class="btn btn-info right" />
					</div>
				</form>
			</div>
			
		</div>
		
		<script async="async" type="text/javascript" src="${rootPath}js/jquery.min.js"></script>
		<script async="async" type="text/javascript" src="${rootPath}js/bootstrap.min.js"></script>
		<!--[if lt IE 9]>  
　　　　<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>  
		<![endif]-->
	</body>
</html>