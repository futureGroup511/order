package com.future.order.service;

import java.util.List;

import com.future.order.entity.Payment;

public interface IPaymentService {
	//添加支付方式
	public boolean addWays(Payment payment);
	//查询所有支付方式
	public List<Payment> selectWays();
	//根据ID查询需要修改的支付方式
	public Payment select(int id);
	//修改支付方式
	public boolean updateWays(Payment payment);
	//删除支付方式
	public boolean deletWays(int id);

}
