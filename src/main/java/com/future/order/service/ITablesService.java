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
	
	//安李杰加获得桌子的状态信息
	public Tables get(int id);	//金高用
	
	//分页查询
	public PageCut<Tables> getPageCut(int curr,int pageSize);
	//添加餐桌
	public boolean addTable(Tables table);
	//删除餐桌
	public boolean deleteTable(Tables table);
	//修改餐桌信息 安李杰加
	public boolean updateTables(Tables table);
	//修改餐桌状态
	public boolean changeStatus(int tableId);
	
	public List<Tables> CheckName();
	//根据条件查询符合条件餐桌
	public PageCut<Tables> getSomePageCut(int curr, int pageSize, String replace);
	//根据id得到餐桌的图片地址
	public Tables getImurl(int id);
	//修改餐桌信息
	public boolean updateTable(Tables table);

	
}
