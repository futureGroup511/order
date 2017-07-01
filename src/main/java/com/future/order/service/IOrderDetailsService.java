/**        
 * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:42:51   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.OrderDetails;
import com.future.order.util.PageCut;


/**
 * @author Administrator
 *
 */
public interface IOrderDetailsService {
	public List<OrderDetails> CheckDetails(int id);
	public boolean DeletOrderDetails(int id);
	public boolean DeletDetails(int detailid);
	public OrderDetails CheckById(int detailid);
	public boolean UpdateOrder(OrderDetails details);
	public PageCut<OrderDetails> getPageCut(int currentPage, int pageSize, int orderid);
<<<<<<< HEAD
	public Boolean save(OrderDetails orderDetails);
	public List<OrderDetails> getDetails(int tableId);
=======
	public List<OrderDetails> unfinish();
	public boolean updet(int id);
	public List<OrderDetails> getAll(int id);
>>>>>>> 16a25f24e8b093782a2c8ae8ec4e7dc44c940041

}
