package com.future.order.action;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;

public class LoginAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user;

	public String login(){
		return "";
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
}
