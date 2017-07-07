<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h4>${typenews}</h4>
	 <form action="${rootPath}manage/MenuTypeAction_Add" method="post" enctype="multipart/form-data">
	  <lable>菜品类型名称：</lable><input type="text" name="menutype.name"></input>
	  <lable>备注：</lable><input type="text" name="menutype.remark"></input>
	  <input type="submit" value="添加"></input>
	 </form>
</body>
</html>