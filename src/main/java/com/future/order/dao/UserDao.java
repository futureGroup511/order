/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 上午10:29:02   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.User;
import com.future.order.service.IUserService;

@Service
public class UserDao extends BaseDao<User> implements IUserService {
	
	@Override
	public boolean add(User user) {		
		return saveEntity(user);
	}

}
