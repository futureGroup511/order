/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:44:36   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Ingredient;


/**
 * @author Administrator
 *
 */
public interface IIngerdientService {
	public Ingredient get(int id);

	public List<Ingredient> getAll();
}
