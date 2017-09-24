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
        width: 95%;
        margin: 0 auto;
        position: absolute;
        left: 2%;
        z-index: 100;
      }
        .aa p{
            margin-top:30px;
            float: right; 
            cursor: pointer;
        }
        .pag{
        float: right;
         margin-top: 0;
        margin-right:0px; 
        }
        
        table{
            width: 100%;
            text-align: center;
            margin:10px auto; 
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
           .search{
             width:400px;
             height:30px;
             margin-top:35px;
             margin-left:72.5%; 
              
             display: inline-block;
        }
        .input1{
            float: left;
            padding-left: 20px;
            width:54%;
            height:30px ;
            border:1px solid #cfcfcf;
            border-radius: 4px;
            font:400 16px/40px "微软雅黑";
            line-height:30px;
        }
          .input2{
            float: left;
            width:15%;
            height:30px;
            background: #3c9df9;
            height: 30px;
            color: #FFF;
            font-size: 14px;
            text-align: center;
            border: 2px solid #3c9df9;
            cursor: pointer;
            
        }
        .input2:hover{
            background: #008af5;
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
<div class="aa" id="div1" style="display: none">
  <div class="search">
  <form action="${rootPath}cook/orderCenter_Serach" method="post"  onsubmit="return check()">
    <input type="text" class="input1" name="input" placeholder="请输入数据 ">
    <button class="input2"  >搜&nbsp;索</button>
    </form>
 </div>
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
             <td width="170">订单时间</td>
             <td>厨师编号</td>
             <td>厨师名称</td>
             <td >备注</td>
             <td>处理订单</td>
             <td>详情</td>
          </tr>
       <c:forEach items="${paCut.data}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.total}</td>
	                <td>${item.status}</td>
	                <td>${item.createDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	               <td style="width:130px;height:10px"><textarea readonly="readonly" style="width:100%;height:105%">${item.remark}</textarea></td>
	                 <td><c:if test="${item.status eq '已付款'}">已完成</c:if>
	                 <c:if test="${item.status eq '未处理'}"><a href="${rootPath}cook/orderCenter_DoOrder?Orderid=${item.id}&tableId=${item.tableId}">处理订单</a></c:if>
	                 <c:if test="${item.status eq '处理中'}">处理中</c:if>
	                  <c:if test="${item.status eq '未付款'}">未付款</c:if>
	                 </td>
	                  <td><a href="${rootPath}cook/orderCenter_check?Orderid=${item.id}">详情</a></td>
	            </tr>  
        	</c:forEach>
        </tbody>
    </table>
         <div class="pag">
         <ul class="pagination">
                   <li><a href="?page=${paCut.prePage}&Orderid=${paCut.data[0].id}">上一页</a></li>
 						<c:forEach var="i" 
							begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
 							end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
 									<li class="active"><a 
 										href="?page=${i}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != paCut.currentPage &&i<=3}"> 
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