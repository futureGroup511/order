package com.future.order.action.manager;

import com.future.order.base.BaseAction;
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
	public String addMenuType(){
		return "addMenuType";
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
