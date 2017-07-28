<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/topay.css">
</head>
<script type="text/javascript">
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
	<div class="wall">
		<form action="${rootPath}manage/OrderAction_pay">
			<input type="hidden" name="orders.id" value="${order.id}">
	        <table cellspacing="0">
	            <tr>
	                <td class="bor1"><p>订单金额(元) :</p></td>
	                <td><input type="text" value="${order.total}" id="total" readonly="readonly" ></td>
	            </tr>
	            <tr>
	                <td class="bor1"><p>打<span style="margin-left:37px;">折</span> :</p></td>
	                <td><input type="text" id="discount"  name="discount" placeholder="输入小数,不打折为1" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();	"></td>
	            </tr>
	            <tr>
	                <td class="bor1"><p>直减(元) :</p></td>
	                <td><input type="text" id="straightCut" name="straightCut" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"></td>
	            </tr>
	            <tr>
	            	<td class="bor1"><p>合<span style="margin-left:37px;">计</span> :</td>
	            	<td><input type="text" id="price" name="price" ></td>
	            </tr>
	            <tr>
	                <td class="bor1"><p>实收(元) :</p></td>
	                <td><input type="text" name="pay" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''" required="required"></td>
	            </tr>
	            <tr>
	               <td colspan="2">
	                   <button>确认收款</button>
	               </td>
	            </tr>
	        </table>
        </form>
    </div>
</body>
</html>