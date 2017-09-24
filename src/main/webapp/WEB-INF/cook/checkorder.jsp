<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>未完成菜品</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/bootstrap.css">
<style>
#div1 {
	width: 90%;
    position:relative;
    margin:10px auto;
	z-index: 100;
}

#div1 p {
	margin-top: 30px;
	float: right;
	margin-right: 60px;
	cursor: pointer;
}
#div2{
   position:relative;
   width:90%;
   margin:50px auto;
   
} 
.pag {
	float: right;
	margin-top: 40px;
	margin-right: 0px;
}

table {
	width: 100%;
	text-align: center;
	font-family: 微软雅黑;
	font-size:13px;
}

#table1 thead td {
	border: 1px solid #c6c6c6;
	background-color: #e8e7e3;
	  height: 30px; 
}
#table2{
    position:relative;
    top:0;
    margin-bottom:40px;
    margin-top:20px;
    width:100%;
}
#table1 tbody td {
	border: 1px solid #c6c6c6;
	background-color: #fefefe;
    height: 35px;  
}
 #table2 thead td{

            border: 1px solid #c6c6c6;
            background-color: #e8e7e3;
            height: 30px; 
           
        }
       
         #table2  tbody td{
            border: 1px solid #c6c6c6;
            background-color: #fefefe;
            height: 30px;
        }
.footer {
	position: absolute;
	left: 40%;
	top: 95%;
}

html {
	background: url(../images/m-91.jpg);
}
body {
	background: url(../images/m-91.jpg);
}
</style>
</head>
<script language="javascript">
	window.onload = function() {
		var array = new Array();
		var array1 = new Array();
		<c:forEach items="${paCut.data}" var="t">
		array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
		</c:forEach>
		<c:forEach items="${inform}" var="q">
		array1.push("${q.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
		</c:forEach>
		var a = array.length;
		var b = array1.length;
		if (a != 0) {
			/*  document.getElementsByClassName('aa')[0].style.display='none'; */
			document.getElementById('div2').style.display = 'block';

		} else {
			alert("无数据")
		}
		if (b != 0) {
			document.getElementById('div1').style.display = 'block';

		} 
	}
</script>
<body>
<div id="div1" style="display: none">
<table id="table2">
      <thead>
        <tr>
            <td colspan="10">催单信息</td>
        </tr>
      </thead>
        <tbody>
          <tr>
             <td>编号</td>
             <td style="width:250px">通知时间</td>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>通知内容</td>
          </tr>
         <c:forEach items="${inform}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.createDate}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                 <td style="width:400px;height:20px"><textarea readonly="readonly" style="width:400px;height:30px">${item.content}</textarea></td>
	            </tr>  
        	</c:forEach>
        </tbody>
    </table>

</div>
	<div id="div2" style="display: none">
	
	<table id="table1">
			<thead>
				<tr>
					<td colspan="14">订单详情</td>
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
					<td>厨师名称</td>
					<td>备注</td>
					<td>溯源</td>
					<td style="width:50px;">操作</td>
				</tr>
				<c:forEach items="${paCut.data}" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.tableId}</td>
						<td>${item.tableName}</td>
						<td>${item.orderId}</td>
						<td>${item.menuId}</td>
						<td>${item.menuName}</td>
						<td>${item.menuNum}</td>
						<td>${item.status}</td>
						<td>${item.creatDate}</td>
						<td>${item.cookName}</td>
						<td style="width:200px;height:10px"><textarea readonly="readonly" style="width:200px;height:30px">${item.remark}</textarea></td>
						<td><a target="_blank" href="${rootPath}OrderDetail_printQRCode?menuId=${item.menuId}&OrderId=${item.orderId}">打印二维码</a></td>
						<td>
	                		<c:if test="${item.status eq '未完成'}"><a href="${rootPath}cook/orderCenter_dealUnfinish?i=${item.id}&tableId=${item.tableId}&Orderid=${item.orderId}&menuId=${item.menuId}">处理</a></c:if>
	                		<c:if test="${item.status eq '处理中'}"><a href="${rootPath}cook/orderCenter_checko?i=${item.id}&tableId=${item.tableId}&ID=${user.id}&Orderid=${item.orderId}&menuId=${item.menuId}">完成</a></c:if>
	                		<c:if test="${item.status eq '已完成'}">已完成</c:if>
	               		<td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pag">
			<ul class="pagination">
				<li><a href="?page=${paCut.prePage}&OrderId=${paCut.data[0].orderId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].orderId}&i=${paCut.data[0].id}">上一页</a></li>
				<c:forEach var="i"
					begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
					end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
							<li class="active"><a
								href="?page=${i}&OrderId=${paCut.data[0].orderId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].orderId}&i=${paCut.data[0].id}">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != paCut.currentPage &&i<=3}">
							<li><a
								href="?page=${i }&OrderId=${paCut.data[0].orderId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].orderId}&i=${paCut.data[0].id}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a href="?page=${paCut.nextPage}&OrderId=${paCut.data[0].orderId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].orderId}&i=${paCut.data[0].id}">下一页</a></li>
			</ul>
		</div>
	</div>
	<div class="footer">
		<a href="">技术支持:河南艾未特网络有限公司</a>
	</div>
