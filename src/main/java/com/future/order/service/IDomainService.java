package com.future.order.service;

import com.future.order.entity.Domain;

/**
 * 
 * @author 金高
 *
 */
public interface IDomainService {
	//添加IP
	public boolean addIp(Domain domain);
	//得到IP
	public Domain getIp();
   //删除IP
	public boolean delete();
   //更新修改IP
	public boolean updateIp(Domain domain);
	
	
}
