package com.future.order.action.manager;

import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Ingredient;
import com.future.order.entity.StockDetails;
import com.future.order.util.PageCut;

public class StockDetailsAction extends BaseAction{
	private static final long serialVersionUID = 5615491407103245053L;
	private int id;
	private int stocksid;
	private int page=1;
	private StockDetails details;
	private String ask;
	private String inquiry;
	public String CheckStockDetails(){
		session.put("stockid", id);
		return  this.execute();	
	}
	public String execute(){//根据订单ID查询订单详细信息并分页
		int stockid=(int) session.get("stockid");
		PageCut<StockDetails> pCut=stockDetailsService.getPageCut(page,8,stockid);
		if(pCut.getData().size()==0){
			String mark="进货详细信息为空";
			request.put("markinfo", mark);
		}
		request.put("adss", "execute");
		request.put("pc", pCut);		
		return "details";
		}
	public String AddDetails(){
		String ingName = details.getIngName();
		Date createDate = (Date) session.get("createDate");
		int stockId = (int) session.get("stockId");
		String place = (String) session.get("site");
		details.setCreateDate(createDate);
		details.setStockId(stockId);
		details.setPlace(place);
		@SuppressWarnings("unchecked")
		List<Ingredient> list=(List<Ingredient>) session.get("Ientlist");
		for(int i=0;i<list.size();i++){
			if(list.get(i).getName().equals(ingName)){
				details.setIngId(list.get(i).getId());
			}
		}
		List<Ingredient> alllist=ingerdientService.getnews();
		boolean sign=false;
		for(int i=0;i<alllist.size();i++){
			if(details.getIngName().equals(alllist.get(i).getName())){
				alllist.get(i).setNum(alllist.get(i).getNum()+details.getNum());
				alllist.get(i).setPrice(details.getPrice());
			 sign=ingerdientService.updateIngredient(alllist.get(i));
			}
		}
		boolean boo = stockDetailsService.addDetails(details);
		if(boo&&sign){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！");
		}
		return "add";
		
	}
	public String Delet(){//根据订单详细信息的ID删除所有该订单的详细信息的一条信息
		boolean sign = stockDetailsService.DeletDetails(stocksid);
		String mark = "操作失败";
		if (sign == true) {
			mark = "删除成功";
		} else {
			mark = "删除失败";
		}
		request.put("deleteMark", mark);
		return this.execute();	
	}
	public String toUpdate() {//根据ID获得需要修改的订单信息
		StockDetails stockDetails = stockDetailsService.CheckById(stocksid);
		String place= stockDetails.getPlace();
		double Num=stockDetails.getNum();
		session.put("place", place);
		session.put("Num", Num);
		request.put("stockDetails", stockDetails);
		return "update";
	}
	public String Update() {//接收修改后的订单信息用于修改
		List<Ingredient> alllist=ingerdientService.getnews();
		boolean sign=false;
		double num=(double) session.get("Num");
		for(int i=0;i<alllist.size();i++){
			if(details.getIngName().equals(alllist.get(i).getName())){
				alllist.get(i).setNum(alllist.get(i).getNum()-num+details.getNum());
				alllist.get(i).setPrice(details.getPrice());
			 sign=ingerdientService.updateIngredient(alllist.get(i));
			}
		}
		String place= (String) request.get("stockDetails");
		details.setPlace(place);
		boolean boo = stockDetailsService.Updatestocks(details);		
		String mark = "操作失败";
		if (sign&&boo) {
			mark = "修改成功";
		} else {
			mark = "修改失败";
		}
		request.put("markinfo", mark);
		return this.execute();
	}
	public String Inquiry (){
		int stockid=(int) session.get("stockid");
		PageCut<StockDetails> pCut = new PageCut<StockDetails>();
		if(ask!=null){
			pCut=stockDetailsService.getSomePageCut(page,8,stockid,ask,inquiry);
			}else{
				ask=(String) session.get("ask");
				inquiry=(String) session.get("inquiry");
				pCut=stockDetailsService.getSomePageCut(page,8,stockid,ask,inquiry);
			}
			//获得全部订单信息
		if(pCut.getData().size()==0){
			String mark="进货详细信息为空";
			request.put("markinfo", mark);
		}
		request.put("pc", pCut);
		request.put("adss", "Inquiry");		
		session.put("ask", ask);
		session.put("inquiry", inquiry);	
		return "details";
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
	
}
