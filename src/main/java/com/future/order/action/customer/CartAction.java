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
	// 生成订单详情
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
			Boolean bool = orderService.update(orders);
			Order orderss=orderService.getOrder1(tableId);
			session.put("Id",orderss.getId());
		}else{
				session.put("Id",orders.getId());
		}
		int myId=(int) session.get("Id");
		Order order=orderService.CheckById(myId);
		List<OrderDetails> orderDetail = orderDetailsService.getDetailsTwo(myId);
		OrderDetails orderDetails = new OrderDetails();
		if (orderDetail.isEmpty()) {
			for (ShopCart item : shopCarts) {
					orderDetails.setMenuId(item.getMenuId());
					orderDetails.setTableName(item.getTableName());
					orderDetails.setMenuName(item.getMenuName());
					orderDetails.setMenuNum(item.getMenuNum());
					orderDetails.setTableId(item.getTableId());
					orderDetails.setOrderId(myId);
					orderDetails.setStatus("未完成");
					orderDetails.setPrice(item.getPrice());
					orderDetails.setImgUrl(item.getImgUrl());
					orderDetails.setRemark(order.getRemark());
					orderDetails.setCreatDate(d);
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
					    orderDetails.setMenuId(item.getMenuId());
						orderDetails.setTableName(item.getTableName());
						orderDetails.setMenuName(item.getMenuName());
						orderDetails.setMenuNum(item.getMenuNum());
						orderDetails.setTableId(item.getTableId());
						orderDetails.setOrderId(order.getId());
						orderDetails.setStatus("未完成");
						orderDetails.setPrice(item.getPrice());
						orderDetails.setImgUrl(item.getImgUrl());
						orderDetails.setRemark(order.getRemark());
						orderDetails.setCreatDate(d);
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
		List<ShopCart> shopCarts = shopCartService.getByAll();
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
		System.out.println("munuId="+shopCart.getMenuId());
		List<MenuMaterial> menuMaterials=menuMaterialService.getByMenuId(shopCart.getMenuId());
		System.out.println(menuMaterials);
		Boolean enough=true;
		for(MenuMaterial m : menuMaterials){
			Ingredient ingredient=ingerdientService.getById(m.getIngId());
			if(m.getNum()*(shopCart.getMenuNum() + 1)>ingredient.getNum()){
				System.out.println("配料不足1");
				this.getResponse().getWriter().println("0");
				System.out.println("配料不足2");				
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
			System.out.println("id"+id+bool);
			System.out.println(total);
		}			
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
