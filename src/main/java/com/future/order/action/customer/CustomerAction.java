package com.future.order.action.customer;


import java.util.List;

import com.future.order.base.BaseAction;

import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.MenuType;
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
	private String name;
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
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getMenuType() throws Exception{
		List<MenuType> list=menuTypeService.getAllMenuType();
		request.put("list",list);
		List<Menu> list1=menuService.getAll();
		request.put("menu1",list1);
		return "getMenuType";
	}
	
	public String getOrder() throws Exception {
		List<Order> list=orderService.getAll();
		request.put("order",list);
		return "getOrder";
	}

	
	public String ByName() throws Exception{
		List<Menu> menu=menuService.ByName(name);
		request.put("menu",menu);
		return "ByName";
	}
	public String menu() throws Exception {				
		Menu menu=menuService.get(id);
		List<MenuMaterial> list=menuMaterialService.getByMenuId(id);
		request.put("menu",menu);
		request.put("list",list);
		return "menu";
	}
	
	public String StockDetails() throws Exception {
		List<StockDetails> list1=stockDetailsService.getBycreateDate(ingId);
		request.put("list1",list1);
		return "StockDetails";
	}

}
