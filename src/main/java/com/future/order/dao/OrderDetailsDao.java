/**        
 * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:48:11   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.OrderDetails;
import com.future.order.service.IOrderDetailsService;

@Service
public class OrderDetailsDao extends BaseDao<OrderDetails> implements IOrderDetailsService {

	@Override
	public List<OrderDetails> CheckDetails(int id) {
		@SuppressWarnings("unused")
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		try{
			String hql="from OrderDetails o where o.orderId='"+id+"'";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

	@Override
	public boolean DeletOrderDetails(int id) {
		boolean sign = false;
		try{
			String hql="delete from OrderDetails o Where o.orderId='"+id+"'";
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
	public boolean DeletDetails(int detailid) {
		boolean sign = false;
		try{
			String hql="delete from OrderDetails o Where o.id='"+detailid+"'";
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
	public OrderDetails CheckById(int detailid) {
		@SuppressWarnings("unused")
		OrderDetails orderdetails = new OrderDetails();
		try{
			String hql="from OrderDetails o where o.id='"+detailid+"'";
			orderdetails=(OrderDetails) this.uniqueResult(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return orderdetails;

	}

	@Override
	public boolean UpdateOrder(OrderDetails details) {
		boolean sign=false;
		try{
			sign=this.updateEntity(details);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

}
