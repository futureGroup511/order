package com.future.order.service;




import com.future.order.entity.Restaurant;

/**
 * @author 安李杰
 *
 */

public interface IRestaurantService {

	public Restaurant getOne();
	public int Select();

	public boolean addRestaurant(Restaurant restaurant);

	public Restaurant select();

	public boolean updateRestaurant(Restaurant restaurant);
}
