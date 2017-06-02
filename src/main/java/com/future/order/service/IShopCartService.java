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
	
	//焦祥宇加
	//把菜品加入购物车
	public boolean add(ShopCart shopCart);
	//根据桌号id获得购物车菜品
	public List<ShopCart> getByTableId(int tableId);
	//根据桌号id和菜品id
	public ShopCart getByT_M_Id(int tableId,int menuId);
}
