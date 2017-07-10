/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:52:25   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Inform;
import com.future.order.service.IInformService;

/**
 * @author Administrator
 *
 */
@Service
public class InformDao extends BaseDao<Inform> implements IInformService {

	@Override
	public Boolean save(Inform inform) {
		return this.saveEntity(inform);
	}

}
