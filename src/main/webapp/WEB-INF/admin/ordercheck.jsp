<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/ordercheck.css">
 <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
 <script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${pc.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
 }
  }

function CheckNopay(){
	window.location.href="${rootPath}manage/OrderAction?sign=two"; 
	}
function CheckPay(){
	window.location.href="${rootPath}manage/OrderAction?sign=there";
	}
function Check(){
	window.location.href="${rootPath}manage/OrderAction?sign=one";
	}
function search(){
	alter("lmkm");
    var status = document.getElementById('status').value;
	if(status=="已付款"){
		alter("该用户已付款");
	}
//     obj.href = obj.href + "&gjz="+key;

}
	</script>
 <script type="text/javascript">
	function print(id) {
		window.open ("${rootPath}manage/OrderDetailsAction_Print?id="+id, "newwindow", " top=50, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no"); //写成一行
	}
</script>
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/ordercheck.css">
 <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
<center>
<h4>${marknews}</h4>
</center> 
<div class="ordercheck" id="div1">
     <div class="button">
      <input type="button" onclick="return CheckNopay();" value="未付款">
      <input type="button" onclick="return CheckPay();" value="已付款">
      <input type="button" onclick="return Check();" value="查看全部">      
      </div>  
      <div class="order">
       <table cellspacing="0" border="1">
         <thead>
          <tr>
             <td colspan="11">订单信息</td>
          </tr>   
         </thead>
         <tbody>
          <tr>
             <td>id</td>
             <td>餐桌id</td>
             <td>餐桌名称</td>
             <td>总价</td>
             <td>状态</td>
             <td>订单时间</td>
             <td>厨师id</td>
             <td>厨师姓名</td>
             <td>备注</td>
             <td>操作</td>
             <td>操作</td>
             <td>操作</td>
           </tr>
                  	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.total}</td>
	                <td  id="status">${item.status}</td>
	                <td>${item.createDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td>${item.remark}</td>
	                <td  class="four"><a href="${rootPath}manage/OrderDetailsAction_CheckOrderDetails()?id=${item.id}">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/OrderAction_Pay()?id=${item.id}"  onclick="javascript:search();">付款</a></td>      
	                <td  class="four"><a href="${rootPath}manage/OrderAction_toUpdate()?id=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/OrderAction_Delet()?id=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>      
	            	<td><input style="background-color: #B1D3EC;width:40px;border-radius: 5px;" type="button" onclick="print(${item.id})" value="打印"></td>
	            </tr>  
        	</c:forEach>                         
         </tbody>
     </table>      
    </div>
 </div>
<div class="page" id="div2">
<ul class="pagination">
  <li><a href="${rootPath}manage/OrderAction?page=${pc.prePage}&sign=${sign}">上一页</a></li>
  						<c:if test="${1 < pc.currentPage -3}">
							<li><a href="#">1</a></li>
						</c:if>
 						<c:forEach var="i" 
 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" 
 							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage}"> 
 									<li class="active"><a 
 										href="${rootPath}manage/OrderAction?page=${i }&sign=${sign}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage}"> 
 									<li><a href="${rootPath}manage/OrderAction?page=${i }&sign=${sign}">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
 						</c:forEach> 
  <li><a href="${rootPath}manage/OrderAction?page=${pc.nextPage}&sign=${sign}">下一页</a></li>
</ul>
 </div>   
</body>
</html>