package com.future.order.action.manager;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;
import com.future.order.util.PageCut;
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
	private int page=1;
	private String inquiry;//得到查询的内容
	private String ask;	//得到请求查询的条件
	
	public String execute(){
		
		if(ask==null){
			ask = (String)session.get("ask");
		}
		if(inquiry==null){
			inquiry = (String) session.get("inquiry");
		}
		PageCut<User> pCut=userService.getPageCut(page,6,ask,inquiry);
		request.put("allUser", pCut);
		if(pCut.getData().size()==0){
			String mark="没有其他用户哦(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("deleteUserMsg", mark);
		}
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return SUCCESS;
	}
	
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
		return "toUpdateUser";
	}
	
	public String updateUser() {	//确认修改信息,修改个人资料
		boolean boo = userService.updateUser(user);
		String result = "updateUser";
		if(boo){
			request.put("updateUserMsg", "修改成功");
		} else {
			request.put("updateUserMsg", "修改失败");
		}
		User users = (User)session.get("user");
		if(users.getId()==user.getId()){	//当修改的是自己本人的时候，将修改后信息存入session
			User userData = userService.viewUser(user.getId());
			System.out.println("userManager示例2："+userData.getCreateDate());
			session.put("user", userData);
		}
		if(userId==2){		//当执行修改个人信息时在个人资料界面时
			result = "toUpdateMyself";
		} else {
			PageCut<User> pCut=userService.getPageCut(page,3,ask,inquiry);
			request.put("allUser", pCut);
		}
		return result;
	}

	public String deleteUser() {	//删除该用户，并查询所有用户
		User me = (User) session.get("user");
		if(me.getId()==user.getId()){
			request.put("deleteUserMsg", "删除失败,不能删除自己");
		} else { 
			boolean boo = userService.deleteUser(user);
			if(boo){
				request.put("deleteUserMsg", "删除成功");
			} else {
				request.put("deleteUserMsg", "删除失败");
			}
		}
		PageCut<User> pCut=userService.getPageCut(page,3,ask,inquiry);
		request.put("allUser", pCut);
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

}
