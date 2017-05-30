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

	public List<MenuMaterial> getAll();

	public MenuMaterial get(int id);
	public List<MenuMaterial> getByMenuId(int menuId);
	

}
