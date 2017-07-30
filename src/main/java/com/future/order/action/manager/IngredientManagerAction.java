package com.future.order.action.manager;

import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.util.PageCut;

public class IngredientManagerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Ingredient ingredient;
	private int page = 1;	//初始页数
	private String inquiry;	//查询内容
	private String ask;	//查询条件

	public String execute() {//遍历配料，分页
		PageCut<Ingredient> pCut = ingerdientService.getPageCut(page, 8);
		request.put("allIngredient", pCut);
		if (pCut.getData().size() == 0) {
			String mark = "没有配料了，快去添加吧";
			request.put("deleteIngredientMsg", mark);
		}
		request.put("adss", "execute");
		return SUCCESS;
	}

	// 增加配料
	public String addIngredient() {
		ingredient.setCreateDate(new Date());
		boolean boo = ingerdientService.addIngredient(ingredient);
		if (boo) {
			List<Ingredient> list1 = ingerdientService.getAll();
			session.put("Ientlist",list1);	//将配料放进session
			request.put("addIngerdientMsg", "添加成功");
		} else {
			request.put("addIngerdientMsg", "添加失败，名称重复");
		}
		return "addIngredient";
	}

	public String Inquiry() {			// 查找配料,按名字
		PageCut<Ingredient> pCut = new PageCut<Ingredient>();
		if(ask!=null){
			pCut = ingerdientService.getSomePageCut(page, 8,ask,inquiry);
			}else{
				ask=(String) session.get("ask");
				inquiry=(String) session.get("inquiry");
				pCut = ingerdientService.getSomePageCut(page, 8,ask,inquiry);
			}
		request.put("allIngredient", pCut);
		request.put("adss", "Inquiry");
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		if (pCut.getData().size() == 0) {
			String mark = "没有配料了，快去添加吧";
			request.put("deleteIngredientMsg", mark);
		}
		return SUCCESS;
	}

	public String toUpdateIngredient() {	// 查询被修改配料信息，到达修改界面
		int id = ingredient.getId();
		Ingredient ingredient = ingerdientService.getById(id);
		request.put("updateIngredient", ingredient);
		return "toUpdateIngredient";
	}

	public String updateIngredient() {			// 修改配料信息
		boolean boo = ingerdientService.updateIngredient(ingredient);
		if (boo) {
			List<Ingredient> list1 = ingerdientService.getAll();
			session.put("Ientlist",list1);	//将配料放进session
			request.put("updateIngredientMsg", "修改成功");
		} else {
			request.put("updateIngredientMsg", "修改失败");
		}
		PageCut<Ingredient> pCut = ingerdientService.getPageCut(page, 8);
		request.put("allIngredient", pCut);
		return "updateIngredient";
	}

	public String deleteIngredient() {		// 删除配料
		boolean boo = ingerdientService.deleteIngredient(ingredient);
		if (boo) {
			List<Ingredient> list1 = ingerdientService.getAll();
			session.put("Ientlist",list1);	//将配料放进session
			request.put("deleteIngredientMsg", "删除成功");
		} else {
			request.put("deleteIngredientMsg", "删除失败");
		}
		PageCut<Ingredient> pCut = ingerdientService.getPageCut(page, 8);
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
