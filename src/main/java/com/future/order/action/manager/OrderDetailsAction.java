package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.OrderDetails;

public class OrderDetailsAction extends BaseAction{
	private int id;
	private static final long serialVersionUID = -5868840570341763054L;
	public String execute(){
		System.out.println(id);
		List<OrderDetails> list= orderDetailsService.CheckDetails(id);
		request.put("alldetails", list);
		return "details";
		}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
