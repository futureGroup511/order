package com.future.order.action.manager;

import java.util.List;

import com.future.order.base.BaseAction;
import com.future.order.entity.Payment;

/**
 * @author 马黎明
 */
public class PaymentAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Payment payment;
	private int id;

	// 查看所有支付方式
	public String execute() {
		List<Payment> list = paymentService.selectWays();
		if (list.size() == 0) {
			request.put("mark", "无支付方式");
		}
		request.put("paylist", list);
		return SUCCESS;
	}

	// 添加支付方式
	public String addPayment() {
		String mark = "操作失败";
		boolean sign = paymentService.addWays(payment);
		if (sign) {
			mark = "添加成功";
		} else {
			mark = "添加失败,已经存在";
		}
		request.put("mark", mark);
		return "addways";
	}

	// 查询支付方式，转到修改页面
	public String toUpdate() {
		Payment payways = paymentService.select(id);
		request.put("payways", payways);
		return "update";
	}

	// 修改支付方式
	public String updatePayWays() {
		boolean sign = false;
		String mark = "操作失败";
		int judge = 1;
		Payment oldPay = paymentService.select(payment.getId());
		if (oldPay.getWays().equals(payment.getWays())) {
			sign = paymentService.updateWays(payment);
		} else {
			List<Payment> list = paymentService.selectWays();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getWays().equals(payment.getWays())) {
					mark="已有此种支付方式";
					judge = 0;
				} 
			}
			if (judge == 1) {
				sign = paymentService.updateWays(payment);
			}
		}
		if (sign) {
			mark="修改成功";
		} else {
			mark="修改失败";
		}
		request.put("mark", mark);
		return execute();
	}
	//根据ID删除支付方式
	public String deletePayWays(){
		String mark = "操作失败";
		boolean sign = paymentService.deletWays(id);
		if (sign) {
			mark="删除成功";
		} else {
			mark="删除失败";
		}
		request.put("mark", mark);
		return execute();	
	}
	
	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
