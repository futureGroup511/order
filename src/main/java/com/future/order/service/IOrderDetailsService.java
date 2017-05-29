/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:42:51   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.OrderDetails;


/**
 * @author Administrator
 *
 */
public interface IOrderDetailsService {
	public List<OrderDetails> CheckDetails(int id);
	public boolean DeletOrderDetails(int id);
}
