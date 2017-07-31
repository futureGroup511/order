/**        
z * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:43:20   
 * @Description:  
 * 
 */  
package com.future.order.service;

import java.util.List;

import com.future.order.entity.Order;
import com.future.order.util.PageCut;

/**
 * @author Administrator
 * 张金高：此处代码差，重构时不可借鉴
 *
 */
public interface IOrderService {
	//根据ID删除订单信息
	public boolean deletOrder(int id);
	//用于改变订单的状态
	public boolean payOrder(int id);
	
	//根据订单号获取订单详情中的信息，根据ID获取订单信息，用于修改界面
	public Order checkById(int id);	//张金高用
	//修改订单的信息
	public boolean updateOrder(Order orders);
	public List<Order> getFinal(int tableId,int num);
	// 获得全部订单信息
	public PageCut<Order> getPageCut(int currentPage, int pageSize);//wqj 查询所有订单
	// 获得全部没有结账的订单信息
	public PageCut<Order> getNoPageCut(int currentPage, int pageSize);
	// 获得全部结账的订单信息
	public PageCut<Order> getPage(int currentPage, int pageSize);
	
	public Order get(int tableId);
	//安李杰加 修改订单中的信息
	public Boolean update(Order order);
	public Boolean save(Order order);
	public List<Order> getAll();
	public boolean deleteOrder(int tableId);
	public List<Order> finish();
	public PageCut<Order> getFinishPagcut(int currentPage, int pageSize);//wqj 查看已完成菜品
	public PageCut<Order> getUnfinishPagCut(int currentPage, int pageSize);//wqj 查看未完成订单
	public List<Order> getOrder(int tableId);
	public PageCut<Order> searchOrder(String input, int pageSize, int currPage);
	//安李杰加 根据桌号获取订单中最近的信息
	public Order getOrder1(int tableId);
	//根据条件获得符合条件的数据
	public PageCut<Order> getSomePageCut(int currentPage, int pageSize, String ask, String inquiry);
	public boolean updetemenu(int id, int idd, String UserName);
	//根据时间条件获得符合条件的订单
	public PageCut<Order> getPagegain(int currentPage, int pageSize, String starttime, String endtime, String sign);
	// 获得全部订单信息，用于计算总价
	public List<Order> getGain(String starttime, String endtime, String sign);
	public boolean updateOrder(int id);
	//根据条件获得所有的订单
	public List<Order> getPrice(String ask, String inquiry);
	//安李杰加 删除订单
	public boolean delete(int id);
	//根据餐桌ID查找订单详情
	public Order selectOrder(int id);
	
}
