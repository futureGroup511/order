<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.file {
   margin-left:18%;
   margin-top:3%;
}
textarea{
	margin-left:0px;margin-top:0px;border-radius: 5px;
	font-size:15px;
	border-color: blue;
}
.img{
	width:260px; height:120px;
	margin-left:0px;  
}

</style>
<script type="text/JavaScript" src="${rootPath}js/jquery.js"></script>
<script type="text/javascript">

	function changeSelected() {
		var typeName = '${updateMenu.typeName}';	//获得后台的要选中的值
		   var all_options = document.getElementById("typeName").options;
		   for (i=0; i<all_options.length; i++){
		      if (all_options[i].value == typeName)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
		      {
		         all_options[i].selected = true;
		      }
		   }
		}
</script>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatemenu.css">
</head>
<body  onload="changeSelected()"   style="background: url(${rootPath}images/iframebg.jpg);">
<div class="updatemenu">
   <form action="${rootPath}manage/MenuManager_updateMenu" method="post" enctype="multipart/form-data">
         	<input type="hidden" name="menu.id" value="${updateMenu.id}"/>
         	<input type="hidden" name="menu.imgUrl" value="${updateMenu.imgUrl}"/>
          <lable id="text">菜名：</lable><input type="text" name="menu.name" value="${updateMenu.name}" required="required" maxlength="10">
          <lable id="text">类型名称：</lable>
          <select name="menu.typeId" id="typeName">
          <c:forEach items="${Typelist}" var="item">
          	<option value="${item.id}">${item.name}</option>
          </c:forEach>
          </select><br>
          <lable id="text">价格：</lable><input type="text" name="menu.price" value="${updateMenu.price}" required="required" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''">
          <lable id="text">是否可以做：</lable>
			<select name="menu.exist">
			<option value="1" <c:if test="${updateMenu.exist eq '1'}">selected = selected</c:if>>可做</option>
			<option value="0" <c:if test="${updateMenu.exist eq '0'}">selected = selected</c:if>>暂缺</option>
			</select><br>
          <lable id="text">简介：</lable>
          <textarea class="textarea" name="menu.introduce"rows="3" cols="63">${updateMenu.introduce}</textarea><br>          
           <lable id="text">图片：</lable>
           <img alt="加载中" src="${rootPath}uploadImg/${updateMenu.imgUrl}"  class="img"><br>
            <input type="file" name="file" accept="image/*" class="file" value="选择图片"><br>
      <div class="button">
      	<input type="button"  style="height:30px;background:#84C2E9;margin-left:15%;" onclick="window.location='${rootPath}manage/MenuMaterial_updateMenuMaterial?menuId=${updateMenu.id}';" value="菜品配料详情">
       <input type="submit" style="height:30px;margin-left:5%;background:#84C2E9;" value="修改">
      </div> 
  </form>        
  </div> 
</body>
</html>