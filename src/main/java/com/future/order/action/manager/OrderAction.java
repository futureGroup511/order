package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
import com.future.order.entity.Stock;
import com.future.order.entity.User;
import com.future.order.util.PageCut;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	private String ask;
	private String inquiry;
	private Date starttime;
	private Date endtime;
	public String execute() {
		PageCut<Order> pCut = new PageCut<Order>();
		double sumprice=0;
		if(sign==null){
			sign=(String) session.get("sign");
		}
		if(sign.equals("one")){
			//获得全部订单信息
			pCut=orderService.getPageCut(page,6);
		}
		else if(sign.equals("two")){
			//获得全部没有结账的订单信息
			 pCut=orderService.getNoPageCut(page,6);
		}
		else if(sign.equals("there")){
			pCut=orderService.getPage(page,6);
		}	
		for(int i=0;i<pCut.getData().size();i++){
			sumprice+=pCut.getData().get(i).getTotal();
		}
		if(pCut.getData().size()==0){
			String mark="没有订单";
			request.put("marknews", mark);
		}
		request.put("sumprice", sumprice);
		session.put("sign", sign);
		request.put("adss", "execute");
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
	public String Inquiry(){
		PageCut<Order> pCut = new PageCut<Order>();
		List<Order> list = new ArrayList<>();
		double sum=0;
		double sumprice=0;
		if(ask!=null){
			pCut=orderService.getSomePageCut(page,6,ask,inquiry);
			list=orderService.getPrice(ask,inquiry);
			}else{
				ask=(String) session.get("ask");
				inquiry=(String) session.get("inquiry");
				pCut=orderService.getSomePageCut(page,6,ask,inquiry);
				list=orderService.getPrice(ask,inquiry);
			}
			//获得全部订单信息
		if(pCut.getData().size()==0){
			String mark="没有订单";
			request.put("marknews", mark);
		}
		for(int i=0;i<pCut.getData().size();i++){
			sumprice+=pCut.getData().get(i).getTotal();
		}
		for(int i=0;i<list.size();i++){
			sum+=list.get(i).getTotal();
		}
		if(sum!=0){
			request.put("sum",sum);
			request.put("sums","所查询的总收入(元):");
		}else{
			request.put("sums","所查询的这段时间的总收入为零");
		}
		request.put("sumprice", sumprice);
		request.put("pc", pCut);
		request.put("adss", "Inquiry");		
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		request.put("dateend", inquiry);
		return "check";
	}
	public String count(){
		PageCut<Order> pCut = new PageCut<Order>();
		List<Order> list = new ArrayList<>();
		double sumprice=0;
		double sum=0;
		if(starttime==null||endtime==null||starttime==null&&endtime==null){
			starttime=(Date) session.get("starttime");
			endtime=(Date) session.get("endtime");
		}
			sign=(String) session.get("sign");
		if(sign.equals("one")){
			//获得全部订单信息
			list =orderService.getGain(starttime,endtime,sign);
			pCut=orderService.getPagegain(page,6,starttime,endtime,sign);
		}
		else if(sign.equals("two")){
			//获得全部没有结账的订单信息
			list =orderService.getGain(starttime,endtime,sign);
			pCut=orderService.getPagegain(page,6,starttime,endtime,sign);
		}
		else if(sign.equals("there")){
			list =orderService.getGain(starttime,endtime,sign);
			pCut=orderService.getPagegain(page,6,starttime,endtime,sign);
		}	
		for(int i=0;i<pCut.getData().size();i++){
			sumprice+=pCut.getData().get(i).getTotal();
		}
		for(int i=0;i<list.size();i++){
			sum+=list.get(i).getTotal();
		}
		if(pCut.getData().size()==0){
			String mark="没有订单";
			request.put("marknews", mark);
		}
		if(sum!=0){
		request.put("sum",sum);
		request.put("sums","的总收入(元):");
	}else{
		request.put("sums","的总收入为零");
	}
		String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(starttime);
		String dateend = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(endtime);
		session.put("starttime", starttime);
		session.put("endtime", endtime);
		request.put("dateStr", dateStr);
		request.put("dateend", dateend);
		request.put("mark", "--");
		request.put("sumprice", sumprice);
		session.put("sign", sign);
		request.put("adss", "count");
		request.put("sign", sign);
		request.put("pc", pCut);
		return "check";
		
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
	public String getAsk() {
		return ask;
	}
	public void setAsk(String ask) {
		this.ask = ask;
	}
	public String getInquiry() {
		return inquiry;
	}
	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
}
