package com.future.order.action.manager;


import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.dao.UserDao;
import com.future.order.entity.User;
/**
 * 
 * @author 金高
 *
 */
public class UserManagerAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 
	 */
	private User user;
	private int userId;	//得到前台的传来的id
	
	public String addUser() {
		boolean boo = userService.addUser(user);
		if(boo){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！该账号已被使用");
		}
		return "addUser";
	}

	public String toUpdateUser(){	//到修改界面，查询出所修改用户信息
		User user = userService.viewUser(userId);
		request.put("updateUser", user);
		return "updateUser";
	}
	
	public String updateUser(){	//确认修改信息
		boolean boo = userService.updateUser(user);
		if(boo){
			request.put("updateUserMsg", "修改成功");
		} else {
			request.put("updateUserMsg", "修改失败");
		}
		int tempId = user.getId();
		User user = userService.viewUser(tempId);
		request.put("updateUser", user);
		return "updateUser";
	}

	public String deleteUser() {	//删除该用户，并查询出生于用户
		boolean boo = userService.deleteUser(user);
		if(boo){
			request.put("deleteUserMsg", "删除成功");
		} else {
			request.put("deleteUserMsg", "删除失败");
		}
		List<User> list = userService.selectAllUser();
		request.put("allUser", list);
		return "deleteUser";
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
