package com.future.order.action.manager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Stock;
import com.future.order.entity.StockDetails;
import com.future.order.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 *         2017年5月29日下午9:56:22
 */
public class StockAction extends BaseAction {
	private static final long serialVersionUID = -5938853157830818244L;
	private Stock stock;
	private Stock stocks;
	private int page = 1;
	private int id = 0;
	private String inquiry;//查询的属性值
	private String starttime;//开始的时间
	private String endtime;//结尾的直减

	public String execute() {//查询信息，用于分页
		double sumprice = 0;
		PageCut<Stock> pCut = stockService.getPageCut(page, 8);
		if (pCut.getData().size() == 0) {
			String mark = "没有进货信息";
			request.put("stocknews", mark);
		}
		for (int i = 0; i < pCut.getData().size(); i++) {
			sumprice += pCut.getData().get(i).getTotal();
		}
		BigDecimal bg = new BigDecimal(sumprice);// 保留两位小数，张金高改
		double sumpriceNew = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		request.put("sumprice", sumpriceNew);
		request.put("adss", "execute");
		request.put("pc", pCut);
		return "select";
	}

	public String Add() {//添加进货信息，并跳转进货详情界面
		if (id != 0) {
			stock = stockService.getStock(id);//用于再次添加进货信息，跳转到添加进货详情的界面
		} else {
			boolean sign = stockService.addStock(stock);//添加进货信息
			String mark = "操作失败";
			if (sign == true) {
				mark = "添加成功";
			} else {
				mark = "添加失败";
			}
			request.put("stocknews", mark);
		}
		int stockId = stock.getId();
		String site = stock.getSite();
		Date createDate = stock.getCreateDate();
		session.put("stockId", stockId);
		session.put("site", site);
		session.put("createDate", createDate);
		return "add";
	}

	public String Delet() {//根据ID删除进货信息
		String mark = "操作失败";
		boolean sign = stockService.deletStock(id);
		//判断进货详情是否为空
		PageCut<StockDetails> pCut = stockDetailsService.getPageCut(page, 8, id);
		if (pCut.getData().size() == 0 && sign == true) {
			mark = "操作成功";
		} else {
			//根据进货ID删除进货详情
			boolean signs = stockDetailsService.deletStockDetails(id);
			if (sign == true || signs == true) {
				mark = "操作成功";
			}
		}
		request.put("stocknews", mark);
		return this.execute();
	}
	//获取所需修改的进货信息，并转发到修改界面
	public String toUpdate() {
		Stock stock = stockService.checkById(id);
		request.put("stock", stock);
		return "update";
	}
//修改进货信息
	public String Update() {// 接收修改后的订单信息用于修改
		boolean sign = stockService.updateStock(stocks);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("stocknews", mark);
		return this.execute();
	}
	//用于条件查询
	public String Inquiry() {
		double sumprice = 0;
		double sum = 0;
		PageCut<Stock> pCut = new PageCut<Stock>();
		List<Stock> list = new ArrayList<>();
		if (inquiry != null) {
			pCut = stockService.getSomePageCut(page, 8, inquiry);
			list = stockService.getTotal(inquiry);
		} else {
			inquiry = (String) session.get("inquiry");
			pCut = stockService.getSomePageCut(page, 8, inquiry);
			list = stockService.getTotal(inquiry);
		}
		if (pCut.getData().size() == 0) {
			String mark = "没有进货信息";
			request.put("stocknews", mark);
		}
		for (int i = 0; i < pCut.getData().size(); i++) {
			sumprice += pCut.getData().get(i).getTotal();
		}
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i).getTotal();
		}
		BigDecimal bg = new BigDecimal(sumprice);// 保留小数，张金高改
		double sumpriceNew = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		bg = new BigDecimal(sum);
		double sumNew = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		if (sumNew != 0) {
			request.put("stocksum", sumNew);
			request.put("stocksums", "所查询的总收入(元):");
		} else {
			request.put("stocksums", "所查询的这段时间的总收入为零");
		}
		request.put("sumprice", sumpriceNew);
		request.put("adss", "Inquiry");
		session.put("inquiry", inquiry);
		request.put("pc", pCut);
		request.put("dateend", inquiry);
		return "select";
	}
	//用于时间条件查询
	public String count() {
		double sumprice = 0;
		double sum = 0;
		List<Stock> list = new ArrayList<>();
		if (starttime == null || endtime == null || starttime == null && endtime == null) {
			starttime = (String) session.get("starttime");
			endtime = (String) session.get("endtime");
		}
		//用于时间条件查询
		PageCut<Stock> pCut = stockService.getSomePageCut(page, 8, starttime, endtime);
		list = stockService.getPrice(starttime, endtime);
		if (pCut.getData().size() == 0) {
			String mark = "没有进货信息";
			request.put("stocknews", mark);
		}
		for (int i = 0; i < pCut.getData().size(); i++) {
			sumprice += pCut.getData().get(i).getTotal();
		}
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i).getTotal();
		}
		BigDecimal bg = new BigDecimal(sumprice);// 保留小数，张金高改
		double sumpriceNew = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		bg = new BigDecimal(sum);
		double sumNew = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		if (sumNew != 0) {
			request.put("stocksum", sumNew);
			request.put("stocksums", "的总收入(元):");
		} else {
			request.put("stocksums", "的总收入为零");
		}
		request.put("dateStr", starttime);
		request.put("dateend", endtime);
		request.put("mark", "--");
		session.put("starttime", starttime);
		session.put("endtime", endtime);
		request.put("sumprice", sumpriceNew);
		request.put("adss", "count");
		request.put("pc", pCut);
		return "select";
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Stock getStocks() {
		return stocks;
	}

	public void setStocks(Stock stocks) {
		this.stocks = stocks;
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
}
