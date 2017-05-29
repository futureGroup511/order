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

import com.future.order.service.IIngerdientService;


@Service
public class IngredientDao extends BaseDao<Ingredient> implements IIngerdientService {

	@Override
	public List<Ingredient> getAll() {
		@SuppressWarnings("unused")
		List<Ingredient> list = new ArrayList<Ingredient>();
		try{
			String hql="from Ingredient";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public boolean addIngredient(Ingredient ingredient) {
		return this.saveEntity(ingredient);
	}

	
}
