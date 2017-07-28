
/**        
 * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:42:51   
 * @Description:  
 * 
 */  
package com.future.order.service;


import java.util.List;


import com.future.order.entity.OrderDetails;


import java.util.List;

import com.future.order.entity.OrderDetails;

import com.future.order.util.PageCut;

public interface IOrderDetailsService {
	public List<OrderDetails> CheckDetails(int id);
	public boolean DeletOrderDetails(int id);
	public boolean DeletDetails(int detailid);
	public OrderDetails CheckById(int detailid);
	public boolean UpdateOrder(OrderDetails details);
	public PageCut<OrderDetails> getPageCut(int currentPage, int pageSize, int orderid);
	//安李杰用
	public Boolean save(OrderDetails orderDetails);
	//安李杰用
	public List<OrderDetails> getDetails(int tableId);
	public List<OrderDetails> unfinish();
	public List<OrderDetails> getAll(int id);
	public OrderDetails getByTableId(int tableId);
	//安李杰用
	public Boolean updatee(OrderDetails en);
	public boolean updateOrerDetails(int id);
	//安李杰用
	public List<OrderDetails> getDetailsOne(int orderId);
	public PageCut<OrderDetails> getPagee(int currentPage, int pageSize);
	public List<OrderDetails> SeeByid(int id);
	public PageCut<OrderDetails> searchOrder(String input, int pageSize, int currPage);

	public OrderDetails getDetaill(int tableId);
	//安李杰用
	public List<OrderDetails> getDetailsTwo(int orderId);

	public PageCut<OrderDetails> Check(int tableId, int currentPage, int pageSize);
	public boolean updet(int id, int idd, String UserName);
	public List<OrderDetails> CheckDe(int id);
	//安李杰用
	public boolean back(int id);
	//获取菜单祥情中菜的状态安李杰用
	public OrderDetails checkStatus(int id);
	public int getSomenum(int id);
}
	

