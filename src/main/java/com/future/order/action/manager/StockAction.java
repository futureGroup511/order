package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
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

	public String execute() {
		PageCut<Stock> pCut = stockService.getPageCut(page, 2);
		if (pCut.getData().size() == 0) {
			String mark = "没有进货信息(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("stocknews", mark);
		}
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

}
