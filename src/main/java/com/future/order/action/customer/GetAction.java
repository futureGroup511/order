package com.future.order.action.customer;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.Order;

public class GetAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int id;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	/*
	public String getIngredient() throws Exception {
		List<Ingredient> list=ingerdientService.getAll();
		request.put("ingredient",list);
		return "getIngredient";
	}
	
	public String cart() throws Exception {
		Menu menu=menuService.get(id);
		request.put("menu",menu);
		return "cart";
	}
	*/
	public String getOrder() throws Exception {
		List<Order> list=orderService.getAll();
		request.put("order",list);
		return "getOrder";
	}
	public String menu() throws Exception {
		Menu menu=menuService.get(id);
		request.put("menu",menu);
		return "menu";
	}
	public String MenuMaterial() throws Exception {
		MenuMaterial menumaterial=menuMaterialService.get(id);
		request.put("menumaterial",menumaterial);
		return "MenuMaterial";
	}
	public String ingredient() throws Exception {
		Ingredient ingredient=ingerdientService.get(id);
		request.put("ingredient",ingredient);
		return "ingredient";
	}
	
	
}
