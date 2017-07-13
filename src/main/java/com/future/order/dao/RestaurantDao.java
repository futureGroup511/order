package com.future.order.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Order;
import com.future.order.entity.Restaurant;
import com.future.order.service.IRestaurantService;


/**
 * @author 安李杰
 *
 */
@Service
public class RestaurantDao extends BaseDao<Restaurant>  implements IRestaurantService{

	@Override
	public Restaurant getOne() {
		String hql="from Restaurant where id=(select max(id) from Restaurant)";
		Restaurant restaurant=(Restaurant) uniqueResult(hql);
		return restaurant;
	}

}
