package com.future.order.action.manager;

import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.MenuType;
import com.future.order.entity.User;

/**
 * 
 * @author 金高
 *
 */
public class ChangeAction extends BaseAction{
	
	private Date starttime;//获得查询的开始时间
	private Date endtime;//获得查询的截止时间
	private String sort;//获得用户的身份
	public String add(){
		return "add";
	}
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
		List<MenuType> list=menuTypeService.getAllMenuType();
		request.put("Typelist",list);
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
		User user = null;
		if(sort.equals("cashier")){
			user = (User)session.get("cashier");
		} else if(sort.equals("manager")) {
			user = (User)session.get("manager");
		} 
		request.put("user", user);
		return "getMyself";
	}

	//退出登录前,防倒退
	public String logOff(){
		request.put("sort", sort);
		return "logOff";
	}
	//退出登录
	public String out(){
		if(sort.equals("manager")){
			session.remove("manager");//清除session中得user	
		} else if(sort.equals("cashier")){
			session.remove("cashier");
		} 
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
