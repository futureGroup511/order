/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:40:53   
 * @Description:  
 * 
 */  
package com.future.order.service;

import com.future.order.entity.StockDetails;
import com.future.order.util.PageCut;

import java.util.List;

import com.future.order.entity.StockDetails;

/**
 * @author Administrator
 *
 */
public interface IStockDetailsService {


	PageCut<StockDetails> getPageCut(int currentPage, int pageSize, int stockid);

	boolean DeletStockDetails(int id);

	public List<StockDetails> getAll();

	public List<StockDetails> getBycreateDate(int ingId);

	public boolean DeletDetails(int stocksid);

	public StockDetails CheckById(int stocksid);

	public boolean Updatestocks(StockDetails details);
	
	//焦祥宇加
	//根据配料id获得进货详情
	public List<StockDetails> getByIngId(int ingId,int num);
}
