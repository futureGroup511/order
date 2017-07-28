package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Domain;

public class DomainAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Domain domain;
	private int id;

	@Override
	public String execute() throws Exception {
		Domain domainDb = domainService.getIp();
		if (domainDb == null) {
			request.put("mark", "还没有添加域名");
		}
		request.put("domain", domainDb);
		return SUCCESS;
	}

	// 添加ip
	public String addIp() {
		boolean boo = domainService.addIp(domain);
		String mark = "添加失败,已经添加过域名";
		if (boo) {
			mark = "添加成功";
		}
		request.put("mark", mark);
		return "addIp";
	}

	// 删除
	public String deleteIp() {
		boolean boo = domainService.delete();
		String mark = "删除失败";
		if (boo) {
			mark = "删除成功,请添加域名";
		}
		request.put("mark", mark);
		return "deleteIp";
	}

	// 到达修改界面
	public String toUpdateIp() {
		domain = domainService.getIp();
		request.put("domain", domain);
		return "toUpdateIp";
	}

	// 修改
	public String updateIp() throws Exception {
		boolean boo = domainService.updateIp(domain);
		String mark = "修改失败";
		if (boo) {
			mark = "修改成功";
		}
		request.put("mark", mark);
		return this.execute();
	}

	public Domain getDomain() {
		return domain;
	}

	public void setDomain(Domain domain) {
		this.domain = domain;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
