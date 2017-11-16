package com.future.order.action.cook;
import java.io.UnsupportedEncodingException;

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
	private String msg;
	private int sex;
	
	public String viewUser(){
		User users=(User) session.get("cook");
		int id=users.getId();
		User user=userService.viewUser(id);
		request.put("myself", user);
		return "viewUser";
	}
	public String updateUser() throws UnsupportedEncodingException{
		User users=(User) session.get("cook");
		if(msg!=null){
			msg = new String(msg.getBytes("ISO-8859-1"), "UTF-8");	
			request.put("updateUserMsg",msg );
		}
		request.put("user", users);
		return "Updateuser";
	}
	 // 确认修改信息,修改个人资料  张金高加
	public String updateMe() {
		User userUpdate = (User) session.get("cook");
		User userData = userService.viewUser(userUpdate.getId());
		boolean boo = false;
		String msg = "修改失败";
		if(userData!=null&&!userData.getPhone().equals(user.getPhone())){
			User userCheckPhone = userService.selectByPhone(user.getPhone());
			msg = "修改失败，该手机号已被用于注册";
			if(userCheckPhone==null){
				boo = true;
				msg = "修改失败";
			}
		}else {
			boo = true;
		}
		if(boo){
			userUpdate.setName(user.getName());
			userUpdate.setPhone(user.getPhone());
			userUpdate.setPassword(user.getPassword());
			boo = userService.updateUser(userUpdate);			
		}
		if (boo) {
			msg = "修改成功";
			session.put("cook", userUpdate);
		}
		request.put("updateUserMsg", msg);
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
	public final String getMsg() {
		return msg;
	}
	public final void setMsg(String msg) {
		this.msg = msg;
	}
	
}
