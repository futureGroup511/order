package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;

@SuppressWarnings("serial")
public class MenuMaterialAction extends BaseAction {
	
	private MenuMaterial menuMaterial;
	private int menuId;
	private int menuMaterialId;
	
	public String addMenuMaterial(){
		if(menuId!=0){		//当入口为管理菜品详情添加新配料时
			Menu menu = menuService.get(menuId);
			session.put("menu", menu);
		} else {
			Menu menu=(Menu) session.get("menu");
			int  menuid=menu.getId();
			String menuName=menu.getName();
			menuMaterial.setMenuId(menuid);
			menuMaterial.setMenuName(menuName);
			@SuppressWarnings("unchecked")
			List<Ingredient> list=(List<Ingredient>) session.get("Ientlist");
			String name=menuMaterial.getIngName();
			for(int i=0;i<list.size();i++){
				if(list.get(i).getName().equals(name)){
					menuMaterial.setIngId(list.get(i).getId());
					menuMaterial.setType(list.get(i).getType());
				}
			}
			boolean boo = menuMaterialService.addMenuMaterial(menuMaterial);
			if(boo){
				request.put("addMaterialMsg", "添加成功");
			} else {
				request.put("addMaterialMsg", "添加失败,该配料已添加");
			}
		}
		List<Ingredient> lists =  ingerdientService.getAll();
		request.put("allIngredient", lists);
		return "addMenuMaterial";
	}
	
	public String updateMenuMaterial(){
		List<MenuMaterial> list =  menuMaterialService.getByMenuId(menuId);
		if(list.size()==0){
			request.put("materialMsg", "还没有添加配料");
		}
		request.put("allMenuMaterial", list);
		Menu menu = menuService.get(menuId);
		session.put("menu", menu);
		return "updateMaterial";
	}
	
	public String updateMaterial(){		//修改菜的配料
		boolean boo = menuMaterialService.updateMaterial(menuMaterial);
		if(boo){
			request.put("materialMsg", "操作成功");
		} else {
			request.put("materialMsg", "操作失败");
		}
		List<MenuMaterial> list =  menuMaterialService.getByMenuId(menuMaterial.getMenuId());
		request.put("allMenuMaterial", list);
		request.put("menuId", menuId);
		return "updateMaterial";
	}
	
	public String deleteMaterial(){
		boolean boo = menuMaterialService.deleteMaterial(menuMaterial);
		if(boo){
			request.put("materialMsg", "操作成功");
		} else {
			request.put("materialMsg", "操作失败");
		}
		List<MenuMaterial> list =  menuMaterialService.getByMenuId(menuMaterial.getMenuId());
		request.put("allMenuMaterial", list);
		return "deleteMaterial";
	}
	
	public MenuMaterial getMenuMaterial() {
		return menuMaterial;
	}
	public void setMenuMaterial(MenuMaterial menuMaterial) {
		this.menuMaterial = menuMaterial;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getMenuId() {
		return menuId;
	}

	public int getMenuMaterialId() {
		return menuMaterialId;
	}

	public void setMenuMaterialId(int menuMaterialId) {
		this.menuMaterialId = menuMaterialId;
	}
	
}
