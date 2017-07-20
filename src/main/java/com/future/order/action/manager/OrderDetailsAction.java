package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.User;
import com.future.order.util.PageCut;
/**
 * 
 * @author 马黎明
 *
 * 2017年5月29日下午9:56:39
 */
public class OrderDetailsAction extends BaseAction{
 	private static final long serialVersionUID = -5868840570341763054L;
 	
	private int id;
	private int detailid;
	private int page=1;
	private OrderDetails details;
	private String sort;//判断用户的身份
	public String CheckOrderDetails(){
		session.put("orderid", id);
		return this.execute();
	}
	public String execute(){//根据订单ID查询订单详细信息并分页
		int orderid=(int) session.get("orderid");
		PageCut<OrderDetails> pCut=orderDetailsService.getPageCut(page,8,orderid);
		if(pCut.getData().size()==0){
			String mark="订单详细信息为空";
			request.put("markinfo", mark);
		}
		request.put("detailspc", pCut);	
		if(sort!=null&&sort.equals("cashier")){
			System.out.println("exe ");
			return "cashierDatail";
		}
		return "details";
		}
	public String Delet(){//根据订单详细信息的ID删除所有该订单的详细信息的一条信息
		boolean sign = orderDetailsService.DeletDetails(detailid);
		String mark = "操作失败";
		if (sign == true) {
			mark = "删除成功";
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
	public String Print(){
	 List<OrderDetails> list=orderDetailsService.SeeByid(id);
	 double total=0;
	 for(int i=0;i<list.size();i++){
		int count=list.get(i).getMenuNum();
		double value =list.get(i).getPrice();
		 total+=count*value;
	 }
	 request.put("total", total);
	 request.put("orderlist", list);
		return "print";
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
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
