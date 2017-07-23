package com.future.order.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Domain;
import com.future.order.service.IDomainService;
@Service
public class IDomainDao extends BaseDao<Domain>  implements IDomainService {

	@Override
	public boolean addIp(Domain domain) {
		int count = this.getNum();
		if(count!=0){
			return false;
		}
		return this.saveEntity(domain);
	}

	@Override
	public Domain getIp() {
		List<Domain> domain = this.selectAll();
		if(domain.size()==0){
			return null;
		}
		return this.selectAll().get(0);
	}

	@Override
	public boolean delete() {
		Domain domain = this.selectAll().get(0);
		return this.deleteEntity(domain);
	}

	@Override
	public boolean updateIp(Domain domain) {
		return this.updateEntity(domain);
	}

}
