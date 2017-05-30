package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.StockDetails;
import com.future.order.util.PageCut;

public class StockDetailsAction extends BaseAction{
	private static final long serialVersionUID = 5615491407103245053L;
	private int id;
	private int detailid;
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
