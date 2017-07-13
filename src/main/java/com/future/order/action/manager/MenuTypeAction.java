package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.MenuType;
import com.future.order.util.PageCut;

public class MenuTypeAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int id;
	private MenuType menutype;
	private MenuType menus;
	private String inquiry;
	public String execute() {
		PageCut<MenuType> pCut = new PageCut<MenuType>();
		pCut=menuTypeService.getPageCut(page,5);
		if(pCut.getData().size()==0){
			String mark="没有菜品的类型哦(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("marknews", mark);
		}
		request.put("adss", "execute");
		request.put("pc", pCut);
		return "check";
	}
	public String Add() {
		boolean sign = menuTypeService.AddType(menutype);
		System.out.println(menutype);
		String mark = "操作失败";
		if (sign == true) {
			mark = "添加成功";
			@SuppressWarnings("unchecked")
			List<MenuType> list = (List<MenuType>) session.get("Typelist");	//金高改
			list.add(menutype);		//
		} else {
			mark = "添加失败";
		}
		request.put("typenews", mark);
		return "add";
	}
   public String toUpdateType() {//根据ID获得需要修改的订单信息
	   MenuType menutype = menuTypeService.CheckById(id);
		System.out.println(menutype);
		request.put("menutype", menutype);
		return "update";
	}
   public String Update() {
		boolean sign = menuTypeService.UpdateType(menus);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("marknews", mark);
		return this.execute();
	}
   public String Delet() {//从前台获得ID用于根据账号删除订单信息和订单详细信息
		boolean sign = menuTypeService.DeletType(id);
		String mark = "操作失败";
		if (sign) {
			mark = "删除成功";
		} else {
			mark = "删除失败";
		}
		request.put("marknews", mark);
		return this.execute();

	}
   public String Inquiry(){
	   PageCut<MenuType> pCut = new PageCut<MenuType>();
	   if(inquiry!=null){
		   pCut=menuTypeService.getSomePageCut(page,5,inquiry);
			}else{
				inquiry=(String) session.get("inquiry");
				pCut=menuTypeService.getSomePageCut(page,5,inquiry);
			}
		if(pCut.getData().size()==0){
			String mark="没有菜品的类型哦(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("marknews", mark);
		}
		request.put("adss", "Inquiry");		
		session.put("inquiry", inquiry);
		request.put("pc", pCut);
		return "check";
   }
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public MenuType getMenutype() {
		return menutype;
	}

	public void setMenutype(MenuType menutype) {
		this.menutype = menutype;
	}
	public MenuType getMenus() {
		return menus;
	}
	public void setMenus(MenuType menus) {
		this.menus = menus;
	}
	public String getInquiry() {
		return inquiry;
	}
	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}
	
}
