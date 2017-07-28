package com.future.order.action.manager;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
import com.future.order.entity.OrderDetails;
import com.future.order.util.PageCut;

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
	private String sign = "all";
	private String ask;
	private String inquiry;
	private String starttime;
	private String endtime;
	private double discount;// 打折 //张金高修改
	private double straightCut;// 直减
	private double price;// 打折后应收
	private double pay;// 实收
	private String sort;// 判断用户的身份

	public String execute() {
		PageCut<Order> pCut = new PageCut<Order>();
		double sumprice = 0;
		if (sign == null) {
			sign = (String) session.get("sign");
		}
		if (sign.equals("all")) {
			// 获得全部订单信息
			pCut = orderService.getPageCut(page, 8);
		} else if (sign.equals("no")) {
			// 获得全部没有结账的订单信息
			pCut = orderService.getNoPageCut(page, 8);
		} else if (sign.equals("yes")) {
			pCut = orderService.getPage(page, 8);
		}
		for (int i = 0; i < pCut.getData().size(); i++) {
			sumprice += pCut.getData().get(i).getTotal();
		}
		if (pCut.getData().size() == 0) {
			String mark = "没有订单";
			request.put("mark", mark);
		}
		request.put("sumprice", sumprice);
		session.put("sign", sign);
		request.put("adss", "execute");
		request.put("sign", sign);
		request.put("pc", pCut);
		if (sort != null && sort.equals("cashier")) {
			return "cashierMOrder";
		}
		return "check";
	}

	public String Delet() {// 从前台获得ID用于根据账号删除订单信息和订单详细信息
		boolean sign = orderService.deletOrder(id);
		int marks = orderDetailsService.getSomenum(id);
		boolean signs = orderDetailsService.deletOrderDetails(id);
		String mark = "操作失败";
		if (sign && marks == 0) {
			mark = "操作成功";
		} else if (sign == true && signs == true) {
			mark = "操作成功";
		} else {
			mark = "删除失败";
		}
		request.put("mark", mark);
		return this.execute();

	}

	public String toPay() {// 转发到结账界面
		request.put("orderId", id);
		Order order = orderService.checkById(id);
		request.put("order", order);
		return "toPay";
	}

	public String pay() {// 用于结账，把订单状态由已处理改为已结账 打印发票
		double favourables = 0;// 优惠金额
		boolean sign = orderService.payOrder(orders.getId());
		String mark = "付款失败";
		if (sign == true) {
			mark = "付款成功";
			int tableId = orderService.checkById(orders.getId()).getTableId();
			tablesService.changeStatus(tableId);
		}
		Order orderDb = orderService.checkById(orders.getId());
		BigDecimal bg = new BigDecimal(favourables);
		favourables = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		orderDb.setPrice(price);
		orderDb.setFavourable(favourables);
		double returnPay = pay - price;// 找零
		returnPay = new BigDecimal(returnPay).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		request.put("mark", mark);
		request.put("discount", discount);
		request.put("straightCut", straightCut);
		request.put("marknews", mark);
		request.put("pay", pay);
		request.put("returnPay", returnPay);
		request.put("order", orderDb);

		List<OrderDetails> list = orderDetailsService.seeByid(orderDb.getId());
		request.put("orderlist", list);
		return "print";
	}

	public String toUpdate() {// 根据ID获得需要修改的订单信息
		Order order = orderService.checkById(id);
		request.put("order", order);
		return "update";
	}

	public String Update() {// 接收修改后的订单信息用于修改
		boolean sign = orderService.updateOrder(orders);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("mark", mark);
		return this.execute();
	}

	public String Inquiry() {
		PageCut<Order> pCut = new PageCut<Order>();
		List<Order> list = new ArrayList<>();
		double sum = 0;
		double sumprice = 0;
		if (ask != null) {
			pCut = orderService.getSomePageCut(page, 8, ask, inquiry);
			list = orderService.getPrice(ask, inquiry);
		} else {
			ask = (String) session.get("ask");
			inquiry = (String) session.get("inquiry");
			pCut = orderService.getSomePageCut(page, 8, ask, inquiry);
			list = orderService.getPrice(ask, inquiry);
		}
		// 获得全部订单信息
		if (pCut.getData().size() == 0) {
			String mark = "没有订单";
			request.put("mark", mark);
		}
		BigDecimal bg = new BigDecimal(sum);
		sum = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		for (int i = 0; i < pCut.getData().size(); i++) {
			sumprice += pCut.getData().get(i).getTotal();
		}
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i).getTotal();
		}
		if (sum != 0) {
			request.put("sum", sum);
			request.put("sums", "所查询的总收入(元):");
		} else {
			request.put("sums", "所查询的这段时间的总收入为零");
		}
		sumprice = new BigDecimal(sumprice).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		request.put("sumprice", sumprice);
		request.put("pc", pCut);
		request.put("adss", "Inquiry");
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		request.put("dateend", inquiry);
		if (sort != null && sort.equals("cashier")) {
			return "cashierMOrder";
		}
		return "check";
	}

	public String count() {
		PageCut<Order> pCut = new PageCut<Order>();
		List<Order> list = new ArrayList<>();
		double sumprice = 0;
		double sum = 0;
		if (starttime == null || endtime == null || starttime == null && endtime == null) {
			starttime = (String) session.get("starttime");
			endtime = (String) session.get("endtime");
		}
		sign = (String) session.get("sign");
		if (sign.equals("all")) {
			// 获得全部订单信息
			list = orderService.getGain(starttime, endtime, sign);
			pCut = orderService.getPagegain(page, 6, starttime, endtime, sign);
		} else if (sign.equals("no")) {
			// 获得全部没有结账的订单信息
			list = orderService.getGain(starttime, endtime, sign);
			pCut = orderService.getPagegain(page, 6, starttime, endtime, sign);
		} else if (sign.equals("yes")) {
			list = orderService.getGain(starttime, endtime, sign);
			pCut = orderService.getPagegain(page, 6, starttime, endtime, sign);
		}
		for (int i = 0; i < pCut.getData().size(); i++) {
			sumprice += pCut.getData().get(i).getTotal();
		}
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i).getTotal();
		}
		if (pCut.getData().size() == 0) {
			String mark = "没有订单";
			request.put("mark", mark);
		}
		BigDecimal bg = new BigDecimal(sum);
		sum = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		sumprice = new BigDecimal(sumprice).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		if (sum != 0) {
			request.put("sum", sum);
			request.put("sums", "的总收入(元):");
		} else {
			request.put("sums", "的总收入为零");
		}
		session.put("starttime", starttime);
		session.put("endtime", endtime);
		request.put("dateStr", starttime);
		request.put("dateend", endtime);
		request.put("marks", "--");
		request.put("sumprice", sumprice);
		session.put("sign", sign);
		request.put("adss", "count");
		request.put("sign", sign);
		request.put("pc", pCut);
		if (sort != null && sort.equals("cashier")) {
			return "cashierMOrder";
		}
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

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getStraightCut() {
		return straightCut;
	}

	public void setStraightCut(double straightCut) {
		this.straightCut = straightCut;
	}

	public double getPay() {
		return pay;
	}

	public void setPay(double pay) {
		this.pay = pay;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
