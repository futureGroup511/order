</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
欢迎登陆本系统 
<div style="width: 10%;float: left;">
	<details>
		<summary>个人中心</summary>
		<a href="${rootPath}cook/Cookdetail_viewUser">查看资料</a><br>
		<a href="${rootPath}cook/Cookdetail_updateUser"">修改资料</a><br>
	</details>
	<details>
		<summary>订单中心</summary>
		<a href="${rootPath}cook/orderCenter_checkorder">查看所有订单</a><br>
		<a href="${rootPath}cook/orderCenter_finishd">已完成订单</a><br>
		<a href="${rootPath}cook/orderCenter_unfinishd">未完成订单</a><br>
	</details>
	<details>
		<summary><a href="${rootPath}cook/Cookdetail_updateUser"">退出登录</a></summary>
	</details>
	</div>
	<div style="width:90%;float: right">
		<iframe height="400px" width="100%" name="mainFrame" src="" ></iframe> 
	</div>
</body>
</html>