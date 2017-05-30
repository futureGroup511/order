package com.future.order.action.customer;


import java.util.List;


import com.future.order.base.BaseAction;

import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.Order;
import com.future.order.entity.StockDetails;

/**
 * @author 安李杰 
 *
 */
public class CustomerAction extends BaseAction {

	/**这里写了用于对于菜单的信息显示获取菜单的详细信息的action
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int id;
	private int ingId;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	public int getIngId() {
		return ingId;
	}

	public void setIngId(int ingId) {
		this.ingId = ingId;
	}

	public String getMenuMaterial() throws Exception {
		List<MenuMaterial> list=menuMaterialService.getAll();
		request.put("MenuMaterial",list);
		System.out.println(list);
		return "getMenuMaterial";
	}
	
	
	public String getMenu() throws Exception {
		List<Menu> list=menuService.getAll();
		request.put("menu",list);
		System.out.println(list);
		return "getMenu";
	}
	
	public String getOrder() throws Exception {
		List<Order> list=orderService.getAll();
		request.put("order",list);
		return "getOrder";
	}
	public String menu() throws Exception {				
		Menu menu=menuService.get(id);		
		List<MenuMaterial> list=menuMaterialService.getByMenuId(id);
		/*List<StockDetails> list1=stockDetailsService.getBycreateDate(ingId);*/
		request.put("menu",menu);
		request.put("list",list);
		/*request.put("list1",list1);*/
		return "menu";
	}
	public String StockDetails() throws Exception {
		/*List<StockDetails> s=stockDetailsService.getAll();
		request.put("StockDetails",s);*/
		List<StockDetails> list1=stockDetailsService.getBycreateDate(ingId);
		request.put("list1",list1);
		return "StockDetails";
	}
	
	
}
