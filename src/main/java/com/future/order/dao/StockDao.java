/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:47:06   
 * @Description:  
 * 
 */
package com.future.order.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Stock;
import com.future.order.service.IStockService;
import com.future.order.util.PageCut;

@Service
public class StockDao extends BaseDao<Stock> implements IStockService {

	@Override
	public boolean addStock(Stock stock) {
		boolean sign = false;
		try {
			sign = this.saveEntity(stock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public PageCut<Stock> getPageCut(int currentPage, int pageSize) {
		String hql;
		int count = 0;
		hql = "select count(*) from Stock";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Stock> pc = new PageCut<Stock>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Stock", (currentPage - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean deletStock(int id) {
		boolean sign = false;
		try {
			String hql = "delete from Stock o Where o.id='" + id + "'";
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
	public Stock checkById(int id) {
		@SuppressWarnings("unused")
		Stock stock = new Stock();
		try {
			String hql = "from Stock o where o.id='" + id + "'";
			stock = (Stock) this.uniqueResult(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stock;
	}

	@Override
	public boolean updateStock(Stock stocks) {
		boolean sign = false;
		try {
			sign = this.updateEntity(stocks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public PageCut<Stock> getSomePageCut(int currentPage, int pageSize, String inquiry) {
		String hql;
		int count = 0;
		String selecthql;
		hql = "select count(*) from Stock where concat (site,',',total) like '%"+inquiry+"%'";
		selecthql="from Stock where concat (site,',',total) like '%"+inquiry+"%'";
//		hql = "select count(*) from Stock where site='" + inquiry + "'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Stock> pc = new PageCut<Stock>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (currentPage - 1) * pageSize,
				pageSize));
		return pc;
	}

	@Override
	public List<Stock> getSomestock() {
		return selectAll();
	}

	@Override
	public PageCut<Stock> getSomePageCut(int currentPage, int pageSize, String starttime, String endtime) {
		String hql;
		int count = 0;
		hql = "select count(*) from Stock where createDate between '" + starttime + "' and '" + endtime + "'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Stock> pc = new PageCut<Stock>(currentPage, pageSize, count);
		pc.setData(
				this.getEntityLimitList("from Stock where createDate between '" + starttime + "' and '" + endtime + "'",
						(currentPage - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public List<Stock> getPrice(String starttime, String endtime) {
		String hql = "from Stock where createDate between '" + starttime + "' and '" + endtime + "'";
		return getEntityList(hql);
	}

	@Override
	public List<Stock> getTotal(String inquiry) {
		String selecthql="from Stock where concat (site,',',total) like '%"+inquiry+"%'";
		return getEntityList(selecthql);
	}

	@Override
	public Stock getStock(int stocksid) {
		String hql = "from Stock where id='" + stocksid + "'";
		return (Stock) uniqueResult(hql);
	}

}
