<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatestocknews.css">
<script type="text/javascript" charset="utf-8" src="${ rootPath}ueditor1_4_3/ueditor.config.js"></script>

<script type="text/javascript" charset="utf-8" src="${rootPath }ueditor1_4_3/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${rootPath}ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
window.onload=function(){
	var value="${stockDetails.origins}";
	UE.getEditor('editor').setContent(value);
}
    function modifyContent() {
        var content = document.getElementById("content");

        var arr = [];

        arr.push(UE.getEditor('editor').getContent());

        content.value = arr;

    }
</script>
<style>
.row{
width:300px;
margin-left:65%;
margin-top:-85%;
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
<body  style="background: url(${rootPath}/images/m-91.jpg);">
 <div class="updatestocknews">
      <form action="${rootPath}manage/StockDetailsAction_Update" method="post" onsubmit="modifyContent()">
          <div class="sow">
          <lable id="text">编号：</lable><input name="details.id" value="${stockDetails.id}" type="text" readonly="readonly"><br>
          <lable id="text">进货编号：</lable><input name="details.stockId" value="${stockDetails.stockId}" type="text" ><br>
          <lable id="text">配料编号：</lable><input type="text" name="details.ingId" value="${stockDetails.ingId}" ><br>
          <lable id="text">配料名称：</lable><input type="text" name="details.ingName" value="${stockDetails.ingName}"><br>
          <lable id="text">单价(元)：</lable><input type="text" name="details.price" value="${stockDetails.price}" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"><br>
          <lable id="text">数量：</lable><input type="number" name="details.num" value="${stockDetails.num}"><br>
          <lable id="text">进货时间：</lable><input type="text" name="details.createDate" value="${stockDetails.createDate}" class="sang_Calender"><br>
          	<script type="text/javascript" src="${rootPath}/js/datetime.js"></script>
      	</div>
      	<div class="row">
      	<lable>溯源:</lable>
      	<textarea rows="5" cols="35" name="details.origins"  style="display:none;" id="content">${stockDetails.origins}</textarea><br>
      	 <script id="editor" type="text/plain" style="width:100%; height: 160px;"></script>
      	</div>
      <div class="button">
         <input type="submit" value="修改" style="width:80px;">
      </div>
      </form>        
    </div>
</body>
</html>