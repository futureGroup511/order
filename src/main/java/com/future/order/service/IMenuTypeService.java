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

	public List<MenuType> getAllMenuType();//得到全部菜品类型

	public boolean addType(MenuType menutype);//添加菜品类型

	public PageCut<MenuType> getPageCut(int currentPage, int pageSize);//得到菜品类型，分页

	public MenuType CheckById(int id);//根据id得到菜品类型

	public boolean UpdateType(MenuType menutype);//修改菜品类型

	public PageCut<MenuType> getSomePageCut(int currentPage, int pageSize, String inquiry);//得到符合某种条件的菜品类型

	public int getCount();//得到菜品类型的条数
	
	public MenuType getByName(String name);//根据菜品名称得到菜品类型
}
