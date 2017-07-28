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
import com.future.order.util.PageCut;

@Service
public class OrderDetailsDao extends BaseDao<OrderDetails> implements IOrderDetailsService {

	@Override
	public List<OrderDetails> CheckDetails(int id) {//根据订单id查询所有该订单的详细信息
		@SuppressWarnings("unused")
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		try{
			String hql="from OrderDetails o where o.orderId='"+id+"'";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//wqj 未完成
	@Override
	public List<OrderDetails> unfinish(){
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		 String status="未完成";
		String hql="from OrderDetails o where o.status='"+status+"'";
		String hql1="from OrderDetails as a order by a.creatDate asc";
		list=this.getEntityList(hql);
		list=this.getEntityList(hql1);
		return list;
	}
	@Override
	public PageCut<OrderDetails> searchOrder( String input ,int pageSize, int currPage) {
		StringBuilder sb = new StringBuilder("from OrderDetails as o where");
		
		if (input != null && input.length() > 0) {
			sb.append(String.format(" o.id like '%%%s%%'", input));
		}
		if (input != null && input.length() > 0) {
			sb.append(String.format(" or o.status like '%%%s%%'", input));
		}
		if (input != null && input.length() > 0) {
			sb.append(String.format(" or o.tableId like '%%%s%%'", input));
		}
		if (input != null && input.length() > 0) {
			sb.append(String.format(" or o.tableName like '%%%s%%'", input));
		}
		if (input != null && input.length() > 0) {
			sb.append(String.format(" or o.menuName like '%%%s%%'", input));
		}
		int count = this.getEntityNum("select count(*) " + sb.toString());
		PageCut<OrderDetails> pc = new PageCut<>(currPage, pageSize, count);
		if (count > 0) {
			pc.setData(this.getEntityLimitList(sb.toString(), pageSize * (currPage - 1), pageSize));
		}
		return pc;
	}
	@Override
	public List<OrderDetails> CheckDe(int id) {
		@SuppressWarnings("unused")
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		try{
			String hql="from OrderDetails o where o.orderId='"+id+"'";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public PageCut<OrderDetails> getUnfinishPageCut(int currentPage, int pageSize) {
		String status="未完成";
		String hql ;
		int count=0;
		hql = "select count(*) from OrderDetails o where o.status='"+status+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<OrderDetails> pc = new PageCut<OrderDetails>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList(" from OrderDetails o where o.status='"+status+"' order by o.creatDate asc", (currentPage-1)*pageSize, pageSize));
		return pc;
	}
	
	@Override
	public boolean updateOrerDetails(int id){
		OrderDetails orderdetails = this.getEntity(id);
		String status="已完成"; 
		orderdetails.setStatus(status);
		boolean menus = this.updateEntity(orderdetails);
		return true;
	}
	
	@Override
	public List<OrderDetails> getAll(int id) {
		@SuppressWarnings("unused")
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		try{
			String hql="from OrderDetails as a order by a.creatDate asc";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deletOrderDetails(int id) {//根据订单ID删除所有该订单所有详细信息
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
	public boolean deletDetails(int detailid) {//根据详细信息的ID删除信息
		boolean sign = false;
		try{
			String hql="delete from OrderDetails o Where o.id="+detailid;
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
	public OrderDetails checkById(int detailid) {
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
		public PageCut<OrderDetails> Check(int tableId,int currentPage, int pageSize) {
			String hql ;
			int count=0;
			hql = "select count(*) from OrderDetails o where o.orderId='"+tableId+"'";
			count = ((Long) this.uniqueResult(hql)).intValue();
			PageCut<OrderDetails> pc = new PageCut<OrderDetails>(currentPage, pageSize, count);
			pc.setData(this.getEntityLimitList(" from OrderDetails o where o.orderId='"+tableId+"'", (currentPage-1)*pageSize, pageSize));
			return pc;
	}
	
	
	@Override
	public boolean updet(int id,int idd,String UserName){
		OrderDetails orderdetails = this.getEntity(id);
		String status="已完成";
		orderdetails.setCookId(idd);
		orderdetails.setCookName(UserName);
		orderdetails.setStatus(status);
		boolean menus = this.updateEntity(orderdetails);
		return true;
	}

	@Override
	public boolean updateOrder(OrderDetails details) {
		boolean sign=false;
		try{
			sign=this.updateEntity(details);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}
	
	@Override
	public PageCut<OrderDetails> getPageCut(int currentPage, int pageSize, int orderid) {
		String hql ;
		int count=0;
		hql = "select count(*) from OrderDetails o where o.orderId='"+orderid+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<OrderDetails> pc = new PageCut<OrderDetails>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from OrderDetails o where o.orderId='"+orderid+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public Boolean save(OrderDetails orderDetails) {
		return this.saveEntity(orderDetails);
	}

	@Override
	public List<OrderDetails> getDetails(int tableId) {
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		String hql="from OrderDetails s where s.tableId="+tableId+" and (s.status='未完成' or s.status='已处理')";
		list=this.getEntityList(hql);
		return list;
	}
	@Override
	public OrderDetails getByTableId(int tableId) {
		String hql="from OrderDetails s where s.tableId="+tableId;
		List<OrderDetails> orderDetails=this.getEntityList(hql);
		if(orderDetails.size()>0){
			return (OrderDetails)orderDetails.toArray()[0];
		}
		else{
			return null;
		}	
	}
	@Override
	public Boolean updatee(OrderDetails en) {
		
		return this.updateEntity(en);
	}
	@Override
	public List<OrderDetails> getDetailsOne(int orderId) {
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		String hql="from OrderDetails s where s.orderId="+orderId;
		list=this.getEntityList(hql);
		return list;
	}
	@Override
	public List<OrderDetails> seeByid(int id) {
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		try{
			String hql="from OrderDetails o where o.orderId='"+id+"'";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public OrderDetails getDetaill(int tableId) {
		String hql="from OrderDetails where id=(select max(id) from OrderDetails) and tableId='"+tableId+"'";
		OrderDetails orderDetails=(OrderDetails) uniqueResult(hql);
		return orderDetails;
	}
	@Override
	public List<OrderDetails> getDetailsTwo(int orderId) {
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		String hql="from OrderDetails s where s.orderId="+orderId+" and (s.status='未完成')";
		list=this.getEntityList(hql);
		return list;
	}
	@Override
	public boolean back(int id) {
		boolean sign = false;
		try{
			String hql="delete from OrderDetails o Where o.id='"+id+"'";
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
	public OrderDetails checkStatus(int id) {
		String hql="from OrderDetails s where s.id="+id;
		OrderDetails orderDetails=(OrderDetails) uniqueResult(hql);
		return orderDetails;
	}
	@Override
	public int getSomenum(int id) {
		String hql ="from OrderDetails where orderId='"+id+"'";
		List<OrderDetails> list=getEntityList(hql);
		int num=list.size();
		return num;
	}
}
