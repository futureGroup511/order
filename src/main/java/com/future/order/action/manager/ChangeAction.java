package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.User;
import com.future.order.util.PageCut;

/**
 * 
 * @author 金高
 *
 */
public class ChangeAction extends BaseAction{
	
	//用户模块中转站
	public String addUser() {	
		return "addUser";
	}
	//配料模块中转站
	public String addIngredient(){
		return "addIngredient";
	}
	public String addStocks(){
		return "addstock";
		
	}
}
