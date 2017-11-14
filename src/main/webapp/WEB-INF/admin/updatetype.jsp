<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatetype.css">
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
    width:160px;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
    margin-left: 35%;
    margin-top:1%;
}
.img{
	width:240px;
	height:120px;
	margin-left:-1%;
	vertical-align:middle;
}
</style>
</head>
<body  style="background: url(${rootPath}images/iframebg.jpg);">
<div class="wall">
	<form action="${rootPath}manage/MenuTypeAction_Update" method="post" enctype="multipart/form-data">
		  <input type="hidden" name="menutype.imgUrl" value="${menutype.imgUrl}"/>
          <lable id="text">编号:</lable><input name="menutype.id" value="${menutype.id}" type="text" readonly="readonly"><br>
          <lable id="text">类型:</lable><input name="menutype.name" value="${menutype.name}" type="text" required="required" maxlength="10"><br>
          <lable id="text">介绍:</lable><input name="menutype.remark" value="${menutype.remark}" type="text"><br>
          <lable id="text" >图片：</lable>
          <img alt="加载中" src="${rootPath}uploadImg/${menutype.imgUrl}" class="img" >
         <input type="file" name="file" accept="image/*" class="file" value="选择图片"><br>
      <div class="button">
         <input style="background-color: #75c7ed;border-radius: 5px;width:150px;margin-left: 10%;" type="submit" value="修改">
      </div> 
       </form> 
       </div>      
</body>
</html>