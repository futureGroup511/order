<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addstockdetails.css">
<script type="text/javascript" charset="utf-8" src="${ rootPath}ueditor1_4_3/ueditor.config.js"></script>

<script type="text/javascript" charset="utf-8" src="${rootPath }ueditor1_4_3/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${rootPath}ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    function modifyContent() {
        var content = document.getElementById("content");

        var arr = [];

        arr.push(UE.getEditor('editor').getContent());

        content.value = arr;

    }
</script>
<style>
.row{
width:500px;
margin-left:41%;
margin-top:-23%;
}
</style>
<script type="text/javascript">
var ue = UE.getEditor('editor', {
	toolbars: [
	           [
	               'undo', //撤销
	               'redo', //重做
	               'bold', //加粗
	               'indent', //首行缩进
	               'italic', //斜体
	               'formatmatch', //格式刷
	               'pasteplain', //纯文本粘贴模式
	               'selectall', //全选
	               'horizontal', //分隔线
	               'removeformat', //清除格式
	               'inserttitle', //插入标题
	               'cleardoc', //清空文档
	               'fontfamily', //字体
	               'fontsize', //字号
	               'paragraph', //段落格式
	               'simpleupload', //单图上传
	               'link', //超链接
	               'emotion', //表情
	               'spechars', //特殊字符
	               'searchreplace', //查询替换
	               'justifyleft', //居左对齐
	               'justifyright', //居右对齐
	               'justifycenter', //居中对齐
	               'justifyjustify', //两端对齐
	               'forecolor', //字体颜色
	               'backcolor', //背景色
	               'insertorderedlist', //有序列表
	               'insertunorderedlist', //无序列表
	               'fullscreen', //全屏
	               'rowspacingtop', //段前距
	               'rowspacingbottom', //段后距
	               'imagenone', //默认
	
	               'imagecenter', //居中
	               'lineheight', //行间距
	               'edittip ', //编辑提示
	               'customstyle', //自定义标题
	               'autotypeset', //自动排版
	               'background', //背景
	           ]
	       ],
    autoHeightEnabled: true,
    autoFloatEnabled: true
});
</script>
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">

<div class="wall">
	<div style="margin-left:35%;font-weight: bold;">${addMsg}</div>
	<form action="${rootPath}manage/StockDetailsAction_AddDetails" method="post" onsubmit="modifyContent()">
     <lable>配料名称:</lable>
      <select name="details.ingName"> 
 			<c:forEach items="${Ientlist}" var="item">  
 	           	<option value="${item.name}">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
     <lable>重量(kg):</lable><input style="margin-left: 1%;" type="number" name="details.num" required="required" placeholder="请输入数字"><br>
     <lable>价格(kg):</lable><input style="margin-left: 1%;" type="number"  name="details.price" required="required" placeholder="请输入数字"><br>
     <div style="font-size:20px;font-weight: bold;width:5%;margin-left:-100px;">溯源:</div>
     <div class="suyuan">
     <textarea rows="5" cols="100" name="details.origins" style="display:none;" id="content"></textarea><br>
      <script id="editor" type="text/plain" style="margin-top:-50px; width:100%; height: 50%;"></script>
     </div>
      <div class="button">
        <input style="background-color: #1BAFE0;margin-top:3%;width:100px;" type="submit" value="提交">          
      </div>
    </form>
</div>
</body>
</html>