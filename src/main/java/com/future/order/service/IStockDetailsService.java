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
	//根据进货id查询所属的进货详情的信息，并分页
	PageCut<StockDetails> getPageCut(int currentPage, int pageSize, int stockid);
	//根据进货ID删除进货详细信息
	boolean deletStockDetails(int id);

	public List<StockDetails> getAll();

	public List<StockDetails> getBycreateDate(int ingId);

	public boolean deletDetails(int stocksid);

	public StockDetails checkById(int stocksid);

	public boolean Updatestocks(StockDetails details);

	// 焦祥宇加
	// 根据配料id获得进货详情
	public List<StockDetails> getByIngId(int ingId, int num);

	boolean addDetails(StockDetails details);

	PageCut<StockDetails> getSomePageCut(int currentPage, int pageSize, int stockid, String ask, String inquiry);
}
