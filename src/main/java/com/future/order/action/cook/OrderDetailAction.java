package com.future.order.action.cook;

import java.util.ArrayList;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.OrderDetails;

public class OrderDetailAction extends BaseAction {
	public String DoIngredient() {
		int menuId=(int) session.get("menuId");
		List  menu=menuMaterialService.getByMenuId(menuId);
		for( int i=0;i<menu.size();i++) {
			MenuMaterial pl=(MenuMaterial) menu.get(i);
			System.out.println(pl);
			int id=pl.getIngId();
			int num=(int) pl.getNum();
			boolean m=ingerdientService.updeteNum(id, num);
			System.out.println(pl);
		}
		return "menu";
	}		
}