</body>
 </html>
 <%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>未完成菜品</title>
     <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
  <style>
      .aa{
        width: 95%;
        margin: 0 auto;
        position: absolute;
        left: 2%;
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
        margin-right:0px; 
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
window.onload = function() {
	var array = new Array();
	<c:forEach items="${paCut.data}" var="t">
	array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	</c:forEach>
	var a = array.length;
	if (a != 0) {
		/*  document.getElementsByClassName('aa')[0].style.display='none'; */
		document.getElementById('div1').style.display = 'block';
		
	}else{
		alert("无数据")
	}
}
	</script>
<body>
<div class="aa" id="div1" style="display: none" >
    <table id="table1">
      <thead>
        <tr>
            <td colspan="13">订单详情</td>
        </tr>
      </thead>
        <tbody>
          <tr>
             <td>编号</td>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>订单号</td>
             <td>菜品编号</td>
             <td>菜品名称</td>
             <td>菜品数量</td>
             <td>菜品状态</td>
             <td>下单时间</td>
             <td>厨师名称</td>
			  <td>备注</td>
			  <td>溯源</td>
			   <td style="width:50px;">操作</td>
  		</tr>
  		 <c:forEach items="${paCut.data}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.orderId}</td>
	                <td>${item.menuId}</td>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.status}</td>
	                <td>${item.creatDate}</td>
	                <td>${item.cookName}</td>
	               <td style="width:130px;height:10px"><textarea style="width:100%;height:105%">${item.remark}</textarea></td>
	                <td><a target="_blank" href="${rootPath}OrderDetail_printQRCode?menuId=${item.menuId}">打印二维码</a></td>
	                <td>
	                <c:if test="${item.status eq '未完成'}"><a href="${rootPath}cook/orderCenter_deal?i=${item.id}&tableId=${item.tableId}&Orderid=${item.orderId}&menuId=${item.menuId}">处理</a></c:if>
	                <c:if test="${item.status eq '处理中'}"><a href="${rootPath}cook/orderCenter_checko?i=${item.id}&tableId=${item.tableId}&ID=${user.id}&Orderid=${item.orderId}&menuId=${item.menuId}">完成</a></c:if>
	                <c:if test="${item.status eq '已完成'}">已完成</c:if></td>
	            </tr>  
        	</c:forEach>
        </tbody>
    </table>
       <div class="pag">
         <ul class="pagination">
                   <li><a href="?page=${paCut.prePage}&OrderId=${paCut.data[0].tableId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].id}">上一页</a></li>
 						
 						<c:forEach var="i" 
							begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
 							end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
 									<li class="active"><a 
 										href="?page=${i}&OrderId=${paCut.data[0].tableId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].id}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != paCut.currentPage &&i<=3}"> 
 									<li><a href="?page=${i }&OrderId=${paCut.data[0].tableId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].id}">${i}</a></li> 
 								</c:when> 
 							</c:choose>
 						</c:forEach> 
 						
 						<li><a 
 							href="?page=${paCut.nextPage}&OrderId=${paCut.data[0].tableId}&tableId=${paCut.data[0].tableId}&Orderid=${paCut.data[0].id}">下一页</a></li> 
               </ul>
    </div>
    </div>
    <div class="footer">
             <a href="">技术支持:河南艾未特网络有限公司</a> 
        </div> 
</body>
</html> --%>