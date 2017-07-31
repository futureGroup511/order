/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:53   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Inform;
import com.future.order.entity.Order;
import com.future.order.util.PageCut;
import com.future.order.entity.Inform;

/**
 * @author Administrator
 *
 */
public interface IInformService {

	public List<Inform> getAll();
	Boolean save(Inform inform);
	//wqj催单
	public PageCut<Inform> getPageCut(int curr, int pageSize);
	//wqj催单前三条
	public List<Inform> getTop();

}
