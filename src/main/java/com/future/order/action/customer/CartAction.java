package com.future.order.action.customer;

import java.util.*;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.ShopCart;

/**
 * @author 安李杰
 *
 */
/**
 * 
 *
 */
public class CartAction extends BaseAction{

	/**
	 * 对购物车进行操作
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	//获得购物车菜品
	public String getCart() throws Exception{
		System.out.println("**************");
		int tableId=(int) session.get("userId");
		List<ShopCart> shopCarts=shopCartService.getByTableId(tableId);
		double total = 0.0;
		for(ShopCart item:shopCarts){
			total += item.getMenuNum() * item.getPrice();
		}
		for(ShopCart item:shopCarts){
			OrderDetails orderDetails=new OrderDetails();
			orderDetails.setTableName(item.getTableName());
			orderDetails.setMenuName(item.getMenuName());
			orderDetails.setMenuNum(item.getMenuNum());
			orderDetails.setTableId(item.getTableId());
			Boolean bool=orderDetailsService.save(orderDetails);
			System.out.println(orderDetails);
		}
		System.out.println(total);
		request.put("total",total);
		request.put("shopCarts", shopCarts);
		System.out.println(shopCarts);
		return "getCart";
	}
	//购物车的菜品数量update
	public String updateCart() throws Exception{
		
		return "updateCart";
	}

	//删除购物车的菜品
	public String deleteCart() throws Exception{
		int tableId=(int) session.get("userId");
		boolean bool=shopCartService.delete(id);
		boolean bool1=orderService.deleteOrder(tableId);
		return "deleteCart";
	}
	//查询订单
	public String getOrder() throws Exception{
		int tableId=(int) session.get("userId");
		List<Order> order=orderService.getFinal(tableId,1);
		
		request.put("order",order);
		return "getOrder";
	}
	//查询订单详情
	public String getOrderDetails() throws Exception{
		int tableId=(int) session.get("userId");
		List<OrderDetails> orderDetails=orderDetailsService.getDetails(tableId);
		request.put("orderDetails",orderDetails);
		return "getOrderDetails";
	}
	
	
	//菜品数量的增加
	public String add() throws Exception{
		ShopCart shopCart=shopCartService.getOne(id);
		shopCart.setMenuNum(shopCart.getMenuNum()+1);
		Boolean bool=shopCartService.update(shopCart);
		List<ShopCart> shopCarts=shopCartService.getByAll();
		request.put("shopCarts", shopCarts);
		return "add";
	}
	//菜品数量的减少
	public String reduce() throws Exception{
		ShopCart shopCart=shopCartService.getOne(id);
		if(shopCart.getMenuNum()>=1){
			shopCart.setMenuNum(shopCart.getMenuNum()-1);
		}/*else{
			
		}*/
		Boolean bool=shopCartService.update(shopCart);
		List<ShopCart> shopCarts=shopCartService.getByAll();
		request.put("shopCarts", shopCarts);
		return "reduce";
	}
	/*public String delete() throws Exception{
		List<ShopCart> shopcart=shopCartService.deleteA(shopcart);
		return null;
	}*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
