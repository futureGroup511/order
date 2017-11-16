package com.future.order.action.manager;

import java.io.UnsupportedEncodingException;
import java.util.List;
import com.future.order.base.BaseAction;
import com.future.order.entity.MenuType;
import com.future.order.entity.User;

/**
 * 
 * @author 金高
 *
 */
public class ChangeAction extends BaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sort;//获得用户的身份
	private String msg;//获得返回信息
	public String add(){
		return "add";
	}

	// 用户模块中转站
	public String addUser() {
		return "addUser";
	}

	// 配料模块中转站
	public String addIngredient() {
		return "addIngredient";
	}

	// 菜品模块中转站
	public String addMenu() {
		List<MenuType> list = menuTypeService.getAllMenuType();
		request.put("Typelist", list);
		return "addMenu";
	}

	public String addMenuType() {
		return "addMenuType";
	}

	// 餐桌中转站
	public String addTable() {
		return "addTable";
	}

	// 饭店中转站
	public String addRest() {
		return "addrest";
	}

	// 获得个人资料
	public String getMyself() throws UnsupportedEncodingException {
		User user = null;
		if(msg!=null){
			msg = new String(msg.getBytes("ISO-8859-1"), "UTF-8");			
			request.put("updateUserMsg", msg);
		}
		if (sort.equals("cashier")) {
			user = (User) session.get("cashier");
			request.put("user", user);
			return "cashierGetMyself";
		} else if (sort.equals("manager")) {
			user = (User) session.get("manager");
		}
		request.put("user", user);
		return "getMyself";
	}

	// 退出登录前,防倒退
	public String logOff() {
		request.put("sort", sort);
		return "logOff";
	}

	// 退出登录
	public String out() {
		if (sort.equals("manager")) {
			session.remove("manager");// 清除session中得user
		} else if (sort.equals("cashier")) {
			session.remove("cashier");
		}
		return "out";
	}

	// 域名管理，添加ip
	public String addIp() {
		return "addIp";
	}

	// 进货中转
	public String addStocks() {
		return "addstock";
	}

	// 支付方式中转
	public String addPayment() {
		return "addpayment";
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public final String getMsg() {
		return msg;
	}

	public final void setMsg(String msg) {
		this.msg = msg;
	}

}
