<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
  <style>
      .aa{
        width: 90%;
        margin: 0 auto;
        position: absolute;
        left: 5%;
        z-index: 100;
      }
     .aa p{
        margin-top:30px;
        float: right; 
        margin-right:60px; 
        cursor: pointer;
      }
       .pag{
        float: right;
        margin-top:-90px; 
        margin-right:60px; 
     }  
       table{
            width: 100%;
            text-align: center;
            margin:100px auto; 
            font-family: 微软雅黑;
         }
        #table1 thead td{
            border: 1px solid #c6c6c6;
            background-color: #e8e7e3;
            height: 40px;
        }
         #table1 tbody td{
            border: 1px solid #c6c6c6;
            background-color: #fefefe;
            height: 35px;
        }
           .footer{
            position: absolute;
            left:40%;
            top: 90%;
            }
	html{
        background: url(../images/m-91.jpg);
    }
</style>
</head>
<script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${paCut.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
 }
}
	</script>
<body>
<div class="aa">
 <p>所有未完成菜品&nbsp;>&nbsp;已完成订单&nbsp;>&nbsp;未完成订单&nbsp;>></p>
    <table id="table1">
      <thead>
        <tr>
            <td colspan="12">订单信息</td>
        </tr>
      </thead>
        <tbody>
          <tr>
             <td>编号</td>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>订单编号</td>
             <td>菜品编号</td>
             <td>菜品名称</td>
             <td>菜品数量</td>
             <td>菜品状态</td>
             <td>下单时间</td>
             <td>厨师编号</td>
             <td>厨师名称</td>
             <td>操作</td>
          </tr>
   <c:forEach items="${menu}" var="item">
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.orderId}</td>
	                <td>${item.menuId}</td>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.status}</td>
	                <%-- <td>
	                	<c:if test="${item.exist eq '1'}">完成</c:if>
	                	<c:if test="${item.exist eq '0'}">未完成</c:if>
	                </td> --%>
	                <td>${item.creatDate}</td>
	                <td>${item.cookId}</td>
	                 <td>${item.cookName}</td>
	                 <td><c:if test="${item.status eq '未完成'}"><a href="${rootPath}cook/orderCenter_doOrder?OrderId=${item.id}">完成</c:if>
	                	<c:if test="${item.status eq '完成'}">已完成</c:if>
	                </td> 
	            </tr> 
	            </c:forEach> 
        </tbody>
    </table>
       <div class="pag">
         <ul class="pagination">
                   <li><a href="">&laquo;</a></li>
                   <li class="active"><a href="">1</a></li>
                   <li><a href="">2</a></li>
                   <li><a href="">3</a></li>
                   <li><a href="">4</a></li>
                   <li><a href="">&raquo;</a></li>
               </ul>
    </div>
    </div>
    <div class="footer">
             <a href="">技术支持:河南艾未特网络有限公司</a> 
        </div> 
</body>
</html>