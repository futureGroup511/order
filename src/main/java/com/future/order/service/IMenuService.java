/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:08   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Menu;

/**
 * @author Administrator
 *
 */
public interface IMenuService {
	//wqj查看所有菜单
	public List<Menu> getAll();

	Menu Doorder(int id);

	List<Menu> unfinish();

	public Menu get(int id);

}
