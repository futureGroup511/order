package com.future.order.action.cook;

import java.util.List;
import java.util.Map;

import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.util.PageCut;
import com.opensymphony.xwork2.ActionContext;
/**
 * @author by王青杰
 * @version 创建时间：2017年5月29日 下午3:38:38 类说明
 */
public class orderCenterAction extends BaseAction {
	private int OrderId;//订单ID
	private int tableId;
	private int page=1;
	private String input;
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
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		session.put("menuId",OrderId);
		int s=(int) session.get("menuId");
		List  menu=menuMaterialService.getMenuMaterial(s);
		for( int i=0;i<menu.size();i++) {
			MenuMaterial pl=(MenuMaterial) menu.get(i);
			int id=pl.getIngId();
			int num=(int) pl.getNum();
			boolean k=ingerdientService.updeteNum(id, num);
		}
		PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
		request.put("paCut", pCut);
		return "menu";
	}
	public String recheck() {
		boolean m=orderDetailsService.updet(OrderId);
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		session.put("menuId",OrderId);
		int s=(int) session.get("menuId");
		List  menu=menuMaterialService.getMenuMaterial(s);
		for( int i=0;i<menu.size();i++) {
			MenuMaterial pl=(MenuMaterial) menu.get(i);
			int id=pl.getIngId();
			int num=(int) pl.getNum();
			boolean k=ingerdientService.updeteNum(id, num);
		}
		PageCut<OrderDetails> pCut=orderDetailsService.Check(tableId,page, 4);
		request.put("paCut", pCut);
		return "orderdetail";
	}
	public String check() {
		PageCut<OrderDetails> pCut=orderDetailsService.Check(OrderId, page, 4);
		request.put("paCut",pCut);
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		session.put("sorderid",OrderId);
		return "orderdetail";
	}
	public String domenu() {
		boolean m=orderDetailsService.updateOrerDetails(OrderId);
		List menu=orderDetailsService.getAll(OrderId);
		request.put("menu", menu);
		return "update";
	}
	/*public String unmenu(){
		boolean m=orderDetailsService.updateOrerDetails(OrderId);
		PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
		request.put("paCut", pCut);
		return "menu";
	}*/
	public String reminder() {
		PageCut<Inform> pCut=informService.getPageCut(page,5);
		request.put("paCut",pCut);
		return "inform";
	}
	public String Serach() {
		if(input.equals("")) {
		PageCut<Order> pCut=orderService.getPageCut(page, 5);
		request.put("paCut",pCut);
		}else {
		PageCut<Order> pCut=orderService.searchOrder(input, 3,page);
		request.put("paCut",pCut);
		}
		return "allOrder";
	}
	public String SearchDetails() {
		if(input.equals("")) {
			PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
			request.put("paCut",pCut);
		}else {
		PageCut<OrderDetails> pCut=orderDetailsService.searchOrder(input, 3, page);
		request.put("paCut",pCut);
		}
		return "menu";
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
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public int getTableId() {
		return tableId;
	}
	public void setTableId(int tableId) {
		this.tableId = tableId;
	}
}
