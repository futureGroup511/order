/**        
 * @author: 焦祥宇 

 * @date:   createDate：2017年5月22日 上午10:50:32   
 * @Description:  
 * 
 */
package com.future.order.dao;

import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;

import com.future.order.entity.Menu;
import com.future.order.entity.OrderDetails;
import com.future.order.service.IMenuService;
import com.future.order.util.PageCut;

@Service
public class MenuDao extends BaseDao<Menu> implements IMenuService {

	// wqj获取订单
	@Override
	public Menu Doorder(int id) {
		Menu menu = this.getEntity(id);
		return menu;
	}

	@Override
	public List<Menu> getAll() {
		List<Menu> list = new ArrayList<Menu>();
		try {
			String hql = "from Menu";
			list = this.getEntityList(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Menu> unfinish() {
		List<Menu> list = new ArrayList<Menu>();
		int exist = 0;
		String hql = "from Menu m where m.exist='" + exist + "'";
		list = this.getEntityList(hql);
		return list;
	}

	@Override
	public List<Menu> CheckDetails(int id) {// 根据订单id查询所有该菜单的详细信息
		@SuppressWarnings("unused")
		List<Menu> list = new ArrayList<Menu>();
		try {
			String hql = "from Menu m where m.id='" + id + "'";
			list = this.getEntityList(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

	public Menu get(int id) {
		String hql = "from Menu m where m.id='" + id + "'";
		Menu menu = (Menu) this.uniqueResult(hql);
		return menu;
	}

	@Override
	public List<Menu> ByName(String typeName) {
		System.out.println(typeName);
		if (XXX(typeName, "iso8859-1")) {
			try {
				typeName = new String(typeName.getBytes("iso8859-1"), "utf8");
				System.out.println("eee" + typeName);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String hql = "from Menu m where m.typeName='" + typeName + "'";
		return this.getEntityList(hql);
	}

	// 张金高加
	@Override
	public boolean addMenu(Menu menu) {// 根据菜品判断数据库里是否已存在该菜
		String hql = "from Menu where name='" + menu.getName() + "'";
		Menu menuDataBase = (Menu) this.uniqueResult(hql);
		if (menuDataBase == null) {
			menu.setCreateDate(new Date());
			return this.saveEntity(menu);
		}
		return false;
	}

	@Override
	public PageCut<Menu> getPageCut(int curr, int pageSize) {
		String hql = "select count(*) from Menu";
		String selectHql =  "from Menu";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Menu> pc = new PageCut<Menu>(curr, pageSize, count);
		pc.setData(this.getEntityLimitList(selectHql, (curr - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean updateUser(Menu menu) {
		return this.updateEntity(menu);
	}

	@Override
	public boolean deleteMenu(Menu menu) {
		return this.deleteEntity(menu);
	}

	@Override
	public Menu inquiryByName(String inquiry) {
		String hql = "from Menu where name = '" + inquiry + "'";
		return (Menu) this.uniqueResult(hql);
	}

	/**
	 * @author 丁赵雷
	 * @date 2017/5/30 21:17
	 * @param str
	 *            需要判断的字符串
	 * @param charset
	 *            字符集
	 * @return 判断该字符串是哪种字符集
	 */
	public static boolean XXX(String str, String charset) {
		boolean flag = false;

		try {
			if (str.equals(new String(str.getBytes(charset), charset))) {
				return true;
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	/*
	 * 一下方法焦祥宇加
	 */
	@Override
	public List<Menu> getRecommend(int num) {
		String sql = "select * from tb_menu order by num desc limit " + num;
		return this.executeSQLQuery(sql);
	}

	@Override
	public List<Menu> getByTypeId(int typeId) {
		String hql = "from Menu m where m.typeId=" + typeId + " order by m.id desc";
		return this.getEntityList(hql);
	}

	@Override
	public boolean updatemenu(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageCut<Menu> getSomePageCut(int curr, int pageSize, String ask, String inquiry) {
		String hql = "select count(*) from Menu";
		String selectHql;
		if(ask.equals("price")){
			int mark = Integer.parseInt(inquiry);
			 selectHql =  "from Menu where "+ask+"='"+mark+"'";
		}else{
			 selectHql =  "from Menu where "+ask+"='"+inquiry+"'";
		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Menu> pc = new PageCut<Menu>(curr, pageSize, count);
		pc.setData(this.getEntityLimitList(selectHql, (curr - 1) * pageSize, pageSize));
		System.out.println(pc);
		return pc;
	}

}
