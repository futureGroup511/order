/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:43:50   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;
import com.future.order.entity.MenuMaterial;

/**
 * @author Administrator
 *
 */
public interface IMenuMaterialService {

	public List<MenuMaterial> getAll();//金高用
	public MenuMaterial get(int id);

	//张金高加
	//添加菜品配料
	public boolean addMenuMaterial(MenuMaterial menuMaterial);
	//修改菜品配料
	public boolean updateMaterial(MenuMaterial menuMaterial);
	//删除菜品配料
	public boolean deleteMaterial(MenuMaterial  menuMaterial);
	//删除菜品时删除对应的菜品配料
	public boolean deleteAboutMenu(int id);
	//安李杰用
	public List<MenuMaterial> getByMenuId(int menuId);

	public List<MenuMaterial> getMenuMaterial(int menuId);
	//根据Menu中的id去获取菜单详情中的原料信息 安李杰用
	public List<MenuMaterial> getByMenuIdTwo(int menuId);

	public List<MenuMaterial> getByMenuIdOne(int id);

}
