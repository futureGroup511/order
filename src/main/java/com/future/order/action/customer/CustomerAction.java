package com.future.order.action.customer;


import java.util.List;


import com.future.order.base.BaseAction;

import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.MenuType;
import com.future.order.entity.Order;
import com.future.order.entity.ShopCart;
import com.future.order.entity.StockDetails;

/**
 * @author 安李杰 
 *
 */

public class CustomerAction extends BaseAction {

	/**这里写了用于对于菜单的信息显示获取菜单的详细信息的action
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int id;
		
	//进入首页
	public String toIndex() throws Exception{
		//把顾客桌号存在session
		session.put("tableId", id);
		System.out.println("桌号:"+id);
		//获得推荐的菜品
		List<Menu> menus=menuService.getRecommend(8);
		session.put("menus", menus);
		return "toIndex";
	}
	//根据菜品类型id获得菜品
	public String getMenuByTypeId() throws Exception{
		List<Menu> menus=menuService.getByTypeId(id);
		session.put("menus", menus);
		return "getMenuByTypeId";
	}
	//获得菜品详情和菜品配料
	public String getMenuMaterial() throws Exception {		
		Menu menu =menuService.get(id);
		request.put("menu", menu);
		List<MenuMaterial> menumaterials=menuMaterialService.getByMenuId(id);		
		request.put("menumaterials",menumaterials);	
		return "getMenuMaterial";
	}
	//获得进货时间列表
	public String getStockDate() throws Exception {
		List<StockDetails> stockDetails=stockDetailsService.getByIngId(id);
		request.put("stockDetails", stockDetails);
		return "getStockDate";
	}
	//加入购物车
	public String joinCart() throws Exception {
		Menu menu=menuService.get(id);
		int tableId=(int) session.get("tableId");
		String tableName=tablesService.get(tableId).getName();		
		ShopCart shopCart=new ShopCart(tableId, tableName, id, menu.getName(), 1, menu.getPrice());
		Boolean bool=shopCartService.add(shopCart);
		
		return "joinCart";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	

/*	public String getMenuMaterial() throws Exception {
		List<MenuMaterial> list=menuMaterialService.getAll();
		request.put("MenuMaterial",list);
		System.out.println(list);
		return "getMenuMaterial";
	}
	
	
	public String getMenu() throws Exception {
		List<Menu> list=menuService.getAll();
		request.put("menu",list);
		System.out.println(list);
		return "getMenu";
	}
	public String getMenuType() throws Exception{
		System.out.println("446545");
		List<MenuType> list=menuTypeService.getAllMenuType();
		request.put("list",list);
		System.out.println(list);
		return "getMenuType";
	}
	
	public String getOrder() throws Exception {
		List<Order> list=orderService.getAll();
		request.put("order",list);
		return "getOrder";
	}

	
	public String ByName() throws Exception{
		List<Menu> menu=menuService.ByName(name);
		request.put("menu",menu);
		return "ByName";
	}



	public String menu() throws Exception {				
		Menu menu=menuService.get(id);		
		List<MenuMaterial> list=menuMaterialService.getByMenuId(id);
		request.put("menu",menu);
		request.put("list",list);
		return "menu";
	}
	
	public String StockDetails() throws Exception {
		List<StockDetails> list1=stockDetailsService.getBycreateDate(ingId);
		request.put("list1",list1);
		System.out.println(list1);
		return "StockDetails";
	}
*/
}
