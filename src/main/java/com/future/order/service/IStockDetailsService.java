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
	//根据ID删除进货详情
	public boolean deletDetails(int stocksid);
	//根据id获取进货的详细信息中的一条，用于预览溯源信息
	public StockDetails checkById(int stocksid);
	//修改进货详情
	public boolean updatestocks(StockDetails details);

	//根据配料id获得进货详情 安李杰加
	public List<StockDetails> getByIngId(int ingId,int num);

	//根据条件查询，获得符合条件的进货详细信息
	boolean addDetails(StockDetails details);
	//根据条件查询，获得符合条件的进货详细信息
	PageCut<StockDetails> getSomePageCut(int currentPage, int pageSize, int stockid, String ask, String inquiry);
}
