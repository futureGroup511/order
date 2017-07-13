
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
	public Boolean save(OrderDetails orderDetails);
	public List<OrderDetails> getDetails(int tableId);
	public List<OrderDetails> unfinish();
	public boolean updet(int id);
	public List<OrderDetails> getAll(int id);
	public OrderDetails getByTableId(int tableId);
	public Boolean updatee(OrderDetails en);
	public boolean updateOrerDetails(int id);
	public List<OrderDetails> getDetailsOne(int orderId);
	public PageCut<OrderDetails> getPagee(int currentPage, int pageSize);
	public List Check(int detailid);
	public List<OrderDetails> SeeByid(int id);}
//=======
//import java.util.List;
//
//import com.future.order.entity.OrderDetails;
//import com.future.order.util.PageCut;
//
//
///**
// * @author Administrator
// *
// */
//public interface IOrderDetailsService {
//	public List<OrderDetails> CheckDetails(int id);
//	public boolean DeletOrderDetails(int id);
//	public boolean DeletDetails(int detailid);
//	public OrderDetails CheckById(int detailid);
//	public boolean UpdateOrder(OrderDetails details);
//	public PageCut<OrderDetails> getPageCut(int currentPage, int pageSize, int orderid);
//	public Boolean save(OrderDetails orderDetails);
//	public List<OrderDetails> getDetails(int tableId);
//	public List<OrderDetails> unfinish();
//	public boolean updet(int id);
//	public List<OrderDetails> getAll(int id);
//	public boolean updateOrerDetails(int id);
//
//	public OrderDetails getByTableId(int tableId);
//	public PageCut<OrderDetails> getPagee(int currentPage, int pageSize);
//	public List Check(int detailid);
//	
//
//}
//=======
///**        
// * @author: 焦祥宇 马黎明
// * @date:   createDate：2017年5月22日 上午10:42:51   
// * @Description:  
// * 
// */  
//package com.future.order.service;
//
//import java.util.List;
//
//import com.future.order.entity.OrderDetails;
//import com.future.order.util.PageCut;
//
//
///**
// * @author Administrator
// *
// */
//public interface IOrderDetailsService {
//	public List<OrderDetails> CheckDetails(int id);
//	public boolean DeletOrderDetails(int id);
//	public boolean DeletDetails(int detailid);
//	public OrderDetails CheckById(int detailid);
//	public boolean UpdateOrder(OrderDetails details);
//	public PageCut<OrderDetails> getPageCut(int currentPage, int pageSize, int orderid);
//	public Boolean save(OrderDetails orderDetails);
//	public List<OrderDetails> getDetails(int tableId);
//	public List<OrderDetails> unfinish();
//	public boolean updet(int id);
//	public List<OrderDetails> getAll(int id);
//	public boolean updateOrerDetails(int id);
//
//	public OrderDetails getByTableId(int tableId);
//}

/*=======
	public List<OrderDetails> getDetailsOne(int tableId);
	public List Check(int detailid);
	public PageCut<OrderDetails> getPagee(int currentPage, int pageSize);
	public List<OrderDetails> SeeByid(int id);
}
>>>>>>> 095392372c25fff394c8303c659facb677aa2e84
*/