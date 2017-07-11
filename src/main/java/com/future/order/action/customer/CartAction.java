package com.future.order.action.customer;

import java.util.*;
import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
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

	// 获得购物车菜品
	public String execute() throws Exception {
		int tableId = (int) session.get("userId");
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
		if (!shopCarts.isEmpty()) {
			double total = 0.0;
			for (ShopCart item : shopCarts) {
				total += item.getMenuNum() * item.getPrice();
			}
			request.put("total", total);
			request.put("shopCarts", shopCarts);
			return "success";
		} else {
			return "error";
		}
	}
	// 生成订单
	public String getHand() throws Exception {
		int tableId = (int) session.get("userId");
		List<ShopCart> shopCarts = shopCartService.getByTableId(tableId);
		List<OrderDetails> orderDetail = orderDetailsService.getDetailsOne(tableId);
		OrderDetails orderDetails = new OrderDetails();
		if (orderDetail.isEmpty()) {
			for (ShopCart item : shopCarts) {
				orderDetails.setMenuId(item.getMenuId());
				orderDetails.setTableName(item.getTableName());
				orderDetails.setMenuName(item.getMenuName());
				orderDetails.setMenuNum(item.getMenuNum());
				orderDetails.setTableId(item.getTableId());
				orderDetails.setStatus("未完成");
				Boolean bool = orderDetailsService.save(orderDetails);
			}
		} else {
			for (ShopCart item : shopCarts) {
				int sign = 0;
				for (OrderDetails en : orderDetail) {
					if (item.getMenuName().equals(en.getMenuName())) {
						sign = 1;
						en.setMenuNum(en.getMenuNum() + item.getMenuNum());
						Boolean bool = orderDetailsService.update(en);
					}
				}
				if (sign == 0) {
					orderDetails.setMenuId(item.getMenuId());
					orderDetails.setTableName(item.getTableName());
					orderDetails.setMenuName(item.getMenuName());
					orderDetails.setMenuNum(item.getMenuNum());
					orderDetails.setTableId(item.getTableId());
					orderDetails.setStatus("未完成");
					System.out.println("6666");
					Boolean bool = orderDetailsService.save(orderDetails);
				}
			}
		}
		List<OrderDetails> orderDetailss = orderDetailsService.getDetails(tableId);
		request.put("orderDetails", orderDetailss);
		boolean bool = shopCartService.deleteAllCart(tableId);
		return "getHand";
	}

	// 购物车的菜品数量update
	public String updateCart() throws Exception {

		return "updateCart";
	}

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
			shopCart.setMenuNum(shopCart.getMenuNum() - 1);
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

}
