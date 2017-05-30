/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 上午10:28:23   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.User;
import com.future.order.util.PageCut;

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
	//wqj查询子用户
	public User viewUser( int id);
	//修改
	public boolean updateUser(User user);
	//删除
	public boolean deleteUser(User user);
	//分页
	public PageCut<User> getPageCut(int curr,int pageSize);

}
