package com.future.order.action.cook;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Menu;
import com.future.order.entity.Order;

/**
 * @author by王青杰
 * @version 创建时间：2017年5月29日 下午3:38:38 类说明
 */
public class orderCenterAction extends BaseAction {
	public String checkorder() {
		List<Order> list = orderService.getAll();
		request.put("allOrder", list);
		return "allOrder";
	}

	private int OrderId;

	public String doOrder() {
		/* int OrderId=(int) session.get("OrderId"); */
		// 测试

		Menu menu = menuService.Doorder(OrderId);
		request.put("menu", menu);
		return "menu";
	}
	/*
	 * public String domenu(){
	 * 
	 * return condition; }
	 */

	public int getOrderId() {
		return OrderId;
	}

	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
}
