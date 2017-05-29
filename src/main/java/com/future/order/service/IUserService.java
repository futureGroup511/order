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
<<<<<<< Updated upstream
	
	//登录
	public User login(String phone,String pasword);
	//添加用户
	public boolean addUser(User user);
	//查询用户
	public List<User> selectAllUser();
=======
	public boolean add(User user);//把User这个实体类作为参数传进方法里来；只定义接口中方法由模型层调用。
>>>>>>> Stashed changes
}
