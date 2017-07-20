/**        
z * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:43:20   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.Date;
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
	public Order CheckById(int id);	//张金高用
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
	public List<Order> finish();
	public PageCut<Order> getPagee(int currentPage, int pageSize);
	public PageCut<Order> getPageee(int currentPage, int pageSize);
	public List<Order> getOrder(int tableId);
	public PageCut<Order> searchOrder(String input, int pageSize, int currPage);
	
	public Order getOrder1(int tableId);
	public PageCut<Order> getSomePageCut(int currentPage, int pageSize, String ask, String inquiry);
//	public List<Order> getSomenews();
	public boolean updetemenu(int id, int idd, String UserName);
	public boolean upd(int id);
//	public PageCut<Order> getGain(int currentPage, int pageSize, Date starttime, Date endtime);
//	public PageCut<Order> getNoGain(int currentPage, int pageSize, Date starttime, Date endtime);
	public PageCut<Order> getPagegain(int currentPage, int pageSize, Date starttime, Date endtime, String sign);
	public List<Order> getGain(Date starttime, Date endtime, String sign);
	public List<Order> getPrice(String ask, String inquiry);
}
