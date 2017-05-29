/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:50:02   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Ingredient;
import com.future.order.entity.MenuMaterial;

import com.future.order.service.IMenuMaterialService;

@Service
public class MenuMaterialDao extends BaseDao<MenuMaterial> implements IMenuMaterialService {

	@Override
	public List<MenuMaterial> getAll() {
		List<MenuMaterial> list = new ArrayList<MenuMaterial>();
		try{
			String hql="from MenuMaterial";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public MenuMaterial get(int id) {
		MenuMaterial m=null;
		m=this.getEntity(id);
		return m;
	}
	
}
