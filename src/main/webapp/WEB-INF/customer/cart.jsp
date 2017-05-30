<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<tr>
	<th>菜名</th>
	<th>地址</th>
	<th>简介</th>
	<th>类型ID</th>
	<th>类型名称</th>
	<th>价格</th>
	<th>被订次数</th>
	<th>是否可以做</th>
	<th>创建时间</th>
</tr>
<tr>
	<td>${menu.name}</td>
	<td>${menu.imgUrl}</td>
	<td>${menu.introduce}</td>
	<td>${menu.typeId}</td>
	<td>${menu.typeName}</td>
	<td>${menu.price}</td>
	<td>${menu.num}</td>
	<td>${menu.exist}</td>
	<td>${menu.createDate}</td>
</tr>
<center>
<form action="cart_add.action" method="post">
<table>
<tr>
<td>1</td>
<td><span onclick="changeNum(this,1)" style="cursor:pointer;">+</span><input type="text" name="num" value="" onblur="checknum(this)" /><span onclick="changeNum(this,-1)" style="cursor:pointer;">-</span></td>
</tr>
</table>
</center>
<script type="text/javascript">
function checknum(obj){
    if(obj.value >10){
        obj.value = 10;
        alert('Max 10!');
    }
}
function changeNum(obj,num)
{
    var input = getParent(obj).getElementsByTagName("input");
    for(var i=0;i<input.length;i++)
    {
        if(input[i].type=="text")
        {
            if(input[i].value == "")
                input[i].value = num;
            else
                input[i].value = input[i].value - 0 + num;
        }
        if(input[i].value == "-1")
                input[i].value = 0;
        if(input[i].value == "11")
                input[i].value = 10;
    } 
}
//获取父级对像
function getParent(obj)
{
    if(typeof(obj) != "object"){obj = document.getElementById(obj);}
    if(obj)
        return obj.parentElement || obj.parentNode;
}
</script>
</form>
</body>
</html>