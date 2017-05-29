/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:48:47   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Order;
import com.future.order.service.IOrderService;

import ognl.OgnlContext;

@Service
public class OrderDao extends BaseDao<Order> implements IOrderService {

	@Override
	public List<Order> Check() {
		@SuppressWarnings("unused")
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
	public List<Order> CheckNoOrder() {
		@SuppressWarnings("unused")
		List<Order> list = new ArrayList<Order>();
		try{
			String status="已处理";
			String hql="from Order o where o.status='"+status+"'";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> CheckOrder() {
		@SuppressWarnings("unused")
		List<Order> list = new ArrayList<Order>();
		try{
			String status="已付款";
			String hql="from Order o where o.status='"+status+"'";
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
//			String hql="update from Order o set o.tableId='"+orders.getTableId()+"',o.tableName='"+orders.getTableName()+"',o.total='"+orders.getTotal()+"',o.status='"+orders.getStatus()+"',o.createDate='"+orders.getCreateDate()+"',o.cookId='"+orders.getCookId()+"',o.cookName='"+orders.getCookName()+"',o.remark='"+orders.getRemark()+"' Where o.id='"+orders.getId()+"'";
//			int mark=this.executeUpdate(hql);
//		if(mark==1){
//			sign=true;
//		}else{
//			sign=false;
//		}
			sign=this.updateEntity(orders);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

//	@Override
//	public List<Order> getNotPay() {
//		String name="已处理";
////		String hql="form DuePaymentRecords due where due.pm_id="+pm_id;
////		Query q=this.getSession().createQuery(hql);
////		list=q.list();
////				String hql="seclet * from Order o where o.status="+name;
////				Query q=this.getSession().createQuery(hql);
////				List<Order> list=q.list();
//		List<Order> list = new ArrayList();
//		try{
//			@SuppressWarnings("unchecked")
//			String hql="from Order o where o.status ='"+name+"'";
//			list=this.getEntityList(hql);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//				
////				List users = session.createQuery("select u.id, u.name from User u where u.name like :myname").setParameter("myname", "%张%").list(); 
//		return list;
//	}

}
