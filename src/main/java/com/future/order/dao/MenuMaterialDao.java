/**        
z· * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:50:02   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
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
	public List<MenuMaterial> getMenuMaterial(int menuId) {
		List<MenuMaterial> list = new ArrayList<MenuMaterial>();
		try{
			String hql="from MenuMaterial m where m.menuId="+menuId;	
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
	

	@Override
	public List<MenuMaterial> getByMenuId(int menuId) {
		String hql="from MenuMaterial m where m.menuId="+menuId;		
		return this.getEntityList(hql);
	}

	@Override
	public boolean addMenuMaterial(MenuMaterial menuMaterial) {
		//判断该配料是否添加过
		List<MenuMaterial> list = this.getByMenuId(menuMaterial.getMenuId());
		boolean boo = true;
		for(int i=0;i<list.size();i++){
			if(list.get(i).getIngId()==menuMaterial.getIngId()){
				boo = false;
			}
		}
		if(boo){
			menuMaterial.setStockDate(new Date());
			boo = this.saveEntity(menuMaterial);
		}
		
		return boo;
	}

	@Override
	public boolean updateMaterial(MenuMaterial menuMaterial) {
		MenuMaterial materialFromBase = this.get(menuMaterial.getId());
		materialFromBase.setNum(menuMaterial.getNum());
		return this.updateEntity(materialFromBase);
	}

	@Override
	public boolean deleteMaterial(MenuMaterial menuMaterial) {
		return this.deleteEntity(menuMaterial);
	}
	@Override
	public List<MenuMaterial> getByMenuIdTwo(int menuId) {
		String hql="from MenuMaterial s where s.menuId="+menuId+" and s.type='原料' ";		
		return this.getEntityList(hql);
	}
	@Override
	public List<MenuMaterial> getByMenuIdOne(int id) {
		String hql="from MenuMaterial m where m.id="+id;		
		return this.getEntityList(hql);
	}
	
}
