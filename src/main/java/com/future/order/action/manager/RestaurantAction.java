package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Restaurant;

@SuppressWarnings("serial")
public class RestaurantAction extends BaseAction {
	private Restaurant restaurant;
	private Restaurant rest;
	public String execute(){
		@SuppressWarnings("unused")
		Restaurant restaurants=restaurantService.SelectAll();
		request.put("restaurants", restaurants);
		return "check";
	}
	public String toUpdate(){
		Restaurant restaurantss=restaurantService.SelectAll();
		request.put("rest", restaurantss);
		return "update";		
	}
	public String Update(){
		boolean sign = restaurantService.updateRestaurant(rest);
		if(sign){
			request.put("addrest", "修改成功");
		}else{
			request.put("addrest", "修改失败");
		}	
		return execute();	
	}
	public String AddRestaurant(){
		int count=restaurantService.Select();
		if(count==0){
			boolean sign = restaurantService.addRestaurant(restaurant);
				request.put("addrest", "添加成功");
		}else{
			request.put("addrest", "已经添加过餐厅，只能修改٩(๑❛ᴗ❛๑)۶٩(๑❛ᴗ❛๑)۶");
		}
		return "add";		
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}
	public Restaurant getRest() {
		return rest;
	}
	public void setRest(Restaurant rest) {
		this.rest = rest;
	}
	
}
