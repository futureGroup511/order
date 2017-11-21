package com.future.order.action.customer;
import java.util.List;
import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.MenuType;
import com.future.order.entity.Restaurant;
import com.future.order.entity.ShopCart;
import com.future.order.entity.StockDetails;
import com.future.order.entity.Tables;
/**
 * @author 安李杰 
 *
 */

public class CustomerAction extends BaseAction {

	/**这里写了用于对于菜单的信息显示获取菜单的详细信息的action
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//接受前台传过来的id信息
	private int id;
	//接受前台传过来的配料id信息
	private int ingId;	
	//进入首页
	public String toIndex() throws Exception{
		//把顾客桌号存在session
		session.put("userId", id);
		//获得推荐的菜品
		List<Menu> menus=menuService.getRecommend(8);
		//首页酒店的信息 下同
		Restaurant r= restaurantService.getOne();
		request.put("r",r);
		//获得所有的菜品的类型下同
		List<MenuType> menuType=menuTypeService.getAllMenuType();
		request.put("menuType",menuType);
		request.put("menus", menus);
		//根据桌号去修改桌子的状态
		Tables table=tablesService.get(id);
		table.setStatus("有人");
		tablesService.updateTable(table);
		return "toIndex";
	}
	//根据菜品类型id获得菜品
	public String getMenuByTypeId() throws Exception{
		//根据菜品类型id获得菜品
		List<Menu> menus=menuService.getByTypeId(id);
		Restaurant r= restaurantService.getOne();
		request.put("r",r);
		List<MenuType> menuType=menuTypeService.getAllMenuType();
		request.put("menuType",menuType);
		request.put("menus", menus);
		return "getMenuByTypeId";
	}
	//获得菜品详情和菜品原料
	public String getMenuMaterial() throws Exception {		
		//根据前台传过来的id去获取每道菜的信息
		Menu menu =menuService.get(id);
		request.put("menu", menu);
		//根据Menu中的id去获取菜单详情中的原料信息
		List<MenuMaterial> menuMaterial=menuMaterialService.getByMenuIdTwo(id);
		//关联表获得原料介绍
		for(MenuMaterial item:menuMaterial){
			int ingId=item.getIngId();
			String introduce=ingerdientService.getById(ingId).getIntroduce();
			item.setIntroduce(introduce);
		}
		request.put("menuMaterial",menuMaterial);
		return "getMenuMaterial";
	}
	//获得进货时间列表
	public String getStockDate() throws Exception {
		List<StockDetails> stockDetails=stockDetailsService.getByIngId(ingId,2);
		request.put("stockDetails", stockDetails);
		//获得进货详情中配料名单独显示
		for(StockDetails item:stockDetails){
			request.put("ingName",item.getIngName());
		}
		return "getStockDate";
	}
	//加入购物车
	public void joinCart() throws Exception {
		Menu menu=menuService.get(id);
		//获得顾客桌号	
		int tableId=(int) session.get("userId");
		//判断配料是否足够
		ShopCart sCart=shopCartService.getByT_M_Id(tableId, id);
		int menuNum=1;
		if(sCart!=null){
			menuNum=sCart.getMenuNum()+1;
		}
		List<MenuMaterial> menuMaterials=menuMaterialService.getByMenuId(id);
		Boolean enough=true;
		for(MenuMaterial m : menuMaterials){
			Ingredient ingredient=ingerdientService.getById(m.getIngId());
			if(m.getNum()*menuNum>ingredient.getNum()){
				this.getResponse().getWriter().println("0");
				enough=false;
				break;
			}
			
		}	
		if(enough){
			String tableName=tablesService.get(tableId).getName();//根据顾客桌号取得桌子的名称	
			ShopCart shopCart=shopCartService.getByT_M_Id(tableId, menu.getId());//根据顾客的桌号和菜单的id获得购物车中的对应信息
			if(shopCart==null){
				shopCart=new ShopCart(tableId, tableName,id, menu.getName(), 1, menu.getPrice(),menu.getImgUrl());		
			}else{
				shopCart.setMenuNum(shopCart.getMenuNum()+1);
			}
			Boolean bool=shopCartService.update(shopCart);
			if(bool==true){
				this.getResponse().getWriter().println("1");
			}		
		}			
	}
	
	//一些set get方法
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIngId() {
		return ingId;
	}
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	
}
