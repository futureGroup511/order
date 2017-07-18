/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:41:13   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.Date;
import java.util.List;

import com.future.order.entity.Stock;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 *
 */
public interface IStockService {


	public boolean AddStock(Stock stock);

	public PageCut<Stock> getPageCut(int currentPage, int pageSize);

	public boolean DeletStock(int id);

	public Stock CheckById(int id);

	public boolean UpdateStock(Stock stocks);

	public PageCut<Stock> getSomePageCut(int currentPage, int pageSize, String inquiry);

	public List<Stock> getSomestock();

	public PageCut<Stock> getSomePageCut(int currentPage, int pageSize, Date starttime, Date endtime);

	public List<Stock> getPrice(Date starttime, Date endtime);

	public List<Stock> getTotal(String inquiry);

}
