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
		String hql = "from Ingredient i where i.name ='"+ingredient.getName()+"'";
		Ingredient ingredientDb = (Ingredient)this.uniqueResult(hql);
		if(ingredientDb==null){
			return this.saveEntity(ingredient);	
		}
		return false;
	}
	//安李杰用
	@Override
	public Ingredient getById(int id) {
		Ingredient ingredient = this.getEntity(id);
		return ingredient;
	}

	@Override
	public boolean updateIngredient(Ingredient ingredient) {
		return this.updateEntity(ingredient);	
	}
	@Override
	public boolean updeteNum(int id, int num) {
		Ingredient ingredient = this.getEntity(id);
		boolean boo = false;						//如果配料为，就不能减，只能加
		if(ingredient.getNum()>0){
			ingredient.setNum(ingredient.getNum()-num);
			boo = true;
		}
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

	@Override
	public List<Ingredient> getByMenuId(int menuId) {
		String hql="from Ingredient m where m.menuId="+menuId;		
		return this.getEntityList(hql);
	}

	@Override
	public List<Ingredient> getNews() {
		return selectAll();
	}

	@Override
	public PageCut<Ingredient> getSomePageCut(int curr, int pageSize,String inquiry) {
		String hql;
		String selecthql;
//		if(ask.equals("price")||ask.equals("num")){
//			int mark=Integer.parseInt(inquiry);
////			String mark = inquiry;
//			hql = "select count(*) from Ingredient where "+ask+"='"+mark+"'";
//			selecthql="from Ingredient where "+ask+"='"+mark+"'";
//		}else{   concat(phone,',',name) like '%"+inquiry+"%' or sort = '"+inquiry+"'";//,作用是分割多个条件
		
			hql = "select count(*) from Ingredient where concat (name,',',price,',',num,',',type) like '%"+inquiry+"%'";
			selecthql="from Ingredient where concat (name,',',price,',',num,',',type) like '%"+inquiry+"%'";
//		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Ingredient> pc = new PageCut<Ingredient>(curr,pageSize,count);	
		pc.setData(this.getEntityLimitList(selecthql, (curr-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public List<Ingredient> getByIdAll(int id) {
		List<Ingredient> list = new ArrayList<Ingredient>();
		String hql="from Ingredient s where s.id="+id;
		list=this.getEntityList(hql);
		return list;
	}
}
