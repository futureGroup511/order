package com.future.order.action.manager;

import java.util.List;

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
	private int sex;//得到用户id，隐藏真实名字
	
	public String execute(){		//遍历所有用户，分页
		PageCut<User> pCut=userService.getPageCut(page,8);
		request.put("allUser", pCut);
		if(pCut.getData().size()==0){
			String mark="没有其他用户";
			request.put("deleteUserMsg", mark);
		}
		request.put("adss", "execute");
		return SUCCESS;
	}
	
	public String addUser() {		//添加用户
		boolean boo = userService.addUser(user);
		if(boo){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！该账号已被使用");
		}
		return "addUser";
	}
	
	public String toUpdateUser(){	//到修改界面，查询出所修改用户信息
		User userData = (User)session.get("manager");
		if(userData.getId()==userId){//当修改的是管理员本身的时候
			return "getMyself";
		}else {
			User user = userService.viewUser(userId);
			request.put("updateUser", user);
		}
		return "toUpdateUser";
	}
	
	public String updateUser() {	//确认修改信息,修改个人资料
		boolean boo = false;
		String msg = "修改失败";
		User userData = userService.viewUser(user.getId());
		if(userData!=null&&!userData.getPhone().equals(user.getPhone())){//修改了手机号
			User userDb = userService.selectByPhone(user.getPhone());
			msg = "该手机号已经被注册";
			if(userDb==null){
				boo = userService.updateUser(user);
			}
		} else {
			boo = userService.updateUser(user);
		}
		String result = "updateUser";
		if(boo){
			msg = "修改成功";
		}
		request.put("updateUserMsg", msg);
		request.put("sort", user.getSort());//将用户身份存入request
		PageCut<User> pCut=userService.getPageCut(page,8);
		request.put("allUser", pCut);
		return result;
	}
	
	//管理员修改个人信息
	public String updateMyself(){
		User userM = (User)session.get("manager");
		User userData = userService.viewUser(userM.getId());
		userData.setName(user.getName());
		userData.setPhone(user.getPhone());
		userData.setPassword(user.getPassword());
		boolean boo = userService.updateUser(userData);
		if(boo){	//将修改后信息存入session
			request.put("updateUserMsg", "修改成功");
			session.put("manager", userData);
		}else {
			request.put("updateUserMsg", "修改失败");
		}
		return  "toUpdateMyself";
	}
	
	//收银员修改个人信息
	public String cashierUpMyself(){
		User userCa = (User)session.get("cashier");
		User userData = userService.viewUser(userCa.getId());
		userData.setName(user.getName());
		userData.setPhone(user.getPhone());
		userData.setPassword(user.getPassword());
		boolean boo = userService.updateUser(userData);
		if(boo){	//将修改后信息存入session
			request.put("updateUserMsg", "修改成功");
			session.put("cashier", userData);
		}else {
			request.put("updateUserMsg", "修改失败");
		}
		return  "cashierGetMyself";
	}
	
	public String deleteUser() {	//删除该用户，并查询所有用户
		User me = (User) session.get("manager");
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
		PageCut<User> pCut=userService.getPageCut(page,8);
		request.put("allUser", pCut);
		return "deleteUser";
	}
	public String Inquiry(){		//条件查询
		PageCut<User> pCut=new PageCut();
		if(inquiry!=null){
		 pCut=userService.getSomePageCut(page,8,inquiry);
		}else{
//			ask=(String) session.get("ask");
			inquiry=(String) session.get("inquiry");
			pCut=userService.getSomePageCut(page,8,inquiry);
		}
		request.put("allUser", pCut);
		if(pCut.getData().size()==0){
			String mark="没有你查询的用户";
			request.put("deleteUserMsg", mark);
		}
		request.put("adss", "Inquiry");
//		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return SUCCESS;
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

	public final int getSex() {
		return sex;
	}

	public final void setSex(int sex) {
		this.sex = sex;
	}

}
