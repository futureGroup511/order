package com.future.order.action.manager;


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
	private int userId;	//得到前台的传来的id
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

	public String toUpdateUser(){	//到修改界面，查询出所修改用户信息
		
		return "updateUser";
	}
	
	public String updateUser(){
		
		return "updateUser";
	}

	public User getUser() {
		System.out.println(user);
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
