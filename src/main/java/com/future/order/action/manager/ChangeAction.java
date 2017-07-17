package com.future.order.action.manager;

import java.util.Date;
import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Order;
import com.future.order.entity.Stock;





/**
 * 
 * @author 金高
 *
 */
public class ChangeAction extends BaseAction{
	
	private Date starttime;
	private Date endtime;
	//用户模块中转站
	public String addUser() {	
		return "addUser";
	}
	//配料模块中转站
	public String addIngredient(){
		return "addIngredient";
	}
	//菜品模块中转站
	public String addMenu(){
		return "addMenu";
	}
	public String addMenuType(){
		return "addMenuType";
	}
	//餐桌中转站
	public String addTable(){
		return "addTable";
	}
	//饭店中转站
	public String addRest(){
		return "addrest";
	}
	//获得个人资料
	public String getMyself(){
		return "getMyself";
	}
	//退出登录前,防倒退
	public String logOff(){
		return "logOff";
	}
	//退出登录
	public String out(){
		session.remove("user");//清除session中得user
		return "out";
	}
	public String addStocks(){
		return "addstock";
	}
	public String count(){
		List<Order> list =orderService.getSomenews();
		List<Stock> stocklist =stockService.getSomestock();
		double sum=0;
		double stocksum=0;
		for(int i=0;i<list.size();i++){
			int sign=list.get(i).getCreateDate().compareTo(endtime);
			System.out.println(sign);
		int mark=list.get(i).getCreateDate().compareTo(starttime);
		System.out.println(mark);
			if(sign==-1&&mark==1){
//				somelist.add(list.get(i));
				 sum+=list.get(i).getTotal();
			}
		}
		for(int i=0;i<stocklist.size();i++){
			int sign=stocklist.get(i).getCreateDate().compareTo(endtime);
			System.out.println(sign);
		int mark=stocklist.get(i).getCreateDate().compareTo(starttime);
		System.out.println(mark);
			if(sign==-1&&mark==1){
//				somelist.add(list.get(i));
				stocksum+=stocklist.get(i).getTotal();
			}
		}
		double margin=sum-stocksum;
		request.put("sum",sum);
		request.put("margin",margin);
		request.put("sums","营业额:");
		request.put("stocksums","支出:");
		request.put("margins","盈余:");
		return "count";
		
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
