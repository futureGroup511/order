package com.future.order.service;




import com.future.order.entity.Restaurant;

/**
 * @author 安李杰
 *
 */

public interface IRestaurantService {
	//获得酒店信息，安李杰加
	public Restaurant getOne();
	//添加饭店信息
	public boolean addRestaurant(Restaurant restaurant);
	//查询饭店信息
	public Restaurant select();
	//修改饭店信息
	public boolean updateRestaurant(Restaurant restaurant);
	//判断表中是否数据
	public int getNums();
}
