package com.future.order.action.customer;
import java.util.*;
import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.ShopCart;
import com.future.order.entity.Tables;

/**
 * @author 安李杰
 *
 */
/**
 * 
 *
 */
public class CartAction extends BaseAction {

	/**
	 * 对购物车进行操作
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	// 获得购物车菜品
	public String getCart() throws Exception {
		int tableId = (int) session.get("userId");
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
			double total = 0.0;
			for (ShopCart item : shopCarts) {
				total += item.getMenuNum() * item.getPrice();
			}
			request.put("total", total);
			request.put("shopCarts", shopCarts);
			return "getCart";
	}
	// 提交订单
	public String getHand() throws Exception {
		int tableId = (int) session.get("userId");	
		if(name==null){
			name="原味";
		}
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
		Order orders=orderService.getOrder1(tableId);
		Date d = new Date();
		double total = 0.0;
		if(orders==null||orders.getStatus().equals("已付款")){
			Order order=new Order();
			for (ShopCart item : shopCarts) {
				total += item.getMenuNum() * item.getPrice();
			}
			for (ShopCart item : shopCarts) {
				order.setTotal(total);
				order.setTableName(item.getTableName());
				order.setTableId(item.getTableId());
				order.setRemark(name);
				order.setCookName("");
				order.setStatus("未处理");
				order.setCreateDate(d);
			}
			Boolean bool = orderService.update(order);
			Order orderss=orderService.getOrder1(tableId);
			session.put("Id",orderss.getId());
		}else if(orders.getStatus().equals("未付款")){
			orders.setStatus("未处理");
			orders.setRemark(name);
			Boolean bool = orderService.update(orders);
			Order orderss=orderService.getOrder1(tableId);
			session.put("Id",orderss.getId());
		}else{
			orders.setRemark(name);
			Boolean bool = orderService.update(orders);
			session.put("Id",orders.getId());
		}
		int myId=(int) session.get("Id");
		Order order=orderService.CheckById(myId);
		List<OrderDetails> orderDetail = orderDetailsService.getDetailsTwo(myId);
		
		if (orderDetail.isEmpty()) {
			for (ShopCart item : shopCarts) {
				OrderDetails orderDetails = new OrderDetails(item.getTableId(),item.getTableName(),myId,item.getMenuId(),item.getMenuName(),item.getMenuNum(),"未完成",d,order.getRemark(),item.getImgUrl(),item.getPrice());
					Boolean booll = orderDetailsService.save(orderDetails);
			}
		} else {
			for (ShopCart item : shopCarts) {
				  int sign = 0;
				for (OrderDetails en : orderDetail) {
					if (item.getMenuName().equals(en.getMenuName())) {
						sign = 1;
						en.setMenuNum(en.getMenuNum() + item.getMenuNum());
						Boolean bool = orderDetailsService.updatee(en);
					}
				}
				if (sign == 0) {
					OrderDetails orderDetails = new OrderDetails(item.getTableId(),item.getTableName(),myId,item.getMenuId(),item.getMenuName(),item.getMenuNum(),"未完成",d,order.getRemark(),item.getImgUrl(),item.getPrice());
						Boolean boolt = orderDetailsService.save(orderDetails);
				  }
			}
		}
		List<OrderDetails> orderDetailss = orderDetailsService.getDetailsOne(myId);
		List<Menu> menu=menuService.getAll();
		double totall=0;
		for(OrderDetails it:orderDetailss){
			totall+=it.getPrice()*it.getMenuNum();
			for(Menu m:menu){
				if(m.getName().equals(it.getMenuName())){
					m.setNum(m.getNum()+it.getMenuNum());
					Boolean bool =menuService.update(m);
				}
			}
		}
		order.setTotal(totall);
		boolean bool=orderService.update(order);
		request.put("order",order.getStatus());
		request.put("myId", myId);
		request.put("totall", totall);
		request.put("orderDetails", orderDetailss);
		boolean bools = shopCartService.deleteAllCart(tableId);
		return "getHand";
	}
	
	// 删除购物车的菜品
	public String deleteCart() throws Exception {
		int tableId = (int) session.get("userId");
		boolean bool = shopCartService.delete(id);
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
		double total = 0.0;
		for(ShopCart item:shopCarts){
			total += item.getMenuNum() * item.getPrice();
		}
		request.put("total",total);
		request.put("shopCarts", shopCarts);
		return "deleteCart";
	}
	
	// 查询订单详情
	public String getOrderDetails() throws Exception {
		int tableId = (int) session.get("userId");
		Order orders=orderService.getOrder1(tableId);
		if(orders==null||orders.getStatus().equals("已付款")){
			List<OrderDetails> orderDetails = orderDetailsService.getDetails(0);
			request.put("orderDetails",orderDetails);
		
		}else{
			List<OrderDetails> orderDetails = orderDetailsService.getDetailsOne(orders.getId());
			request.put("order",orders.getStatus());
			request.put("orderDetails", orderDetails);
			request.put("myId", orders.getId());
			double totall=0;
			for(OrderDetails it:orderDetails){
				totall+=it.getPrice()*it.getMenuNum();
			}
			request.put("totall",totall);
		}
			return "getOrderDetails";
	}

	// 菜品数量的增加
	public void add() throws Exception {
		ShopCart shopCart = shopCartService.getOne(id);
		//判断该菜原料是否够
		List<MenuMaterial> menuMaterials=menuMaterialService.getByMenuId(shopCart.getMenuId());
		Boolean enough=true;
		for(MenuMaterial m : menuMaterials){
			Ingredient ingredient=ingerdientService.getById(m.getIngId());
			if(m.getNum()*(shopCart.getMenuNum() + 1)>ingredient.getNum()){
				this.getResponse().getWriter().println("0");
				enough=false;
				break;
			}
			
		}	
		if(enough){
			//菜品数量加一	
			shopCart.setMenuNum(shopCart.getMenuNum() + 1);
			Boolean bool=shopCartService.update(shopCart);			
			int tableId=(Integer)session.get("userId");
			List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
			double total = 0.0;
			for (ShopCart item : shopCarts) {
				total += item.getMenuNum() * item.getPrice();
			}
			this.getResponse().getWriter().println(total);
		}			
	}
	
	

	//顾客退菜
	public String getBack() throws Exception{
		int tableId=(int)session.get("userId");
		OrderDetails orderDetail=orderDetailsService.checkStatus(id);
		if(orderDetail.getStatus().equals("已完成")){
			String info="该菜已完成,退不了";
			request.put("stat",info);
		}else{
			boolean bool=orderDetailsService.back(id);
			String info="退菜成功！";
			request.put("stat",info);
		}
		Order order=orderService.getOrder1(tableId);
		List<OrderDetails> orderDetails = orderDetailsService.getDetailsOne(order.getId());
		if(orderDetails.isEmpty()){
			List<OrderDetails> orderDetaill = orderDetailsService.getDetails(0);
			Tables table=tablesService.get(tableId);
			table.setStatus("无人");
			boolean bool=tablesService.updateTables(table);
			boolean booll=orderService.deleteOrder(tableId);
			request.put("orderDetails",orderDetaill);
		}else{
			request.put("order",order.getStatus());
			request.put("orderDetails", orderDetails);
			request.put("myId", order.getId());
			double totall=0;
			for(OrderDetails it:orderDetails){
				totall+=it.getPrice()*it.getMenuNum();
			}
			order.setTotal(totall);
			boolean bool=orderService.update(order);
			request.put("totall",totall);
		}
		return "getBack";
	}
	
	
	// 菜品数量的减少
	public void reduce() throws Exception {
		ShopCart shopCart = shopCartService.getOne(id);	
		if(shopCart.getMenuNum()>1){
			shopCart.setMenuNum(shopCart.getMenuNum() - 1 );		
			shopCartService.update(shopCart);
			int tableId=(Integer)session.get("userId");
			List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
			double total = 0.0;
			for (ShopCart item : shopCarts) {
				total += item.getMenuNum() * item.getPrice();
			}
			this.getResponse().getWriter().println(total);
		}		
	}
	
	//利用ajax实现催单功能
	public void Reminder() throws Exception {
		int tableId = (int) session.get("userId");
		String tableName = tablesService.get(tableId).getName();
		Date d = new Date();
		Inform inform = new Inform();
		inform.setContent("顾客催单，请尽快做好");
		inform.setCreateDate(d);
		inform.setTableId(tableId);
		inform.setTableName(tableName);
		Boolean bool = informService.save(inform);
		List<Inform> informm=informService.getAll();
		if(!informm.isEmpty()){
			this.getResponse().getWriter().println(1);
		}else{
			this.getResponse().getWriter().println(0);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
}
