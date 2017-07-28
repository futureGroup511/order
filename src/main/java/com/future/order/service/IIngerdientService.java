/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:36   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Ingredient;
import com.future.order.util.PageCut;


/**
 * @author Administrator
 *
 */
public interface IIngerdientService {
	
	public List<Ingredient> getAll();//得到全部配料

	public boolean addIngredient(Ingredient ingredient);	//添加配料

	public Ingredient getById(int id);	//根据id查找配料

	public boolean updateIngredient(Ingredient ingredient);	//修改配料信息

	public boolean deleteIngredient(Ingredient ingredient);	//删除配料

	public PageCut<Ingredient> getPageCut(int curr,int pageSize);	//分页
	
	public List<Ingredient> getByMenuId(int menuId);//根据菜品id得到菜的配料
	
	public List<Ingredient> getnews();
	
	public boolean updeteNum(int id, int num);
	public PageCut<Ingredient> getSomePageCut(int curr,int pageSize, String ask, String inquiry);
	//执行有条件查询
	public List<Ingredient> getByIdAll(int id);

}
