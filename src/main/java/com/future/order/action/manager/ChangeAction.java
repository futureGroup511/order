package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.MenuType;
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
	//菜品模块中转站
	public String addMenu(){
		return "addMenu";
	}
	//获得个人资料
	public String getMyself(){
		return "getMyself";
	}
	//退出登录前,防倒退
	public String logOff(){
		return "logOff";
	}
	//退出登录
	public String out(){
		return "out";
	}
	public String addStocks(){
		return "addstock";
	}
}
