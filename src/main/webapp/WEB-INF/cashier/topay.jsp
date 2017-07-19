<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
/* 		border-color:#C6C6C6; */
		background-color: white; 
	}
	.td{
		width: 200px;
	}
	td{
		border:solid;
		height:40px;
		border-color:#C6C6C6;
	}
	input {
	height: 40px;
}
</style>
</head>
<body style="background: url(${rootPath}/images/m-91.jpg);">
	<div style="margin-left: 35%;">
		<form action="${rootPath}manage/OrderAction_Pay">
			<input type="hidden" name="orders.id" value="${order.id}">
			<table>
				<tr>
					<td class="td">订单金额(元)：</td>
					<td>${order.total}</td>
				</tr>
				<tr>
					<td>打折：</td>
					<td><input type="text" name="discount" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : '';"></td>
				</tr>
				<tr>	
					<td>直减(元)：</td>
					<td><input type="text" name="straightCut" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"></td>
				</tr>
				<tr>
					<td>实收(元)：</td>
					<td><input type="text" name="pay" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"></td>	
				</tr>
				<tr>	
					<td colspan="2" align="center"><input type="submit" value="确认付款"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>