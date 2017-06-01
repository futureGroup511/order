/**        
 * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:48:47   
 * @Description:  
 * 
 */ 
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;

import com.future.order.entity.Ingredient;

import com.future.order.entity.Order;
import com.future.order.service.IOrderService;
import com.future.order.util.PageCut;

import ognl.OgnlContext;

@Service
public class OrderDao extends BaseDao<Order> implements IOrderService {

	@Override
	public List<Order> getAll() {

		List<Order> list = new ArrayList<Order>();
		try{
			String hql="from Order";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	@Override
	public boolean DeletOrder(int id) {
		boolean sign = false;
		try{
			String hql="delete from Order o Where o.id='"+id+"'";
			int mark=this.executeUpdate(hql);
		if(mark==1){
			sign=true;
		}else{
			sign=false;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public boolean PayOrder(int id) {
		boolean sign=false;
		try{
			String status="已付款";
			String hql="update from Order o set o.status='"+status+"' Where o.id='"+id+"'";
			int mark=this.executeUpdate(hql);
		if(mark==1){
			sign=true;
		}else{
			sign=false;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public Order CheckById(int id) {
		@SuppressWarnings("unused")
		Order order = new Order();
		try{
			String hql="from Order o where o.id='"+id+"'";
			order=(Order) this.uniqueResult(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public boolean UpdateOrder(Order orders) {
		boolean sign=false;
		try{
			sign=this.updateEntity(orders);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public PageCut<Order> getPageCut(int currentPage, int pageSize) {
		String hql ;
		int count=0;
		hql = "select count(*) from Order";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public PageCut<Order> getNoPageCut(int currentPage, int pageSize) {
		String status="已处理";
		String statuss="未付款";
		String hql ;
		int count=0;
		hql = "select count(*) from Order o where o.status='"+status+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order o where o.status='"+status+"' or o.status='"+statuss+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public PageCut<Order> getPage(int currentPage, int pageSize) {
		String status="已付款";
		String hql ;
		int count=0;
		hql = "select count(*) from Order o where o.status='"+status+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order o where o.status='"+status+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

}
