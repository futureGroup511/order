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
	
	public String managerUser() {
		System.out.println("查询出来所有用户");
		List<User> list = userService.selectAllUser();
		request.put("allUser", list);
		return "managerUser";
	}
	
}