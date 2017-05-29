/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:48:47   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Order;
import com.future.order.service.IOrderService;

@Service
public class OrderDao extends BaseDao<Order> implements IOrderService {
	
	@Override
	public List<Order> getAll() {
		List<Order> list = new ArrayList<Order>();
		try{
			String hql="from Order";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

}
