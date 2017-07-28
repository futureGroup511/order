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
	public boolean deletOrder(int id);
	public boolean payOrder(int id);
	public Order checkById(int id);	//张金高用
	public boolean updateOrder(Order orders);
	public List<Order> getFinal(int tableId,int num);
	public PageCut<Order> getPageCut(int currentPage, int pageSize);
	public PageCut<Order> getNoPageCut(int currentPage, int pageSize);
	public PageCut<Order> getPage(int currentPage, int pageSize);
	public Order get(int tableId);
	public Boolean update(Order order);
	public Boolean save(Order order);
	public List<Order> getAll();
	public boolean deleteOrder(int tableId);
	public List<Order> finish();
	public PageCut<Order> getPagee(int currentPage, int pageSize);
	public PageCut<Order> getPageee(int currentPage, int pageSize);
	public List<Order> getOrder(int tableId);
	public PageCut<Order> searchOrder(String input, int pageSize, int currPage);
	
	public Order getOrder1(int tableId);
	public PageCut<Order> getSomePageCut(int currentPage, int pageSize, String ask, String inquiry);
	public boolean updetemenu(int id, int idd, String UserName);
	public boolean upd(int id);
	public PageCut<Order> getPagegain(int currentPage, int pageSize, String starttime, String endtime, String sign);
	public List<Order> getGain(String starttime, String endtime, String sign);
	public List<Order> getPrice(String ask, String inquiry);
	public boolean delete(int id);
}
