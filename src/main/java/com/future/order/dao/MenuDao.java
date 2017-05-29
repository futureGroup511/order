/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:50:32   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
<<<<<<< HEAD
import com.future.order.entity.Menu;
import com.future.order.entity.Order;
import com.future.order.entity.User;
=======

import com.future.order.entity.Menu;

>>>>>>> 3dcfe42f7b69127dee370f6e2b046fbedcbdc4eb
import com.future.order.service.IMenuService;

@Service
public class MenuDao extends BaseDao<Menu> implements IMenuService {

	//wqj获取订单
	@Override
	public Menu Doorder(int id ){
		Menu menu = this.getEntity(id);
		return menu;
		//asd 
	}


	@Override
	public List<Menu> getAll() {
			List<Menu> list = new ArrayList<Menu>();
			try{
				String hql="from Menu";
				list=this.getEntityList(hql);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}

	

	@Override
	public Menu get(int id) {
		Menu menu=null;
		menu=this.getEntity(id);
		return menu;
	}

}
