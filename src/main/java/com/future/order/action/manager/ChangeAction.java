package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;

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
	//转发到管理用户界面，查询出所有用户
	public String managerUser() {	
		List<User> list = userService.selectAllUser();
		request.put("allUser", list);
		return "managerUser";
	}
	//配料模块中转站
	public String addIngredient(){
		return "addIngredient";
	}
	
}
