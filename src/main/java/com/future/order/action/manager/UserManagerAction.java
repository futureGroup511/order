package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;

public class UserManagerAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private User user;

	public String addUser() {
		boolean boo = userService.addUser(user);
		if(boo){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！该账号已被使用");
		}
		return "addUser";
	}
	
	
	
	public User getUser() {
		System.out.println("userINFo"+user);
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
