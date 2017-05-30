/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:46:40   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Menu;
import com.future.order.entity.StockDetails;
import com.future.order.service.IStockDetailsService;

@Service
public class StockDetailsDao extends BaseDao<StockDetails> implements IStockDetailsService {
	@Override
	public List<StockDetails> getAll() {
		List<StockDetails> list = new ArrayList<StockDetails>();
		try{
			String hql="from StockDetails";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StockDetails> getBycreateDate(int ingId) {
		String hql="from StockDetails m where m.ingId="+ingId;		
		return this.getEntityList(hql);
	}

}
