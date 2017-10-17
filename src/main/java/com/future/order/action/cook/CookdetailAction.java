package com.future.order.action.cook;
import com.future.order.base.BaseAction;
import com.future.order.entity.User;

/**
* @author by王青杰
* @version 创建时间：2017年5月29日 上午9:01:48
* 类说明
*/
public class CookdetailAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private int sex;
	
	public String viewUser(){
		User users=(User) session.get("cook");
		int id=users.getId();
		User user=userService.viewUser(id);
		request.put("myself", user);
		return "viewUser";
	}
	public String updateUser(){
		User users=(User) session.get("cook");
		request.put("user", users);
		return "Updateuser";
	}
	 // 确认修改信息,修改个人资料  张金高加
	public String updateMe() {
		User userUpdate = (User) session.get("cook");
		userUpdate.setName(user.getName());
		userUpdate.setPhone(user.getPhone());
		userUpdate.setPassword(user.getPassword());
		boolean boo = userService.updateUser(userUpdate);
		if (boo) {
			request.put("updateUserMsg", "修改成功");
		} else {
			request.put("updateUserMsg", "修改失败");
		}
		User userData = userService.viewUser(userUpdate.getId());
		session.put("cook", userData);
		return "toUpdateMyself";
	}
	public String logOff(){
		System.out.println("logoff");
		return "logOff";
	}
	public String out(){
		session.remove("cook");
		return "out";
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public final int getSex() {
		return sex;
	}
	public final void setSex(int sex) {
		this.sex = sex;
	}
	
}
