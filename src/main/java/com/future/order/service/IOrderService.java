/**        
z * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:43:20   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Order;

/**
 * @author Administrator
 *
 */
public interface IOrderService {
//	public List<Order> getNotPay();
	public List<Order> Check();
	public List<Order> CheckNoOrder();
	public List<Order> CheckOrder();
	public boolean DeletOrder(int id);
	public boolean PayOrder(int id);
	public Order CheckById(int id);
	public boolean UpdateOrder(Order orders);
	

	public List<Order> getAll();
}
