<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmenutype.css">
</head>
<body>
 <div class="wall">
	 <h4>${typenews}</h4>
	 <form action="${rootPath}manage/MenuTypeAction_Add" method="post" enctype="multipart/form-data">
	  <lable id="text">类型名称：</lable><input type="text" name="menutype.name"></input><br>
	  <lable id="textarea">备注：</lable><textarea cols="31" rows="3" name="menutype.remark"></textarea><br>
	  <button type="submit">添加</button>
	 </form>
	 </div>
</body>
</html>