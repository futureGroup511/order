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
	//添加进货信息
	public boolean addStock(Stock stock);
	//查询pageSize条信息，用于分页
	public PageCut<Stock> getPageCut(int currentPage, int pageSize);
	//删除进货信息
	public boolean deletStock(int id);
	//获取修改的进货信息
	public Stock checkById(int id);
	//修改进货信息
	public boolean updateStock(Stock stocks);
   //条件查询符合条件的进货信息
	public PageCut<Stock> getSomePageCut(int currentPage, int pageSize, String inquiry);

	public List<Stock> getSomestock();
	 //时间条件查询符合条件的进货信息
	public PageCut<Stock> getSomePageCut(int currentPage, int pageSize, String starttime, String endtime);
	//得到查询时间内的进货总价
	public List<Stock> getPrice(String starttime, String endtime);
	//得到进货总价
	public List<Stock> getTotal(String inquiry);
	//根据ID得到进货信息
	public Stock getStock(int stocksid);

}
