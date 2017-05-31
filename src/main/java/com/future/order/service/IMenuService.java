/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:08   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Menu;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 *
 */
public interface IMenuService {

	public Menu Doorder(int id );


	public Menu get(int id);//金高用

	public List<Menu> getAll();

	//添加菜品zjg
	public boolean addMenu(Menu menu);
	//分页
	public PageCut<Menu> getPageCut(int curr,int pageSize);
	//修改菜品
	public boolean updateUser(Menu menu);
	//删除菜品
	public boolean deleteMenu(Menu menu);
}
