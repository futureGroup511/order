/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:46:40   
 * @Description:  
 * 
 */
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.StockDetails;
import com.future.order.service.IStockDetailsService;
import com.future.order.util.PageCut;

@Service
public class StockDetailsDao extends BaseDao<StockDetails> implements IStockDetailsService {
	@Override
	public PageCut<StockDetails> getPageCut(int currentPage, int pageSize, int stockid) {
		String hql;
		int count = 0;
		hql = "select count(*) from StockDetails o where o.stockId='" + stockid + "'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<StockDetails> pc = new PageCut<StockDetails>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from StockDetails o where o.stockId='" + stockid + "'",
				(currentPage - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean deletStockDetails(int id) {
		boolean sign = false;
		try {
			String hql = "delete from StockDetails o Where o.stockId='" + id + "'";
			int mark = this.executeUpdate(hql);
			if (mark == 1) {
				sign = true;
			} else {
				sign = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public List<StockDetails> getAll() {
		List<StockDetails> list = new ArrayList<StockDetails>();
		try {
			String hql = "from StockDetails";
			list = this.getEntityList(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StockDetails> getBycreateDate(int ingId) {
		String hql = "from StockDetails m where m.ingId=" + ingId;
		return this.getEntityList(hql);
	}

	@Override
	public boolean deletDetails(int stocksid) {
		boolean sign = false;
		try {
			String hql = "delete from StockDetails o where o.id='" + stocksid + "'";
			int mark = this.executeUpdate(hql);
			if (mark == 1) {
				sign = true;
			} else {
				sign = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public StockDetails checkById(int stocksid) {
		@SuppressWarnings("unused")
		StockDetails stockDetails = new StockDetails();
		try {
			String hql = "from StockDetails o where o.id='" + stocksid + "'";
			stockDetails = (StockDetails) this.uniqueResult(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stockDetails;
	}

	@Override
	public boolean updatestocks(StockDetails details) {
		boolean sign = false;
		try {
			sign = this.updateEntity(details);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	/*
	 * 焦祥宇加
	 */
	@Override
	public List<StockDetails> getByIngId(int ingId, int num) {
		String sql = "select * from tb_stockdetails s where s.ingId=" + ingId + " order by createDate desc limit "
				+ num;
		return this.executeSQLQuery(sql);
	}

	@Override
	public boolean addDetails(StockDetails details) {
		return this.saveEntity(details);
	}

	@Override
	public PageCut<StockDetails> getSomePageCut(int currentPage, int pageSize, int stockid,
			String inquiry) {
		String hql;
		String selecthql;
		int count = 0;
		hql = "select count(*) from StockDetails where concat (ingName,',',price,',',num) like '%"+inquiry+"%' and stockid = '"+stockid+"'";
		selecthql="from StockDetails where concat (ingName,',',price,',',num) like '%"+inquiry+"%' and stockid = '"+stockid+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<StockDetails> pc = new PageCut<StockDetails>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (currentPage - 1) * pageSize, pageSize));
		return pc;
	}

}
