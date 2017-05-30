/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:51:58   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Ingredient;
import com.future.order.entity.User;
import com.future.order.service.IIngerdientService;
import com.future.order.util.PageCut;


@Service
public class IngredientDao extends BaseDao<Ingredient> implements IIngerdientService {

	@Override
	public List<Ingredient> getAll() {
		List<Ingredient> list = this.selectAll();
		return list;
	}

	@Override
	public boolean addIngredient(Ingredient ingredient) {
		return this.saveEntity(ingredient);
	}

	@Override
	public Ingredient getById(int id) {
		Ingredient ingredient = this.getEntity(id);
		return ingredient;
	}

	@Override
	public boolean updateIngredient(Ingredient ingredient) {
		boolean boo = this.updateEntity(ingredient);
		return boo;
	}

	@Override
	public boolean deleteIngredient(Ingredient ingredient) {
		boolean boo = this.deleteEntity(ingredient);
		return boo;
	}

	@Override
	public PageCut<Ingredient> getPageCut(int curr, int pageSize) {
		String hql = "select count(*) from Ingredient";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Ingredient> pc = new PageCut<Ingredient>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList("from Ingredient", (curr-1)*pageSize, pageSize));
		return pc;
	}
}
