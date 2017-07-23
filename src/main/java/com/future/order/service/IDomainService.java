package com.future.order.service;

import com.future.order.entity.Domain;

/**
 * 
 * @author 金高
 *
 */
public interface IDomainService {
	
	public boolean addIp(Domain domain);

	public Domain getIp();

	public boolean delete();

	public boolean updateIp(Domain domain);
	
	
}
