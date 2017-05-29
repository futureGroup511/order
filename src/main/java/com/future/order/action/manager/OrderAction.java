package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.dao.OrderDao;
import com.future.order.entity.Order;

import java.util.List;

/**
 * 
 * @author 马黎明
 *
 *         2017年5月28日上午11:02:16
 */
public class OrderAction extends BaseAction {

	private static final long serialVersionUID = 834511442318917043L;
	private int id;
	private Order orders;

	public String execute() {
		List<Order> list = orderService.Check();
		request.put("alllist", list);
		return "check";
	}

	public String ChecknoPoy() {
		List<Order> list = orderService.CheckNoOrder();
		request.put("alllist", list);
		return "check";

	}

	public String CheckPay() {
		List<Order> list = orderService.CheckOrder();
		request.put("alllist", list);
		return "check";

	}

	public String Delet() {
		boolean sign = orderService.DeletOrder(id);
		boolean signs = orderDetailsService.DeletOrderDetails(id);
		String mark = "操作失败";
		if (sign == true && signs == true) {
			mark = "操作成功";
		} else {
			mark = "删除失败";
		}
		request.put("marknews", mark);
		return this.execute();

	}

	public String Pay() {
		boolean sign = orderService.PayOrder(id);
		String mark = "操作失败";
		if (sign == true) {
			mark = "付款成功";
		} else {
			mark = "付款失败";
		}
		request.put("marknews", mark);
		return this.execute();
	}

	public String CheckOrder() {
		Order order = orderService.CheckById(id);
		request.put("order", order);
		return "update";

	}
	public String Update() {
		boolean sign = orderService.UpdateOrder(orders);
		System.out.println(orders);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("marknews", mark);
		return this.execute();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Order getOrders() {
		return orders;
	}

	public void setOrders(Order orders) {
		this.orders = orders;
	}

}
