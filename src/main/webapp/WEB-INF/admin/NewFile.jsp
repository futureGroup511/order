<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form action="${rootPath}manage/Test_addMenu" method="post" enctype="multipart/form-data" name="form1" id="formid1">  
      		 用户名：<input type="text" name="username">  
      		   请选择需要上传的文件：<input type="file" id="dofile" name="file"/><br /> 
        	 <input type="submit" id="btnupload" name="btnupload" value="开始上传" >  
     </form>  
		
	</center>
</body>
</html>