/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:41:52   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Menu;
import com.future.order.entity.ShopCart;
import com.future.order.util.PageCut;

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
	//安李杰加 删除购物车中的菜
	public boolean delete(int id);

	public boolean deleteAll(ShopCart shopcart);
	
	//焦祥宇加
	
	public boolean add(ShopCart shopCart);
	//根据桌号id获得购物车菜品安李杰加
	public List<ShopCart> getByTableId(int tableId);//金高用
	//根据桌号id和菜品id 安李杰加
	public ShopCart getByT_M_Id(int tableId,int menuId);
	//把菜品加入购物车 安李杰加
	public boolean update(ShopCart shopCart);
	public ShopCart getBy(int tableId);
	//安李杰加 根据id去查购物车
	public ShopCart getOne(int id);

	public List<ShopCart> getByAll();
	//金高加
	//删除某一种菜
	public boolean deleteShopCart(ShopCart shopCart);
	//提交购物车并清空购物车
	public boolean  submitToOrder(int tableId);
	//更改菜的数量
	public boolean updeteNum(int id,String msg);
	//安李杰加 清空购物车
	public boolean deleteAllCart(int tableTd);
}
