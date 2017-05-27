package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;

public class UserManagerAction extends BaseAction {

	private User user;

	public String addUser() {
		System.out.println(user);
		request.put("addMsg", "添加成功");
		return "addUser";
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
