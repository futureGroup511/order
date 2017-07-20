/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:45:54   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Tables;
import com.future.order.service.ITablesService;
import com.future.order.util.PageCut;

@Service
public class TablesDao extends BaseDao<Tables> implements ITablesService {


	@Override
	public Tables get(int id) {
		return this.getEntity(id);
	}
	
	@Override
	public PageCut<Tables> getPageCut(int curr, int pageSize) {
		String hql = "select count(*) from Tables";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Tables> pc = new PageCut<Tables>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList("from Tables", (curr-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean addTable(Tables table) {
		String hql = "from Tables where name='"+table.getName()+"'";
		Tables tableDataBase = (Tables) this.uniqueResult(hql);
		if(tableDataBase==null){
			this.saveEntity(table);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteTable(Tables table) {
		return this.deleteEntity(table);
	}

	@Override
	public boolean updateTables(Tables table) {
		return this.updateEntity(table);
	}

	@Override
	public List<Tables> CheckName() {
		return selectAll();
	}

	@Override
	public PageCut<Tables> getSomePageCut(int curr, int pageSize, String pass, String replace) {
		String hql;
		String selecthql;
//		if(pass.equals("status")){
//			int mark = Integer.parseInt(replace);
//			hql = "select count(*) from Tables where "+pass+"='"+mark+"'";
//			selecthql="from Tables where "+pass+"='"+mark+"'";
//		}else{
			hql = "select count(*) from Tables where "+pass+"='"+replace+"'";
			selecthql="from Tables where "+pass+"='"+replace+"'";			
//		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Tables> pc = new PageCut<Tables>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList(selecthql, (curr-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public Tables getImurl(int id) {
		String hql="from Tables where id='"+id+"'";
		return (Tables) uniqueResult(hql);
	}
}
