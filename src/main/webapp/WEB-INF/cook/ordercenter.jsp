<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看所有订单</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
    <style>
        .aa{
            width: 90%;
            height: 400px;
            margin: 0 auto;
            position: absolute;
            left: 5%;
            z-index: 100;
        }
        .aa p{
            margin-top:30px;
            float: right; 
            cursor: pointer;
        }
        .pag{
        float: right;
         margin-top: -90px;
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
<body>
<div class="aa">
 <p>查看所有订单&nbsp;>&nbsp;已完成订单&nbsp;>&nbsp;未完成订单&nbsp;>></p>
    <table id="table1">
      <thead>
        <tr>
            <td colspan="11">订单信息</td>
        </tr>
      </thead>
        <tbody>
          <tr>
             <td>编号</td>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>总价</td>
             <td>订单状态</td>
             <td width="200">订单时间</td>
             <td>厨师编号</td>
             <td>厨师名称</td>
             <td>备注</td>
             <td>处理订单</td>
             <td>详情</td>
          </tr>
       <c:forEach items="${paCut.data}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.total}</td>
	                <td>${item.status}</td>
	                <td>${item.createDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td>${item.remark}</td>
	                 <td><c:if test="${item.status eq '已付款'}">已完成</c:if>
	                 <c:if test="${item.status eq '未处理'}"><a href="${rootPath}cook/orderCenter_DoOrder?OrderId=${item.id}">处理订单</a></c:if>
	                 <c:if test="${item.status eq '处理中'}">处理中</c:if>
	                  <c:if test="${item.status eq '未付款'}">未付款</c:if>
	                 </td>
	                  <td><a href="${rootPath}cook/orderCenter_check?OrderId=${item.tableId}">${item.tableName}</a></td>
	            </tr>  
        	</c:forEach>
        </tbody>
    </table>
         <div class="pag">
         <ul class="pagination">
                   <li><a href="?page=${paCut.prePage}">上一页</a></li>
 						<c:if test="${1 < paCut.currentPage -3}"> 
 							<li><a href="#">1</a></li> 
 						</c:if>
 						<c:forEach var="i" 
							begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
 							end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
 									<li class="active"><a 
 										href="?page=${i}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose>
 						</c:forEach> 
 						
 						<li><a 
 							href="?page=${paCut.nextPage}">下一页</a></li> 
               </ul>
    </div>
    </div>
    <div class="footer">
             <a href="">技术支持:河南艾未特网络有限公司</a> 
        </div> 
</body>
</html>