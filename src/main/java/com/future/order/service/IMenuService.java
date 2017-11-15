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
	//wqj查看所有菜单安李杰加
	public List<Menu> getAll();

	Menu Doorder(int id);

	List<Menu> unfinish();
	//根据前台传过来的id去获取每道菜的信息 安李杰加
	public Menu get(int id);//张金高用
	
	
	public List<Menu> ByName(String typeName);


	//添加菜品张金高
	public boolean addMenu(Menu menu);
	//分页
	public PageCut<Menu> getPageCut(int curr,int pageSize);
	//修改菜品
	public boolean updateUser(Menu menu);
	//删除菜品
	public boolean deleteMenu(Menu menu);
	//按菜名查询
	public Menu inquiryByName(String inquiry);

	
	//获取推荐菜品,安李杰用
	public List<Menu> getRecommend(int num);

	public List<Menu> CheckDetails(int id);

	public boolean updatemenu(int id);
	//根据菜品类型id获得菜品 安李杰加
	public List<Menu> getByTypeId(int id);
	//查询菜  黎明加
	public PageCut<Menu> getSomePageCut(int curr,int pageSize, String inquiry);
	//安李杰用 更新菜单
	public Boolean update(Menu m);

}
