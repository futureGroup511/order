package com.future.order.action.cook;
import com.future.order.base.BaseAction;
import com.future.order.entity.User;

/**
* @author by王青杰
* @version 创建时间：2017年5月29日 上午9:01:48
* 类说明
*/
public class CookdetailAction extends BaseAction{
	private User user;
	public String viewUser(){
		User users=(User) session.get("user");
		int id=users.getId();
		User user=userService.viewUser(id);
		System.out.println(user);
		request.put("myself", user);
		return "viewUser";
	}
	public String updateUser(){
		User users=(User) session.get("user");
		boolean user=userService.updateUser(users);
		request.put("updateUser", users);
		return "Updateuser";
	}
}
