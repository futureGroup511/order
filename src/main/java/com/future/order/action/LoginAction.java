package com.future.order.action;


import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.MenuType;
import com.future.order.entity.Restaurant;
import com.future.order.entity.User;

public class LoginAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user; 
	private String randStr;
	
	@Override
	public String execute() throws Exception {
//		String vCode=(String) session.get("randStr");
//		session.remove("randStr");
//		if(!vCode.equals(randStr)){
//			request.put("loginMeg", "验证码错误");
//			return "login";
//		}
		User userDataBase;
		if(user!=null){
			userDataBase = userService.login(user.getPhone(),user.getPassword());
			if(userDataBase!=null){	
				session.put("userIndex", userDataBase);	//只在首页使用，因上user与action中重名，不可用
				List<MenuType> list=menuTypeService.getAllMenuType();
				List<Ingredient> list1 = ingerdientService.getAll();
				Restaurant restaurants=restaurantService.SelectAll();
				session.put("restlist",restaurants);	//将配料放进session
				session.put("Ientlist",list1);	//将配料放进session
				if(userDataBase.getSort().equals("cook")){
					session.put("cook", userDataBase);//将用户对象放进session
//					session.put("userSort", "cook");	//将用户身份放进session
					return "cook";
				} else if(userDataBase.getSort().equals("manager")) {
					session.put("manager", userDataBase);//将用户对象放进session
//					session.put("userSort", "manager");
					return "manager";
				} else {
					session.put("cashier", userDataBase);
					return "cashier";		//添加收银员
				}
			} else{
				request.put("loginMeg", "用户名和密码输入错误");
			} 
		}
		return "login";
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	public String getRandStr() {
		return randStr;
	}

	public void setRandStr(String randStr) {
		this.randStr = randStr;
	}

}
