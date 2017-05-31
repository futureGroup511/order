package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.StockDetails;
import com.future.order.util.PageCut;

public class StockDetailsAction extends BaseAction{
	private static final long serialVersionUID = 5615491407103245053L;
	private int id;
	private int stocksid;
	private int page=1;
	private StockDetails details;
	public String CheckStockDetails(){
		session.put("stockid", id);
		return  this.execute();	
	}
	public String execute(){//根据订单ID查询订单详细信息并分页
		int stockid=(int) session.get("stockid");
		PageCut<StockDetails> pCut=stockDetailsService.getPageCut(page,2,stockid);
		if(pCut.getData().size()==0){
			String mark="订单详细信息为空(*^o^)人(^o^*)";
			request.put("markinfo", mark);
		}
		request.put("pc", pCut);		
		return "details";
		}
	public String Delet(){//根据订单详细信息的ID删除所有该订单的详细信息的一条信息
		boolean sign = stockDetailsService.DeletDetails(stocksid);
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
		StockDetails stockDetails = stockDetailsService.CheckById(stocksid);
		System.out.println(stockDetails);
		System.out.println(stocksid);
		request.put("stockDetails", stockDetails);
		return "update";
	}
	public String Update() {//接收修改后的订单信息用于修改
		boolean sign = stockDetailsService.Updatestocks(details);
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
	public int getStocksid() {
		return stocksid;
	}
	public void setStocksid(int stocksid) {
		this.stocksid = stocksid;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public StockDetails getDetails() {
		return details;
	}
	public void setDetails(StockDetails details) {
		this.details = details;
	}
	
}
