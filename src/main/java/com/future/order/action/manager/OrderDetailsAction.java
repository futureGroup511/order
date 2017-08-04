package com.future.order.action.manager;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Menu;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.Tables;
import com.future.order.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 *         2017年5月29日下午9:56:39
 */
public class OrderDetailsAction extends BaseAction {
	private static final long serialVersionUID = -5868840570341763054L;

	private int id;
	private int detailid;
	private int page = 1;
	private int tableid;//餐桌ID
	private String tablename;//餐桌名称
	private OrderDetails details;
	private String sort;// 判断用户的身份
	//把订单ID放入session中，方便下面的方法使用
	public String CheckOrderDetails() {
		session.put("orderid", id);
		return this.execute();
	}

	public String execute() {// 根据订单ID查询订单详细信息并分页
		int orderid = (int) session.get("orderid");
		PageCut<OrderDetails> pCut = orderDetailsService.getPageCut(page, 8, orderid);
		if (pCut.getData().size() == 0) {
			String mark = "订单详细信息为空";
			request.put("markinfo", mark);
		}
		request.put("detailspc", pCut);
		if (sort != null && sort.equals("cashier")) {
			return "cashierDatail";
		}
		return SUCCESS;
	}

	public String delet() {// 根据订单详细信息的ID删除所有该订单的详细信息的一条信息
		boolean sign = orderDetailsService.deletDetails(detailid);
		String mark = "操作失败";
		if (sign == true) {
			mark = "删除成功";
		} else {
			mark = "删除失败";
		}
		request.put("markinfo", mark);
		return this.execute();
	}

	public String toUpdate() {// 根据ID获得需要修改的订单信息
		OrderDetails orderDetails = orderDetailsService.checkById(detailid);
		request.put("ordernews", orderDetails);
		return "update";

	}

	public String Update() {// 接收修改后的订单信息用于修改
		boolean sign = orderDetailsService.updateOrder(details);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("markinfo", mark);
		return this.execute();
	}

	public String Print() {//有可能已无用
		List<OrderDetails> list = orderDetailsService.seeByid(id);
		double total = 0;
		for (int i = 0; i < list.size(); i++) {
			int count = list.get(i).getMenuNum();
			double value = list.get(i).getPrice();
			total += count * value;
		}
		request.put("total", total);
		request.put("orderlist", list);
		return "print";
	}
	public String giveMenu() throws UnsupportedEncodingException{//转发到赠菜界面
		List<Menu> list =menuService.getAll();
		request.put("menulist", list);
		session.put("tableid", tableid);
		Tables table = tablesService.getImurl(tableid);
		session.put("tablename", table.getName());
 		return "givemenu";
	}
	public String ensureGive() throws UnsupportedEncodingException{//添加赠菜到订单详情
	   int tabid = (int) session.get("tableid");
	   String tabname = (String) session.get("tablename");
	   Order order = orderService.selectOrder(tabid,"table");
	   if(order==null){
		   request.put("mark", "顾客没有消费，不能赠菜");
	   }else{
		details.setTableId(tabid);
		details.setTableName(tabname);
		details.setGift("赠品");
		details.setStatus("未完成");
		details.setDishes("即起");
		details.setCreatDate(new Date());
		details.setOrderId(order.getId());
		List<Menu> list =menuService.getAll();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getName().equals(details.getMenuName())){
				details.setMenuId(list.get(i).getId());
				details.setPrice(list.get(i).getPrice());
				details.setImgUrl(list.get(i).getImgUrl());
			}
		}
		if(orderDetailsService.save(details)){
			request.put("mark", "赠送成功");
		}else{
			request.put("mark", "赠送失败，请重新尝试");
		}
	   }
	   List<Menu> list =menuService.getAll();
	   request.put("menulist", list);
		return "ensureGive";
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

	public int getTableid() {
		return tableid;
	}

	public void setTableid(int tableid) {
		this.tableid = tableid;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

}
