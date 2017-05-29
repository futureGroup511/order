/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:47:06   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Stock;
import com.future.order.service.IStockService;

@Service
public class StockDao extends BaseDao<Stock> implements IStockService {

	@Override
	public boolean AddStock(Stock stock) {
		boolean sign=false;
		try{
			sign=this.saveEntity(stock);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

}
