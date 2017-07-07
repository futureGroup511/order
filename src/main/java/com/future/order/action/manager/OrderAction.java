package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
import com.future.order.entity.User;
import com.future.order.util.PageCut;

import java.util.List;

/**
 * 
 * @author 马黎明
 *
 *         2017年5月28日上午11:02:16
 */
@SuppressWarnings("unused")
public class OrderAction extends BaseAction {

	private static final long serialVersionUID = 834511442318917043L;
	private int page = 1;
	private int id;
	private Order orders;
	private String sign="one";

	public String execute() {
		PageCut<Order> pCut = new PageCut<Order>();
		if(sign.equals("one")){
			//获得全部订单信息
			pCut=orderService.getPageCut(page,10);
		}
		else if(sign.equals("two")){
			//获得全部没有结账的订单信息
			 pCut=orderService.getNoPageCut(page,10);
		}
		else if(sign.equals("there")){
			pCut=orderService.getPage(page,10);
		}
		if(pCut.getData().size()==0){
			String mark="没有订单(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("marknews", mark);
		}
		request.put("sign", sign);
		request.put("pc", pCut);
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

}
