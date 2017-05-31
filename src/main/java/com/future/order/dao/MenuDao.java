/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:50:32   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Menu;
import com.future.order.entity.User;
import com.future.order.service.IMenuService;
import com.future.order.util.PageCut;

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


	@Override
	public boolean addMenu(Menu menu) {//根据菜品判断数据库里是否已存在该菜
		String hql = "from Menu where name='"+menu.getName()+"'";
		Menu menuDataBase = (Menu) this.uniqueResult(hql);
		if(menuDataBase==null){
			menu.setCreateDate(new Date());
			return this.saveEntity(menu);
		}
		return false;
	}


	@Override
	public PageCut<Menu> getPageCut(int curr, int pageSize) {
		String hql = "select count(*) from Menu";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Menu> pc = new PageCut<Menu>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList("from Menu", (curr-1)*pageSize, pageSize));
		return pc;
	}


	@Override
	public boolean updateUser(Menu menu) {
		return this.updateEntity(menu);
	}


	@Override
	public boolean deleteMenu(Menu menu) {
		return this.deleteEntity(menu);
	}

}
