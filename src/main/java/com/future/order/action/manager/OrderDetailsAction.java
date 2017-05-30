package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
/**
 * 
 * @author 马黎明
 *
 * 2017年5月29日下午9:56:39
 */
public class OrderDetailsAction extends BaseAction{
	private int id;
	private int detailid;
	private OrderDetails details;
	private static final long serialVersionUID = -5868840570341763054L;
	public String CheckOrderDetails(){
		session.put("orderid", id);
		return  this.execute();
	}
	public String execute(){
		System.out.println(id);
		int orderid=(int) session.get("orderid");
		List<OrderDetails> list= orderDetailsService.CheckDetails(orderid);
		request.put("alldetails", list);
		return "details";
		}
	public String Delet(){
		boolean sign = orderDetailsService.DeletDetails(detailid);
		String mark = "操作失败";
		if (sign == true) {
			mark = "操作成功";
		} else {
			mark = "删除失败";
		}
		request.put("markinfo", mark);
		return this.execute();	
	}
	public String toUpdate() {//根据ID获得需要修改的订单信息
		OrderDetails orderDetails = orderDetailsService.CheckById(detailid);
		System.out.println(orderDetails);
		request.put("ordernews", orderDetails);
		return "update";

	}
	public String Update() {//接收修改后的订单信息用于修改
		boolean sign = orderDetailsService.UpdateOrder(details);
		System.out.println(details);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("markinfo", mark);
		return this.execute();
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDetailid() {
		return detailid;
	}
	public void setDetailid(int detailid) {
		this.detailid = detailid;
	}
	public OrderDetails getDetails() {
		return details;
	}
	public void setDetails(OrderDetails details) {
		this.details = details;
	}
	
}
