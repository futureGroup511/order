package com.future.order.action.customer;

import java.util.List;

import com.future.order.base.BaseAction;
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
		
		return "deleteCart";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	
	
}
