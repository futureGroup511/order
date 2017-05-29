package com.future.order.action.manager;

import java.util.Date;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;

public class IngredientManagerAction extends BaseAction {

	private  Ingredient ingredient;

	//增加配料
	public String addIngredient(){
		ingredient.setCreateDate(new Date());
		boolean boo = ingerdientService.addIngredient(ingredient);
		if(boo){
			request.put("addIngerdientMsg", "添加成功");
		} else {
			request.put("addIngerdientMsg", "添加失败");
		}
		return "addIngredient";
	}
	
	
	public Ingredient getIngredient() {
		return ingredient;
	}

	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}
	
	
}
