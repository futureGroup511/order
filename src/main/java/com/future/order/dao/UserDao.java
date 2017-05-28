/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 上午10:29:02   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.User;
import com.future.order.service.IUserService;

@Service
public class UserDao extends BaseDao<User> implements IUserService {
	

	@Override
	public User login(String phone, String password) {	//登录
		String hql = "from User where phone='"+phone+"'and password= '"+password+"'";
		return (User)this.uniqueResult(hql);
	}

	@Override
	public boolean addUser(User user) {
		String hql = "from User where phone='"+user.getPhone()+"'";
		User userDataBase = (User) this.uniqueResult(hql);
		if(userDataBase==null){
			user.setCreateDate(new Date());
			this.saveEntity(user);
			return true;
		}
		return false;
	}

	@Override
	public List<User> selectAllUser() {
		List<User> list = this.selectAll();
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i)+"asd");
		}
		return list;
	}
}
