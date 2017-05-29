package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Stock;

/**
 * 
 * @author 马黎明
 *
 *         2017年5月29日下午9:56:22
 */
public class StockAction extends BaseAction {
	private static final long serialVersionUID = -5938853157830818244L;
	private Stock stock;

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

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

}
