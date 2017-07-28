package com.future.order.service;

import com.future.order.entity.Domain;

/**
 * 
 * @author 金高
 *
 */
public interface IDomainService {
	
	public boolean addIp(Domain domain);//添加域名

	public Domain getIp();//获得域名

	public boolean delete();//删除域名

	public boolean updateIp(Domain domain);//修改域名
	
}
