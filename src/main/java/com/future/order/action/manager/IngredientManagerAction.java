package com.future.order.action.manager;

import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.util.PageCut;

public class IngredientManagerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Ingredient ingredient;
	private int page = 1;
	private String inquiry;
	private String ask;

	public String execute() {
		PageCut<Ingredient> pCut = ingerdientService.getPageCut(page, 6);
		request.put("allIngredient", pCut);
		if (pCut.getData().size() == 0) {
			String mark = "没有配料了，快去添加吧(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("deleteIngredientMsg", mark);
		}
		return SUCCESS;
	}

	// 增加配料
	public String addIngredient() {
		ingredient.setCreateDate(new Date());
		boolean boo = ingerdientService.addIngredient(ingredient);
		if (boo) {
			request.put("addIngerdientMsg", "添加成功");
		} else {
			request.put("addIngerdientMsg", "添加失败");
		}
		return "addIngredient";
	}

	// 查找配料,按名字
	public String Inquiry() {
		PageCut<Ingredient> pCut = ingerdientService.getSomePageCut(page, 6,ask,inquiry);
		request.put("allIngredient", pCut);
		if (pCut.getData().size() == 0) {
			String mark = "没有配料了，快去添加吧(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("deleteIngredientMsg", mark);
		}
		return SUCCESS;
	}

	// 查询被修改配料信息，到达修改界面
	public String toUpdateIngredient() {
		int id = ingredient.getId();
		Ingredient ingredient = ingerdientService.getById(id);
		request.put("updateIngredient", ingredient);
		return "toUpdateIngredient";
	}

	// 修改配料信息
	public String updateIngredient() {
		boolean boo = ingerdientService.updateIngredient(ingredient);
		if (boo) {
			request.put("updateIngredientMsg", "修改成功");
		} else {
			request.put("updateIngredientMsg", "修改失败");
		}
		PageCut<Ingredient> pCut = ingerdientService.getPageCut(page, 3);
		request.put("allIngredient", pCut);
		return "updateIngredient";
	}

	// 删除配料
	public String deleteIngredient() {
		boolean boo = ingerdientService.deleteIngredient(ingredient);
		if (boo) {
			request.put("deleteIngredientMsg", "删除成功");
		} else {
			request.put("deleteIngredientMsg", "删除失败");
		}
		PageCut<Ingredient> pCut = ingerdientService.getPageCut(page, 3);
		request.put("allIngredient", pCut);
		return "deleteIngredient";
	}

	public Ingredient getIngredient() {
		return ingredient;
	}

	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

}
