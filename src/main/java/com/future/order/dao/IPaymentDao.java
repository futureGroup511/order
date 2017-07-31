package com.future.order.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Payment;
import com.future.order.service.IPaymentService;

/**
 * @author 马黎明
 */
@Service
public class IPaymentDao extends BaseDao<Payment> implements IPaymentService {
	
	//添加支付方式
	@Override
	public boolean addWays(Payment payment) {
		return saveEntity(payment);
	}
	
	//查询所有支付方式
	@Override
	public List<Payment> selectWays() {
		return selectAll();
	}
	
	//根据ID查询需要修改的支付方式
	@Override
	public Payment select(int id) {
		String hql="from Payment where id='"+id+"'";
		return (Payment) uniqueResult(hql);
	}

	//修改支付方式
	@Override
	public boolean updateWays(Payment payment) {
		return updateEntity(payment);
	}
	
	//删除支付方式
	@Override
	public boolean deletWays(int id) {
		boolean sign = false;
		try {
			String hql = "delete from Payment p Where p.id='" + id + "'";
			int mark = this.executeUpdate(hql);
			if (mark == 1) {
				sign = true;
			} else {
				sign = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

}
