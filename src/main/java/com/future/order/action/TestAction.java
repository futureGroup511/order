/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 上午10:30:49   
 * @Description: 测试用，一会删除 
 * 
 */  
package com.future.order.action;

import com.future.order.base.BaseAction;
import com.future.order.entity.User;


public class TestAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user;//由类生成对象
	
	public String toAddUser() throws Exception {
		
		return "toAddUser";
	}
	public String addUser() throws Exception {
		boolean bool=userService.add(user);
		if(bool==true){
			request.put("meg", "添加成功");//这是从action的RequestAware获得的request，只有put，get方法
		}else{
			request.put("meg", "添加失败");
		}
		return "addUser";
	}

	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
}
