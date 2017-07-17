package com.future.order.action.manager;

import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Stock;
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
	private int id;
    private String inquiry;
	private Date starttime;
	private Date endtime;
	public String execute() {
		double sumprice=0;
		PageCut<Stock> pCut = stockService.getPageCut(page, 6);
		if (pCut.getData().size() == 0) {
			String mark = "没有进货信息";
			request.put("stocknews", mark);
		}
		for(int i=0;i<pCut.getData().size();i++){
			sumprice+=pCut.getData().get(i).getTotal();
		}
		request.put("sumprice", sumprice);
		request.put("adss", "execute");
		request.put("pc", pCut);
		return "select";
	}

	public String Add() {
		boolean sign = stockService.AddStock(stock);
		String mark = "操作失败";
		if (sign == true) {
			mark = "添加成功";
		} else {
			mark = "添加失败";
		}
		request.put("stocknews", mark);
		@SuppressWarnings("unused")
		int stockId = stock.getId();
		String site=stock.getSite();
		@SuppressWarnings("unused")
		Date createDate = stock.getCreateDate();
		session.put("stockId", stockId);
		session.put("site", site);
		session.put("createDate", createDate);
		return "add";
	}

	public String Delet() {
		
		boolean sign = stockService.DeletStock(id);
		boolean signs = stockDetailsService.DeletStockDetails(id);
		String mark = "操作失败";
		if (sign == true && signs == true) {
			mark = "操作成功";
		} else {
			mark = "删除失败";
		}
		request.put("stocknews", mark);
		return this.execute();
	}
	public String toUpdate(){
		Stock stock = stockService.CheckById(id);
		request.put("stock", stock);
		return "update";
	}
	public String Update() {//接收修改后的订单信息用于修改
		boolean sign = stockService.UpdateStock(stocks);
		String mark = "操作失败";
		if (sign == true) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("stocknews", mark);
		return this.execute();
	}
	public String Inquiry(){
		PageCut<Stock> pCut = new PageCut<Stock>();
		if(inquiry!=null){
			pCut = stockService.getSomePageCut(page, 6,inquiry);
			}else{
				inquiry=(String) session.get("inquiry");
				pCut = stockService.getSomePageCut(page, 6,inquiry);
			}
		if (pCut.getData().size() == 0) {
			String mark = "没有进货信息";
			request.put("stocknews", mark);
		}
		request.put("adss", "Inquiry");		
		session.put("inquiry", inquiry);
		request.put("pc", pCut);
		return "select";
	}
	public String count(){
		List<Stock> stocklist =stockService.getSomestock();
		double stocksum=0;
		for(int i=0;i<stocklist.size();i++){
			int sign=stocklist.get(i).getCreateDate().compareTo(endtime);
		int mark=stocklist.get(i).getCreateDate().compareTo(starttime);
		System.out.println(mark);
			if(sign==-1&&mark==1){
				stocksum+=stocklist.get(i).getTotal();
			}
		}
		request.put("stocksum",stocksum);
		request.put("stocksums","所查询的时间总支出为(元):");
		return execute();	
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
