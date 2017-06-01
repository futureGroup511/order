package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Menu;
import com.future.order.entity.User;
import com.future.order.util.PageCut;

public class MenuManagerAction extends BaseAction {

	private Menu menu;

	private int page=1;
	
	public String execute(){
		PageCut<Menu> pCut=menuService.getPageCut(page,3);
		request.put("allMenu", pCut);
		return SUCCESS;
	}
	
	public String addMenu(){
		boolean boo = menuService.addMenu(menu);
		if(boo){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！该菜已被添加过");
		}
		return "addMenu";
	}
	
	//查看菜品详情
	public String toUpdateMenu(){
		int id = menu.getId();
		System.out.println(id+"id");
		Menu menu = menuService.get(id);
		request.put("updateMenu", menu);
		return "toUpdateMenu";
	}
	//修改菜品
	public String updateMenu(){
		boolean boo = menuService.updateUser(menu);
		if(boo){
			request.put("updateMsg", "修改成功");
		} else {
			request.put("updateMsg", "修改失败");
		}
		PageCut<Menu> pCut=menuService.getPageCut(page,3);
		request.put("allMenu", pCut);
		return "updateMenu";
	}
	//删除菜品
	public String deleteMenu(){
		boolean boo = menuService.deleteMenu(menu);
		if(boo){
			request.put("deleteMenuMsg", "删除成功");
		} else {
			request.put("deleteMenuMsg", "删除失败");
		}
		PageCut<Menu> pCut=menuService.getPageCut(page,3);
		request.put("allMenu", pCut);
		return "deleteUser";
	} 
	
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	
}
