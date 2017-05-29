package com.future.order.action;

import java.util.List;
import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Order;

public class TestGetAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Ingredient ingredient;
	private int id;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Ingredient getIngredient() {
		return ingredient;
	}

	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}
	
	public String toGetUser() throws Exception {
		
		return "toGetUser";
	
	}
	public String getUser() throws Exception {
		List<Ingredient> list=ingerdientService.getAll();
		request.put("ingredient",list);
		return "getUser";
	}
	
	public String cart() throws Exception {
		Ingredient  ingredient=ingerdientService.get(id);
		request.put("ingredient",ingredient);
		System.out.println("9874561230");
		return "cart";
	}
	
	public String orderUser() throws Exception {
		List<Order> list=orderService.getAll();
		request.put("order",list);
		return "orderUser";
	}
}
