<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 10%;float: left;">
	<details>
		<summary>用户管理</summary>
		<a href="${rootPath}manage/Change_addUser">增加用户</a><br>
		<a href="${rootPath}manage/Change_managerUser">管理用户</a>
	</details>
	<details>
		<summary>配料管理</summary>
		<a href="">增加配料</a><br>
		<a href="">管理配料</a>          
	</details>
	<details>
		<summary>菜品管理</summary>
		<a href="">增加菜品</a><br>
		<a href="">管理菜品</a>
	</details>
	<details>
		<summary>订单管理</summary>
		<a href="">管理订单</a>
	</details>
	<details>
		<summary>进货管理</summary>
		<a href="">增加进货</a><br>
		<a href="">管理进货</a>
	</details>
	<details>
		<summary>个人中心</summary>
		<a href="">查看个人资料</a><br>
		<a href="">退出登录</a>
	</details>
	</div>
	<div style="width:90%;float: right">
		<iframe height="400px" width="100%" name="mainFrame" src="" ></iframe> 
	</div>
	</body>
</html>