package com.future.order.action.manager;

import java.util.Date;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;

/**
 * 
 * @author 金高
 *
 */
public class ChangeAction extends BaseAction{
	
	private Date starttime;
	private Date endtime;
	private String sort;
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
	//餐桌中转站
	public String addTable(){
		return "addTable";
	}
	//饭店中转站
	public String addRest(){
		return "addrest";
	}
	//获得个人资料
	public String getMyself(){
		if(sort!=null&&sort.equals("cashier")){
			User cashier = (User)session.get("cashier");
			request.put("user", cashier);
		} else {
			User user = (User)session.get("manager");
			request.put("user", user);
		}
		return "getMyself";
	}

	//退出登录前,防倒退
	public String logOff(){
		return "logOff";
	}
	//退出登录
	public String out(){
		session.remove("user");//清除session中得user
		return "out";
	}
	//域名管理，添加ip
	public String addIp(){
		return "addIp";
	}
	public String addStocks(){
		return "addstock";
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

}
