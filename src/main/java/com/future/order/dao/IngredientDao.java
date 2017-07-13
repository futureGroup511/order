/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:51:58   
 * @Description:  
 * 
 */  
package com.future.order.dao;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;
import com.future.order.base.BaseDao;
import com.future.order.entity.Ingredient;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.ShopCart;
import com.future.order.service.IIngerdientService;
import com.future.order.util.PageCut;
import com.opensymphony.xwork2.ActionContext;


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
	public boolean updeteNum(int id, int num) {
		Ingredient ingredient = this.getEntity(id);
		System.out.println(ingredient.getNum());
		boolean boo = false;						//如果配料为，就不能减，只能加
		if(ingredient.getNum()>0){
			ingredient.setNum(ingredient.getNum()-num);
			boo = true;
			System.out.println(ingredient.getNum());
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
	public List<Ingredient> getnews() {
		return selectAll();
	}

	@Override
	public PageCut<Ingredient> getSomePageCut(int curr, int pageSize, String ask, String inquiry) {
		String hql = "select count(*) from Ingredient";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Ingredient> pc = new PageCut<Ingredient>(curr,pageSize,count);
		if(ask.equals("price")||ask.equals("num")){
			int mark=Integer.parseInt(inquiry);
			pc.setData(this.getEntityLimitList("from Ingredient where "+ask+"='"+mark+"'", (curr-1)*pageSize, pageSize));	
		}else{
			pc.setData(this.getEntityLimitList("from Ingredient where "+ask+"='"+inquiry+"'", (curr-1)*pageSize, pageSize));
		}
		return pc;
	}
}
