/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:40:53   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.StockDetails;

/**
 * @author Administrator
 *
 */
public interface IStockDetailsService {

	public List<StockDetails> getAll();

	public List<StockDetails> getBycreateDate(int ingId);
}
