package com.future.order.action.customer;
import java.util.List;
import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.Restaurant;
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
		session.put("userId", id);
		System.out.println("桌号:"+id);
		//获得推荐的菜品
		List<Menu> menus=menuService.getRecommend(8);
		//首页酒店的信息
		Restaurant r= restaurantService.getOne();
		session.put("r",r);
		System.out.println(r+"88");
		System.out.println(menus);
		session.put("menus", menus);
		System.out.println("123");
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
		List<MenuMaterial> menuMaterial=menuMaterialService.getByMenuId(id);
		System.out.println(menuMaterial+"999999");
		request.put("menuMaterial",menuMaterial);	
		return "getMenuMaterial";
	}
	//获得进货时间列表
	public String getStockDate() throws Exception {
		List<StockDetails> stockDetails=stockDetailsService.getByIngId(id,5);
		request.put("stockDetails", stockDetails);
		return "getStockDate";
	}
	//加入购物车
	public String joinCart() throws Exception {
		Menu menu=menuService.get(id);
		int tableId=(int) session.get("userId");//获得顾客桌号		
		System.out.println("tableId"+tableId);
		String tableName=tablesService.get(tableId).getName();//根据顾客桌号取得桌子的名称	
		ShopCart shopCart=shopCartService.getByT_M_Id(tableId, menu.getId());//根据顾客的桌号和菜单的id获得购物车中的对应信息
		if(shopCart==null){
			shopCart=new ShopCart(tableId, tableName,id, menu.getName(), 1, menu.getPrice());		
		}else{
			shopCart.setMenuNum(shopCart.getMenuNum()+1);
		}
		Boolean bool=shopCartService.update(shopCart);
		if(bool==true){
			request.put("addMeg", "添加成功！");
		}else{
			request.put("addMeg", "添加失败！");
		}

		return "joinCart";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
