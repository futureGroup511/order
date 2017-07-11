package com.future.order.action.cook;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.util.PageCut;
/**
 * @author by王青杰
 * @version 创建时间：2017年5月29日 下午3:38:38 类说明
 */
public class orderCenterAction extends BaseAction {
	private int OrderId;//订单ID
	private int page=1;
	public String checkorder() {
		PageCut<Order> pCut=orderService.getPageCut(page, 5);
		request.put("paCut",pCut);
		return "allOrder";
	}
	public String unfinishd() {
		PageCut<Order> pCut=orderService.getPageee(page, 5);
		request.put("paCut",pCut);
		return "allOrder";
	}
	public String unfinishdmenu() {
		PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
		request.put("paCut",pCut);
		return "menu";
	}
	public String finish(){
		PageCut<Order> pCut=orderService.getPagee(page, 5);
		request.put("paCut",pCut);
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
	public String check() {
		List a= orderDetailsService.Check(OrderId);
		request.put("orderdetail", a);
		return "orderdetail";
	}
	public String domenu() {
		boolean m=orderDetailsService.updateOrerDetails(OrderId);
		List menu=orderDetailsService.getAll(OrderId);
		request.put("menu", menu);
		return "update";
	}
	public String unmenu(){
		boolean m=orderDetailsService.updateOrerDetails(OrderId);
		PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
		request.put("paCut", pCut);
		return "menu";
	}
	public String reminder() {
		PageCut<Inform> pCut=informService.getPageCut(page,5);
		request.put("paCut",pCut);
		return "inform";
	}
	
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
