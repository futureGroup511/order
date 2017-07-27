<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatestocknews.css">
<link rel="stylesheet" type="text/css" href="${rootPath}wangEditor/css/wangEditor.min.css">
<style>
.row{
width:800px;
margin-top:0%;
}
</style>
<script type="text/javascript">

function changeSelected() {
	var typeName = '${stockDetails.ingName}';	//获得后台的要选中的值
	   var all_options = document.getElementById("typeName").options;
	   for (i=0; i<all_options.length; i++){
	      if (all_options[i].value == typeName)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
	      {
	         all_options[i].selected = true;
	      }
	   }
	}
     function modifyContent() {    	
     	        var content = document.getElementById("content");     	      
     	        content.value = editor.$txt.html();
   }
</script> 
</head>
<body  onload="changeSelected()"  style="background: url(${rootPath}/images/m-91.jpg);">
 <div class="updatestocknews">
      <form action="${rootPath}manage/StockDetailsAction_Update" method="post" onsubmit="modifyContent()">
          <div class="sow">
          <lable id="text">编号：</lable><input name="details.id" value="${stockDetails.id}" type="text" readonly="readonly">
          <lable id="text">进货编号：</lable><input name="details.stockId" value="${stockDetails.stockId}" type="text" ><br>
          <lable id="text">配料编号：</lable><input type="text" name="details.ingId" value="${stockDetails.ingId}" >
          <lable id="text">配料名称：</lable>
         <select name="details.ingName" id="typeName"> 
 			<c:forEach items="${Ientlist}" var="item">  
 	           	<option value="${item.name}">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
          <lable id="text">单价(元)：</lable><input type="text" name="details.price" value="${stockDetails.price}" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''">
          <lable id="text">数量：</lable><input type="number" name="details.num" value="${stockDetails.num}"><br>
          <lable id="text">进货时间：</lable><input type="text" name="details.createDate" value="${stockDetails.createDate}" class="sang_Calender">
          	<script type="text/javascript" src="${rootPath}/js/datetime.js"></script>
      	</div>
      	<div class="row">
      	<lable>溯源:</lable>
      	<textarea rows="5" cols="35" name="details.origins"  style="display:none;" id="content"></textarea><br>
     <div id="editor" style="width:800px;height:400px;"></div>
      <script type="text/javascript" src="${rootPath}wangEditor/js/lib/jquery-1.10.2.min.js"></script>
     <script type="text/javascript" src="${rootPath}wangEditor/js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('editor')    		 
     	editor.config.uploadImgUrl = '${rootPath}manage/StockDetailsAction_uploadImg'
     	editor.config.uploadImgFileName = 'myFileName'
        editor.create()
      	editor.$txt.html('${stockDetails.origins}')
       
    </script>
      	</div>
      <div class="button">
         <input type="submit" value="修改" style="width:80px;">
      </div>
      </form>        
    </div>
</body>
</html>