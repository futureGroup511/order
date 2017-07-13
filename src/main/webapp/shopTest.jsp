<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
    <li>
    <input type="button" value="-" />
    <span>0</span>件
    <input type="button" value="+" />
    单价:<span>128元</span>
    小计:<span>0元</span>
  </li>
    <li>
    <input type="button" value="-" />
    <span>0</span>件
    <input type="button" value="+" />
    单价:<span>68元</span>
    小计:<span>0元</span>
  </li>
    <li>
    <input type="button" value="-" />
    <span>0</span>件
    <input type="button" value="+" />
    单价:<span>88元</span>
    小计:<span>0元</span>
  </li>
    <li>
    <input type="button" value="-" />
    <span>0</span>件
    <input type="button" value="+" />
    单价:<span>58元</span>
    小计:<span>0元</span>
  </li>
  <li>
    <input type="button" value="-" />
    <span>0</span>件
    <input type="button" value="+" />
    单价:<span>108元</span>
    小计:<span>0元</span>
  </li>
</ul>

<p>一共购买了<em>0</em>件商品，总计:<strong>0</strong>元，其中最贵的商品价格是<em>0</em>元。</p>

</body>
</html>

<script>
    var oUl=document.getElementsByTagName('ul')[0];
    var aLi=oUl.getElementsByTagName('li');
    var aEm=document.getElementsByTagName('em');
    var oStrong=document.getElementsByTagName('strong')[0];
    var total=0;
    var countprice=0;
    var max=0;
    for (var i = 0; i < aLi.length; i++) {
        shop(aLi[i]);
    };

    function shop(obj){
        var aInp=obj.getElementsByTagName('input');
        var aSpan=obj.getElementsByTagName('span');
        var num=parseInt(aSpan[0].innerHTML);
        var price=parseFloat(aSpan[1].innerHTML);
        aInp[0].onclick=function(){
            if(num<=0)return;
            num--;
            aSpan[0].innerHTML=num;
            aSpan[2].innerHTML=num*price+'元';
            total--;
            countprice-=price;
            aEm[0].innerHTML=total;
            oStrong.innerHTML=countprice;
            setmax();


        }
        aInp[1].onclick=function(){
            num++;
            aSpan[0].innerHTML=num;
            aSpan[2].innerHTML=num*price+'元';
            total++;
            countprice+=price;
            aEm[0].innerHTML=total;
            oStrong.innerHTML=countprice;
            setmax();
        }

    }
    function setmax(){
        max=0;
       for (var i = 0; i < aLi.length; i++) {
            var aSpan=aLi[i].getElementsByTagName('span');
            if(aSpan[0].innerHTML>0){
                if(max<parseFloat(aSpan[1].innerHTML)){
                    max=parseFloat(aSpan[1].innerHTML);
                }
            }
        aEm[1].innerHTML=max;
    }
        
    

}

/*

要求:

    1，点击加减可以添加或者减少商品件数。

    2，增加或减少商品件数同时要计算出当前商品的小计。

    3，统计所有商品的总价。

    4，找出已购买商品中最贵的那件商品。


*/


</script>
