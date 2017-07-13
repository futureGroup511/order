package com.future.order.action.customer;
import java.util.*;
import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
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
	private int menuNum;
	
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
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
		double total = 0.0;
		Order orde=new Order();
		for (ShopCart item : shopCarts) {
			total += item.getMenuNum() * item.getPrice();
		}
		for (ShopCart item : shopCarts) {
			orde.setTotal(total);
			orde.setTableName(item.getTableName());
			orde.setTableId(item.getTableId());
			orde.setStatus("未完成");
		}
		Boolean bool = orderService.save(orde);
		List<Order> orders=orderService.getOrder(tableId);
		Order order=orderService.CheckById(id);
		List<OrderDetails> orderDetail = orderDetailsService.getDetailsOne(id);
		OrderDetails orderDetails = new OrderDetails();
		if (orderDetail.isEmpty()) {
			for (ShopCart item : shopCarts) {
				for(Order it:orders){
					orderDetails.setMenuId(item.getMenuId());
					orderDetails.setTableName(item.getTableName());
					orderDetails.setMenuName(item.getMenuName());
					orderDetails.setMenuNum(item.getMenuNum());
					orderDetails.setTableId(item.getTableId());
					orderDetails.setOrderId(it.getId());
					orderDetails.setStatus(it.getStatus());
					Boolean booll = orderDetailsService.save(orderDetails);
				}
			}
		} else {
			for (OrderDetails en : orderDetail) {
				for (ShopCart item : shopCarts) {
					for(Order it:orders){
						if(en.getStatus().equals("完成")){
								int sign = 0;
								if (item.getMenuName().equals(en.getMenuName())) {
									sign = 1;
									en.setMenuNum(en.getMenuNum() + item.getMenuNum());
									Boolean boolq = orderDetailsService.updatee(en);
								}else if (sign == 0) {
									orderDetails.setMenuId(item.getMenuId());
									orderDetails.setTableName(item.getTableName());
									orderDetails.setMenuName(item.getMenuName());
									orderDetails.setMenuNum(item.getMenuNum());
									orderDetails.setTableId(item.getTableId());
									orderDetails.setOrderId(it.getId());
									orderDetails.setStatus(it.getStatus());
									System.out.println("6666");
									Boolean boola = orderDetailsService.save(orderDetails);
								}
					   }else if(en.getStatus().equals("未完成")){
						   int sign = 0;
						   if (item.getMenuName().equals(en.getMenuName())) {
								sign = 1;
								en.setMenuNum(en.getMenuNum() + item.getMenuNum());
								Boolean boold = orderDetailsService.updatee(en);
						   }else if (sign == 0) {
								orderDetails.setMenuId(item.getMenuId());
								orderDetails.setTableName(item.getTableName());
								orderDetails.setMenuName(item.getMenuName());
								orderDetails.setMenuNum(item.getMenuNum());
								orderDetails.setTableId(item.getTableId());
								orderDetails.setOrderId(it.getId());
								orderDetails.setStatus(it.getStatus());
								System.out.println("6666");
								Boolean boolt = orderDetailsService.save(orderDetails);
						}
				}
		}
				}
			}
		}
		List<OrderDetails> orderDetailss = orderDetailsService.getDetailsOne(id);
		request.put("orderDetails", orderDetailss);
		boolean bools = shopCartService.deleteAllCart(tableId);
		return "getHand";
	}
	//生成订单
	public String getOrder() throws Exception {
		int tableId = (int) session.get("userId");
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
		double total = 0.0;
		Order order=new Order();
		for (ShopCart item : shopCarts) {
			total += item.getMenuNum() * item.getPrice();
		}
		for (ShopCart item : shopCarts) {
			order.setTotal(total);
			order.setTableName(item.getTableName());
			order.setTableId(item.getTableId());
			order.setStatus("未完成");
		}
		Boolean bool = orderService.save(order);
		List<Order> orders=orderService.getOrder(tableId);
		System.out.println(orders+"I Love You");
		return "getOrder";
	}
/*
	// 购物车的菜品数量update 计算总价
	public String updateCart() throws Exception {
		ShopCart shopCart = shopCartService.getOne(id);
		Boolean bool = shopCartService.update(shopCart);
		List<ShopCart> shopCarts = shopCartService.getByAll();
		double total = 0.0;
		for (ShopCart item : shopCarts) {
			total += item.getMenuNum() * item.getPrice();
		}
		System.out.println(total);
		session.put("total", total);
		 //以流的形式返回新的总价格
        ByteArrayInputStream inputStream = new ByteArrayInputStream(total.getBytes());
        return "stream";
		
	}*/
	
	// 删除购物车的菜品
	public String deleteCart() throws Exception {
		int tableId = (int) session.get("userId");
		boolean bool = shopCartService.delete(id);
		boolean bool1 = orderService.deleteOrder(tableId);
		List<ShopCart> shopCarts = shopCartService.getByAll();
		request.put("shopCarts", shopCarts);
		return "deleteCart";
	}
	
	// 查询订单详情
	public String getOrderDetails() throws Exception {
		int tableId = (int) session.get("userId");
		List<OrderDetails> orderDetails = orderDetailsService.getDetails(tableId);
		System.out.println(orderDetails);
		request.put("orderDetails", orderDetails);
		return "getOrderDetails";
	}

	// 菜品数量的增加
	public String add() throws Exception {
		ShopCart shopCart = shopCartService.getOne(id);
		shopCart.setMenuNum(shopCart.getMenuNum() + 1);
		Boolean bool = shopCartService.update(shopCart);
		List<ShopCart> shopCarts = shopCartService.getByAll();
		double total = 0.0;
		for (ShopCart item : shopCarts) {
			total += item.getMenuNum() * item.getPrice();
		}
		System.out.println(total);
		request.put("total", total);
		request.put("shopCarts", shopCarts);
		return "add";
	}

	// 菜品数量的减少
	public String reduce() throws Exception {
		ShopCart shopCart = shopCartService.getOne(id);
		if (shopCart.getMenuNum() >= 1) {
			shopCart.setMenuNum(shopCart.getMenuNum() - 1 );
		}
		Boolean bool = shopCartService.update(shopCart);
		List<ShopCart> shopCarts = shopCartService.getByAll();
		double total = 0.0;
		for (ShopCart item : shopCarts) {
			total += item.getMenuNum() * item.getPrice();
		}
		System.out.println(total);
		request.put("total", total);
		request.put("shopCarts", shopCarts);
		return "reduce";
	}

	// 催单
	public String getReminder() throws Exception {
		int tableId = (int) session.get("userId");
		String tableName = tablesService.get(tableId).getName();
		Date d = new Date();
		Inform inform = new Inform();
		inform.setContent("顾客催单，请尽快做好");
		inform.setCreateDate(d);
		inform.setTableId(tableId);
		inform.setTableName(tableName);
		Boolean bool = informService.save(inform);
		System.out.println("233323");
		if (bool == true) {
			request.put("addMeg", "催单成功");
		} else {
			request.put("addMeg", "催单失败");
		}
		System.out.println("23333");
		return getHand();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}
}
