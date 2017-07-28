
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
	public boolean deletOrderDetails(int id);
	public boolean deletDetails(int detailid);
	public OrderDetails checkById(int detailid);
	public boolean updateOrder(OrderDetails details);
	public PageCut<OrderDetails> getPageCut(int currentPage, int pageSize, int orderid);
	public Boolean save(OrderDetails orderDetails);
	public List<OrderDetails> getDetails(int tableId);
	public List<OrderDetails> unfinish();
	public List<OrderDetails> getAll(int id);
	public OrderDetails getByTableId(int tableId);
	public Boolean updatee(OrderDetails en);
	public boolean updateOrerDetails(int id);
	public List<OrderDetails> getDetailsOne(int orderId);
	public PageCut<OrderDetails> getUnfinishPageCut(int currentPage, int pageSize);//wqj 查看未完成菜品
	public PageCut<OrderDetails> searchOrder(String input, int pageSize, int currPage);//wqj 模糊查询
	public List<OrderDetails> seeByid(int id);

	public OrderDetails getDetaill(int tableId);
	public List<OrderDetails> getDetailsTwo(int orderId);

	public PageCut<OrderDetails> Check(int tableId, int currentPage, int pageSize);//由餐桌ID查询餐桌信息
	public boolean updet(int id, int idd, String UserName);
	public List<OrderDetails> CheckDe(int id);
	public boolean back(int id);
	public OrderDetails checkStatus(int id);
	public int getSomenum(int id);
}
	

