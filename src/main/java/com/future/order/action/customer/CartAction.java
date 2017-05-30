package com.future.order.action.customer;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Menu;
import com.future.order.entity.ShopCart;


/**
 * @author 安李杰
 *
 */
/**
 * @author zbjd
 *
 */
/**
 * @author zbjd
 *
 */
public class CartAction extends BaseAction{

	/**
	 * 对购物车进行操作
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int num;
	private ShopCart shopcart;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
	public ShopCart getShopcart() {
		return shopcart;
	}

	public void setShopcart(ShopCart shopcart) {
		this.shopcart = shopcart;
	}

	public String addcart() throws Exception{
		Menu menu=menuService.get(id);
		request.put("menu",menu);
		return "addcart";
	}
	public String add() throws Exception{
		
		return null;
	}
	public String selectAll() throws Exception{
		List<ShopCart> shopcart=shopCartService.getAll();
		request.put("shopcart",shopcart);
		return "selectAll";
		
	}
	//根据id删除一条信息
	public String delete() throws Exception{
		boolean bool=shopCartService.delete(id);
		if(bool==true){
			request.put("meg", "添加成功");//这是从action的RequestAware获得的request，只有put，get方法
		}else{
			request.put("meg", "添加失败");
		}
		return "delete";
	}
	//清空购物车
	public String deleteAll() throws Exception{
		boolean bool=shopCartService.deleteAll(shopcart);
		if(bool==true){
			request.put("meg", "添加成功");//这是从action的RequestAware获得的request，只有put，get方法
		}else{
			request.put("meg", "添加失败");
		}
		return "deleteAll";
	}
}
