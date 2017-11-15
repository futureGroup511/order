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
	//修改配料的价格和库存
	public boolean updateIngredient(Ingredient ingredient);	//修改配料信息

	public boolean deleteIngredient(Ingredient ingredient);	//删除配料

	public PageCut<Ingredient> getPageCut(int curr,int pageSize);	//分页
	
	public List<Ingredient> getByMenuId(int menuId);//根据菜品id得到菜的配料
	
	//得到所有配料，进货详情使用
	public List<Ingredient> getNews();
	
	public boolean updeteNum(int id, int num);//更改配料库存量
	
	public PageCut<Ingredient> getSomePageCut(int curr,int pageSize, String inquiry);//得到符合某种条件的配料，分页
	
	public List<Ingredient> getByIdAll(int id);//执行有条件查询
	//根据配料名称得到配料
	public Ingredient getByName(String name);

}
