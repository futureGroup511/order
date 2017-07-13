package com.future.order.service;

import java.util.List;

import com.future.order.entity.Restaurant;

public interface IRestaurantService {

	public int Select();

	public boolean addRestaurant(Restaurant restaurant);

	public Restaurant SelectAll();

	public boolean updateRestaurant(Restaurant restaurant);

}
