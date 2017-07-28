package com.future.order.service;




import com.future.order.entity.Restaurant;

/**
 * @author 安李杰
 *
 */

public interface IRestaurantService {
	//获得酒店信息，安李杰用
	public Restaurant getOne();
	public int Select();

	public boolean addRestaurant(Restaurant restaurant);

	public Restaurant SelectAll();

	public boolean updateRestaurant(Restaurant restaurant);
}
