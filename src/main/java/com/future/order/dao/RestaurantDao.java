package com.future.order.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
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
		String hql="from Restaurant";
		Restaurant restaurant=(Restaurant) uniqueResult(hql);
		return restaurant;
	}
	
	@Override
	public boolean addRestaurant(Restaurant restaurant) {
		return this.saveEntity(restaurant);
	}

	@Override
	public Restaurant select() {
		List<Restaurant> domain = this.selectAll();
		if(domain.size()==0){
			return null;
		}
		return this.selectAll().get(0);
	}

	@Override
	public boolean updateRestaurant(Restaurant restaurant) {
		return this.updateEntity(restaurant);
	}


	@Override
	public int getNums() {
		return getNum();
	}

}
