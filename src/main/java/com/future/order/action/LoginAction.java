package com.future.order.action;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.future.order.base.BaseAction;
import com.future.order.dao.UserDao;
import com.future.order.entity.User;
import com.future.order.service.IUserService;

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
		User userDataBase = userService.login(user.getPhone(),user.getPassword());
		if(userDataBase!=null){
			session.put("userId", userDataBase.getPhone());//将账号存进session
			if(userDataBase.getSort().equals("cook")){
				session.put("userSort", "cook");	//将用户身份放进session
				return "cook";
			} else {
				session.put("userSort", "manager");
				return "manager";
			}
		} else{
			request.put("loginMeg", "用户名和密码输入错误");
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
		System.out.println("getrandStr"+randStr);
		return randStr;
	}

	public void setRandStr(String randStr) {
		this.randStr = randStr;
	}


}
