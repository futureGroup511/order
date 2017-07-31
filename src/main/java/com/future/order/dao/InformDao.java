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
import com.future.order.service.IInformService;
import com.future.order.util.PageCut;

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
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Inform> getTop(){
		int num = 3;
		String sql = "select * from tb_inform order by createDate desc limit "
				+ num;
		return this.executeSQLQuery(sql);
		
		
	}
	@Override
	public PageCut<Inform> getPageCut(int curr, int pageSize) {
		String hql = "select count(*) from Inform";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Inform> pc = new PageCut<Inform>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList("from Inform a order by a.createDate asc", (curr-1)*pageSize, pageSize));
		return pc;
	}
	
		@Override
		public Boolean save(Inform inform) {
			return this.saveEntity(inform);
		}
	}
