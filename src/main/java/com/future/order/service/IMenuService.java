/**        
 * @author: 焦祥宇 

 * @date:   createDate：2017年5月22日 上午10:44:08   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;


import com.future.order.entity.Menu;
import com.future.order.entity.OrderDetails;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 *
 */
public interface IMenuService {
	//wqj查看所有菜单
	public List<Menu> getAll();

	Menu Doorder(int id);

	List<Menu> unfinish();

	public Menu get(int id);//金高用
	
	
	public List<Menu> ByName(String typeName);


	//添加菜品zjg
	public boolean addMenu(Menu menu);
	//分页
	public PageCut<Menu> getPageCut(int curr,int pageSize);
	//修改菜品
	public boolean updateUser(Menu menu);
	//删除菜品
	public boolean deleteMenu(Menu menu);
	
	//焦祥宇加
	//获得num条推荐菜品
	public List<Menu> getRecommend(int num);

	public List<Menu> CheckDetails(int id);

	public boolean updatemenu(int id);
	public List<Menu> getByTypeId(int id);
}
