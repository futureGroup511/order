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
	//学长加
	public List<Ingredient> getAll();
	//添加配料
	public boolean addIngredient(Ingredient ingredient);
	//根据id查找配料 安李杰加
	public Ingredient getById(int id);
	//修改配料信息
	public boolean updateIngredient(Ingredient ingredient);
	//删除配料
	public boolean deleteIngredient(Ingredient ingredient);
	//分页
	public PageCut<Ingredient> getPageCut(int curr,int pageSize);
	public List<Ingredient> getByMenuId(int menuId);//根据菜品id得到菜的配料
	
	public List<Ingredient> getNews();
	
	public boolean updeteNum(int id, int num);
	public PageCut<Ingredient> getSomePageCut(int curr,int pageSize, String ask, String inquiry);
	//执行有条件查询
	public List<Ingredient> getByIdAll(int id);

}
