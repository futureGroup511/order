package com.future.order.action.cook;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.User;
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
	public int getOrderid() {
		return Orderid;
	}
	public void setOrderid(int orderid) {
		Orderid = orderid;
	}
	private int ID;
	private int Orderid;
	private String UserName;
	ActionContext actionContext = ActionContext.getContext();
	Map session = actionContext.getSession();
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
		return "check";
	}
	public String finish(){
		PageCut<Order> pCut=orderService.getPagee(page, 5);
		request.put("paCut",pCut);
		return "finish";
	}
	public String DoOrder(){
		User me = (User) session.get("user");
		ID = me.getId();
		UserName = me.getName();
		session.put("ordeID", OrderId);
		boolean menu=orderService.updetemenu(OrderId,ID,UserName);
		session.put("itemid", OrderId);
		PageCut<OrderDetails> pCut=orderDetailsService.Check(tableId, page, 4);
		request.put("paCut",pCut);
		return "orderdetail";
	}
	public String doOrder(){
		User me = (User) session.get("user");
		ID = me.getId();
		UserName = me.getName();
		boolean m=orderDetailsService.updet(OrderId ,ID,UserName);
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
		User me = (User) session.get("user");
		ID = me.getId();
		UserName = me.getName();
		boolean m=orderDetailsService.updet(Orderid,ID,UserName);
		List <OrderDetails> list = orderDetailsService.CheckDe(tableId);
		List n = new ArrayList();
		for(int i=0;i<list.size();i++) {
			String a=list.get(i).getStatus();
			if(a.equals("已完成")) {
				n.add(a);
			}
			if(list.size()==n.size()) {
				boolean g=orderService.upd((int) session.get("itemid"));
			}
		}
		session.put("Orderid",Orderid);
		int s=(int) session.get("Orderid");
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
	public String checko() {
		User me = (User) session.get("user");
		ID = me.getId();
		UserName = me.getName();
		boolean m=orderDetailsService.updet(Orderid,ID,UserName);
		List <OrderDetails> list = orderDetailsService.CheckDe(tableId);
		List n = new ArrayList();
		for(int i=0;i<list.size();i++) {
			String a=list.get(i).getStatus();
			if(a.equals("已完成")) {
				n.add(a);
			}
			if(list.size()==n.size()) {
				boolean g=orderService.upd((int) session.get("itemid"));
			}
		}
		session.put("Orderid",Orderid);
		int s=(int) session.get("Orderid");
		List  menu=menuMaterialService.getMenuMaterial(s);
		for( int i=0;i<menu.size();i++) {
			MenuMaterial pl=(MenuMaterial) menu.get(i);
			int id=pl.getIngId();
			int num=(int) pl.getNum();
			boolean k=ingerdientService.updeteNum(id, num);
		}
		PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
		request.put("paCut", pCut);
		return "check";
	}
	public String check() {
		PageCut<OrderDetails> pCut=orderDetailsService.Check(tableId, page, 4);
		request.put("paCut",pCut);
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		session.put("sorderid",OrderId);
		return "orderdetail";
	}

	public String reminder() {
		PageCut<Inform> pCut=informService.getPageCut(page,5);
		request.put("paCut",pCut);
		return "inform";
	}
	public String Serach() {
		if(input==null) {
			input = (String) session.get("inp");
		}
		if(input.equals("")) {
		PageCut<Order> pCut=orderService.getPageCut(page, 1);
		request.put("paCut",pCut);
		}else {
		PageCut<Order> pCut=orderService.searchOrder(input, 1,page);
		request.put("paCut",pCut);
		}
		session.put("inp", input);
		return "allOrder";
	}
	public String SearchDetails() {
		if(input==null) {
			input = (String) session.get("inp");
		}
		if(input.equals("")) {
			PageCut<OrderDetails> pCut=orderDetailsService.getPagee(page, 5);
			request.put("paCut",pCut);
		}else {
		PageCut<OrderDetails> pCut=orderDetailsService.searchOrder(input, 3, page);
		request.put("paCut",pCut);
		}
		session.put("inp", input);
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
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
}
