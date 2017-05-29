/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:08   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Menu;

/**
 * @author Administrator
 *
 */
public interface IMenuService {

	public Menu Doorder(int id );


	public Menu get(int id);

	public List<Menu> getAll();

}
