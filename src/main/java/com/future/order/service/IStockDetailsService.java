/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:40:53   
 * @Description:  
 * 
 */  
package com.future.order.service;

import com.future.order.entity.StockDetails;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 *
 */
public interface IStockDetailsService {

	PageCut<StockDetails> getPageCut(int currentPage, int pageSize, int stockid);

	boolean DeletStockDetails(int id);

}
