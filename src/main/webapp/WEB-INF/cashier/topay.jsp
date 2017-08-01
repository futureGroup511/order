<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/topay.css">
</head>
<script type="text/javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${detailslist}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
}
}
 function SumNum() {
	 var sumValue = 0;
	 var total=document.getElementById("total").value;
	 var discount=document.getElementById("discount").value;
	 var straightCut= document.getElementById("straightCut").value;
	 sumValue =total*discount-straightCut;
	 sumValue= sumValue.toFixed(2);
	 self['price'].value =sumValue;
    }
</script>
<body style="background: url(${rootPath}/images/m-91.jpg);">
<center><div style="font-weight: bold;margin-top:2%;">${mark}</div></center>
<c:if test="${order ne null}">
	<div class="orderdetailes" id="div1">
       <table  cellspacing="0"border="1">
         <thead>
          <tr>
             <td colspan="3" style="height:45px;background-color: #E8E7E3;">订单详细信息</td>
          </tr>   
         </thead>
         <tbody>
	          <tr class="bg_color">
	             <td>菜品名称</td>
	             <td>数量</td>
	             <td>单价(元)</td>
	           </tr>
           <c:forEach items="${detailslist}" var="item">  
	           <tr class="bg_color">
	             <td>${item.menuName}</td>
	             <td>${item.menuNum}</td>
	             <td>${item.price}</td>
	           </tr>  
           </c:forEach>          
         </tbody>
     </table>      
    </div>
	<div class="wall" id="div2">
		<form action="${rootPath}manage/OrderAction_pay">
			<input type="hidden" name="orders.id" value="${order.id}">
	        <table cellspacing="0">
	        	<tr style="height:50px;">
	        		 <td class="bor1"><p>支付方式:</p></td>
	        		 <td><select name="orders.payway" class="select"> 
				 	 <c:forEach items="${paylist}" var="item">
				 	      <option value="${item.ways}">${item.ways}</option> 
				     </c:forEach> 
				 	 </select></td>
	        	</tr>
	            <tr style="height:50px;">
	                <td class="bor1"><p>订单金额(元) :</p></td>
	                <td><input type="text" value="${order.total}" id="total" readonly="readonly" ></td>
	            </tr>
	            <tr style="height:50px;">
	                <td class="bor1"><p>打<span style="margin-left:37px;">折</span> :</p></td>
	                <td><input type="text" id="discount"  name="discount" placeholder="输入小数,不打折为1" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();	"></td>
	            </tr>
	            <tr style="height:50px;">
	                <td class="bor1"><p>直减(元) :</p></td>
	                <td><input type="text" id="straightCut" name="straightCut" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"></td>
	            </tr>
	            <tr style="height:50px;">
	            	<td class="bor1"><p>合<span style="margin-left:37px;">计</span> :</td>
	            	<td><input type="text" id="price" name="price" ></td>
	            </tr>
	            <tr style="height:50px;">
	                <td class="bor1"><p>实收(元) :</p></td>
	                <td><input type="text" name="pay" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''" required="required"></td>
	            </tr>
	            <tr style="height:50px;">
	               <td colspan="2">
	                   <button>确认收款</button>
	               </td>
	            </tr>
	        </table>
        </form>
    </div>
    </c:if>
</body>
</html>