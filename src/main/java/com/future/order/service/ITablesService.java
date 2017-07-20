/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:40:01   
 * @Description:  
 * 
 */  
package com.future.order.service;


import java.util.List;

import com.future.order.entity.Ingredient;
import com.future.order.entity.Tables;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 *
 */
public interface ITablesService {
	

	public Tables get(int id);	//金高用
	
	//分页查询
	public PageCut<Tables> getPageCut(int curr,int pageSize);
	//添加餐桌
	public boolean addTable(Tables table);
	//删除餐桌
	public boolean deleteTable(Tables table);
	//修改餐桌信息
	public boolean updateTables(Tables table);

	public List<Tables> CheckName();

	public PageCut<Tables> getSomePageCut(int curr, int pageSize, String pass, String replace);

	public Tables getImurl(int id);
}
