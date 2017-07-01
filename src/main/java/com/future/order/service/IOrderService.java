/**        
z * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:43:20   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Order;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 *
 */
public interface IOrderService {

	public boolean DeletOrder(int id);
	public boolean PayOrder(int id);
	public Order CheckById(int id);
	public boolean UpdateOrder(Order orders);
	
	public List<Order> getFinal(int tableId,int num);
	public PageCut<Order> getPageCut(int currentPage, int pageSize);
	public PageCut<Order> getNoPageCut(int currentPage, int pageSize);
	public PageCut<Order> getPage(int currentPage, int pageSize);
	public Order get(int tableId);
	public Boolean update(Order order);
	public Boolean save(Order order);
	public List<Order> getAll();
	public boolean deleteOrder(int tableId);
	public boolean updetemenu(int id);//wqj
	public List<Order> finish();
}
