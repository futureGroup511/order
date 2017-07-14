<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="js/jquery.js"></script>
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
<body  onload="changeSelected()"   style="background: url(${rootPath}/images/m-91.jpg);">
<div class="updatemenu">
   <form action="${rootPath}manage/MenuManager_updateMenu?menu.id=${updateMenu.id}&menu.imgUrl=${updateMenu.imgUrl}" method="post" enctype="multipart/form-data">
          <lable id="text">菜名：</lable><input type="text" name="menu.name" value="${updateMenu.name}">
          <lable id="text">类型名称：</lable>
          <select name="menu.typeName" id="typeName">
          <c:forEach items="${Typelist}" var="item">
          <option value="${item.name}">${item.name}</option>
          </c:forEach>
          </select><br>
          <lable id="text">价格：</lable><input type="text"name="menu.price" value="${updateMenu.price}">
          <lable id="text">被定次数：</lable><input type="text" name="menu.num" value="${updateMenu.num}"><br>
          <lable id="text">是否可以做：</lable>
			<select name="menu.exist">
			<option value="1" <c:if test="${updateMenu.exist eq '1'}">selected = selected</c:if>>可做</option>
			<option value="0" <c:if test="${updateMenu.exist eq '0'}">selected = selected</c:if>>暂缺</option>
			</select>
          <lable id="text">简介：</lable><input type="text" name="menu.introduce" value="${updateMenu.introduce}"><br>
           <input type="file" name="file" accept="image/*" class="input1" value="选择图片" style="border:none; outline:none;margin-left:35%"><br>
           <lable id="text">图片：</lable><br>
           <img alt="加载中" src="${rootPath}uploadImg/${updateMenu.imgUrl}" width="260" height="120">
      <div class="button">
      	<input type="button" onclick="window.location='${rootPath}manage/MenuMaterial_updateMenuMaterial?menuId=${updateMenu.id}';" value="修改菜品详情">
       <input type="submit" value="修改">
      </div>
  </form>        
  </div> 
</body>
</html>