/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:08   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;


import com.future.order.entity.MenuType;
import com.future.order.util.PageCut;

public interface IMenuTypeService {
	//获得所有的菜品的类型，安李杰用
	public List<MenuType> getAllMenuType();

	public boolean addType(MenuType menutype);

	public PageCut<MenuType> getPageCut(int currentPage, int pageSize);

	public MenuType CheckById(int id);

	public boolean UpdateType(MenuType menutype);

	public boolean DeletType(int id);

	public PageCut<MenuType> getSomePageCut(int currentPage, int pageSize, String inquiry);

	public int getCount();
	
	public MenuType getByName(String name);
}
