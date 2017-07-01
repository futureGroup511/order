package com.future.order.action.customer;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.ShopCart;
import com.future.order.util.PageCut;
/**
 * 
 * @author 金高
 *
 */
public class ShopCartAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ShopCart shopCart;
	private int page = 1;
	private String msg;
	
	@Override//得到所有的加入购物车中的菜
	public String execute() throws Exception {
		sum();
		return SUCCESS;
	}
	
	//删除购物车中的菜
	public String deleteShopCart() throws Exception{
		boolean boo = shopCartService.deleteShopCart(shopCart);
		sum();
		return "deleteShopCart";
	}
	
	//更改菜的数量
	public String updateNum(){
		boolean boo = shopCartService.updeteNum(shopCart.getId(), msg);
		sum();
		return "updateNum";
	}
	
	//提交购物车中的菜并清空购物车
	public String submitToOrder(){
		int tableId = (int)session.get("userId");
		boolean boo = shopCartService.submitToOrder(tableId);
		return "";
	}
	
	//得到全部添加到购物车中的菜，并计算总价
	public void sum(){
		int tableId = (int)session.get("userId");
		List<ShopCart>  list = shopCartService.getByTableId(tableId);
 		request.put("ShopCart", list);
		int sum = 0;
		if(list!=null){
			for(int i=0;i<list.size();i++){
				sum +=list.get(i).getPrice();
			}
		}
		request.put("sum", sum);
	}
	
	public ShopCart getShopCart() {
		return shopCart;
	}

	public void setShopCart(ShopCart shopCart) {
		this.shopCart = shopCart;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}


}
 