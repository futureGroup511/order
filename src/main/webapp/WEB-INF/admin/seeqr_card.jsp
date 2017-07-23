<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}dist/css/wangEditor.min.css">
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
 <div id="editor" style="width:650px; height:500px;"></div>
 <script type="text/javascript" src="${rootPath}dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${rootPath}dist/js/wangEditor.min.js"></script>
    <script type="text/javascript">
    var editor = new wangEditor('editor');
    editor.create();
//         var E = window.wangEditor
//         var editor = new E('#editor')
//         editor.create()      
    </script>
</body>
</html>