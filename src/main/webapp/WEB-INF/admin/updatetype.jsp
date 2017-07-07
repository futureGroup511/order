<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${rootPath}manage/MenuTypeAction_Update" method="post">
          <lable id="text">编号:</lable><input name="menus.id" value="${menutype.id}" type="text" readonly="readonly"><br>
          <lable id="text">类型:</lable><input name="menus.name" value="${menutype.name}" type="text"><br>
          <lable id="text">介绍:</lable><input name="menus.remark" value="${menutype.remark}" type="text"><br>
      <div class="button">
         <input type="submit" value="修改">
      </div> 
       </form>       
</body>
</html>