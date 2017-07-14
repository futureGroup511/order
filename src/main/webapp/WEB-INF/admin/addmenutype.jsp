<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmenutype.css">
<style type="text/css">
.file {
    position: relative;
    display: inline-block;
/*     background: #D0EEFF; */
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    width:190px;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
</style>
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
 <div class="wall">
	 <h4>${typenews}</h4>
	 <form action="${rootPath}manage/MenuTypeAction_addType" method="post" enctype="multipart/form-data">
	  <lable id="text">类型名称：</lable><input type="text" name="menutype.name"></input><br>
	  <lable id="textarea">备&nbsp;&nbsp;&nbsp;&nbsp;注：</lable><textarea cols="31" rows="3" name="menutype.remark"></textarea><br>
	  <label id="text">类型图片：</label><input class="file" type="file" name="file" value="选择图片" />
	  <button style="background-color: #1BAFE0;border-radius: 5px;width:130px;" type="submit">添加</button>
	 </form>
	 </div>
</body>
</html>