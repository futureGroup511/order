/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:52:25   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Inform;
import com.future.order.entity.Order;
import com.future.order.service.IInformService;

/**
 * @author Administrator
 *
 */
@Service
public class InformDao extends BaseDao<Inform>  implements IInformService {
	@Override
	public List<Inform> getAll() {

		List<Inform> list = new ArrayList<Inform>();
		try{
			String hql="from Inform as a order by a.createDate asc";
			list=this.getEntityList(hql); 
			System.out.println(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
