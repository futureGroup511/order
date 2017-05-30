package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.dao.OrderDao;
import com.future.order.entity.Order;
import com.future.order.entity.User;

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

	public String execute() {//获得全部订单信息
		List<Order> list = orderService.Check();
		request.put("alllist", list);
		return "check";
	}

	public String ChecknoPoy() {//获得全部没有结账的订单信息
		List<Order> list = orderService.CheckNoOrder();
		request.put("alllist", list);
		return "check";

	}

	public String CheckPay() {//获得已结账的订单信息
		List<Order> list = orderService.CheckOrder();
		request.put("alllist", list);
		return "check";

	}

	public String Delet() {//从前台获得ID用于根据账号删除订单信息和订单详细信息
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

	public String Pay() {//用于结账，把订单状态由已处理改为已结账
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

	public String toUpdate() {//根据ID获得需要修改的订单信息
		Order order = orderService.CheckById(id);
		System.out.println(order);
		request.put("order", order);
		return "update";

	}
	public String Update() {//接收修改后的订单信息用于修改
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
