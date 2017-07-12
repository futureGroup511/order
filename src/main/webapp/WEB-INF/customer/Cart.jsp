<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<script type="text/javascript">
    $(function(){
        //1. 注册事件
        $(".text").change(function(){
        //2. 验证数据的有效性
            var menuNum = this.value; //也可以使用$(this).val();
            //isNaN(number)表示若number不是数字就返回真
            if(!isNaN(menuNum) && parseInt(menuNum)==menuNum && menuNum>0){ 
                //如果合法，同步更新的数
                $(this).attr("lang", menuNum);
                //找到当前标签中第一个是tr的父节点，然后拿到属性为lang的值，也就是商品的id
                var pid = $(this).parents("tr:first").attr("lang");
                //发送Ajax请求，传输当前的数量与商品的id，返回修改数量后的总价格
                $.post("Cart_updateCart.action", 
                    {menuNum:menuNum, 'id':pid},
                    function(total){        
                        $("#total").html(total); //所有商品小计
                       
        
                }, "text");
                //计算单个商品的小计，保留两位小数
                var price = ($(this).parent().prev().html()*menuNum).toFixed(2);
                $(this).parent().next().html(price);
            } else {
                //如果非法，还原为刚刚合法的数
                this.value = $(this).attr("lang");
            }
        })
    })
</script>
</head>
<body>
<div class="section_container">
    <!-- 购物车 -->
    <div id="shopping_cart">
        <div class="message success">我的购物车</div>
            <table class="data-table cart-table" cellpadding="0" cellspacing="0">
                <tr>
                    <th class="align_center" width="10%">商品编号</th>
                    <th class="align_center" width="10%">餐桌名称</th>
                    <th class="align_left" width="35%" colspan="2">商品名称</th>
                    <th class="align_center" width="10%">销售价格</th>
                    <th class="align_center" width="20%">数量</th>
                    <th class="align_center" width="15%">小计</th>
                    <th class="align_center" width="10%">删除</th>
                </tr>
                <c:forEach items="${sessionScope.shopCarts}" var="sorder" varStatus="num">
                <tr lang="${shopCarts.id}">
                    <td class="align_center"><a href="#" class="edit">${num.count }</a></td>
                    <td class="align_center"><a href="#" class="edit">${sorder.tableName}</a></td>
                    <td class="align_left"><a href="#" class="edit">${sorder.menuName}</a></td>
                    <td class="align_left"><a class="pr_name" href="#">${sorder.menuNum}</a></td>
                    <td class="align_center vline">${sorder.price }</td>
                    <td class="align_center vline">
                        <!-- 文本框 -->
                        <input class="text" style="height: 20px;" value="${sorder.menuNum }" lang="${sorder.menuNum }">        
                    </td>
                    <td class="align_center vline">${sorder.price*sorder.menuNum }</td>
                    <td class="align_center vline"><a href="#" class="remove"></a></td>
                </tr>
                </c:forEach>

            </table>
            <!-- 结算 -->
            <div class="totals">
                <table id="totals-table">
                    <tbody>
                        <tr>
                            <td width="60%" colspan="1" class="align_left"><strong>小计</strong></td>
                            <td class="align_right" style=""><strong>￥<span
                                        class="price" id="total">${sessionScope.forder.total}</span>
                            </strong></td>
                        </tr>
                        <tr>
                            <td width="60%" colspan="1" class="align_left total"><strong>总计</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
</div>
</body>
</html>