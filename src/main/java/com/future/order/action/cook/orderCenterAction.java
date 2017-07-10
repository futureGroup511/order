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
	private int OrderId;//订单ID
	public String checkorder() {
		List<Order> list = orderService.getAll();
		request.put("allOrder", list);
		return "allOrder";
	}
	public String unfinishd() {
		List menu = (List) orderDetailsService.unfinish();
		request.put("menu", menu);
		return "menu";
	}
	public String finish(){
		List <Order> list=orderService.finish();
		request.put("allOrder", list);
		return "finish";
		
	}
	public String DoOrder(){
		boolean menu=orderService.updetemenu(OrderId);
		List order=orderDetailsService.CheckDetails(OrderId);
		request.put("orderdetail", order);
		return "orderdetail";
	}
	public String doOrder(){
		boolean m=orderDetailsService.updet(OrderId);
		List menu=orderDetailsService.getAll(OrderId);
		request.put("menu", menu);
		return "update";
	}
	public String domenu() {
		boolean m=orderDetailsService.updateOrerDetails(OrderId);
		List menu=orderDetailsService.getAll(OrderId);
		request.put("menu", menu);
		return "update";
	}
	public String unmenu(){
		List list=orderDetailsService.unfinish();
		request.put("menu", list);
		return "unmenu";
	}
	public String reminder() {
		List list=informService.getAll();
		request.put("inform", list);
		return "inform";
	}
	
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
}
