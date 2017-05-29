/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 上午10:28:23   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.User;

/**
 * @author Administrator
 *
 */
public interface IUserService {
	
	//登录
	public User login(String phone,String pasword);
	//添加用户
	public boolean addUser(User user);
	//查询用户
	public List<User> selectAllUser();
}
