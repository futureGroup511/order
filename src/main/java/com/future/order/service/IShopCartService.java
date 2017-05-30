/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:41:52   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.ShopCart;

/**
 * @author Administrator
 *
 */
/**
 * @author 安李杰
 *
 */
public interface IShopCartService {

	public List<ShopCart> getAll();

	public boolean delete(int id);

	public boolean deleteAll(ShopCart shopcart);

}
