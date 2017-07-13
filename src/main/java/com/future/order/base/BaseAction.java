package com.future.order.base;

import java.util.Map;



import javax.annotation.Resource;
import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.future.order.service.IInformService;
import com.future.order.service.IIngerdientService;
import com.future.order.service.IMenuMaterialService;
import com.future.order.service.IMenuService;
import com.future.order.service.IMenuTypeService;
import com.future.order.service.IOrderDetailsService;
import com.future.order.service.IOrderService;
import com.future.order.service.IRestaurantService;
import com.future.order.service.IShopCartService;
import com.future.order.service.IStockDetailsService;
import com.future.order.service.IStockService;
import com.future.order.service.ITablesService;
import com.future.order.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware,RequestAware{

	/**
	 * 这是一些对于session、request的一种定义以便在后来对其直接的引用
	 */
	private static final long serialVersionUID = 1L;
	
	protected Map<String,Object> session;
	protected Map<String,Object> request;
	//service 注入
	@Resource
	protected IInformService informService;
	@Resource
	protected IIngerdientService ingerdientService;
	@Resource
	protected IMenuMaterialService menuMaterialService;
	@Resource
	protected IMenuService menuService;
	@Resource
	protected IMenuTypeService menuTypeService;
	@Resource
	protected IOrderDetailsService orderDetailsService;
	@Resource
	protected IOrderService orderService;
	@Resource
	protected IShopCartService shopCartService;
	@Resource
	protected IStockDetailsService stockDetailsService;
	@Resource
	protected IStockService stockService;
	@Resource
	protected ITablesService tablesService;
	@Resource
	protected IUserService userService;
	@Resource
	protected IRestaurantService restaurantService;
		
	protected HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
	
	protected ServletContext getContext(){
		return ServletActionContext.getServletContext();
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public Map<String,Object> getSession(){
		return session;
	}
	
	public Map<String, Object> getRequest() {
		return request;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
