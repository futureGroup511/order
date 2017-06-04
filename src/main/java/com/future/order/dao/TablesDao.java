/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:45:54   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Tables;
import com.future.order.service.ITablesService;

@Service
public class TablesDao extends BaseDao<Tables> implements ITablesService {

	
	@Override
	public Tables get(int id) {
		
		return this.getEntity(id);
	}

}
