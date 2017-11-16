package com.future.order.filter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.future.order.entity.User;


/**
 * @张金高
 */

/**
 * Servlet Filter implementation class LoginFilter
 */

public class LoginFilter implements Filter {
	
	private FilterConfig Config;
	
	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 转码
		HttpServletRequest hRequest = (HttpServletRequest) request;
		User cook = (User) hRequest.getSession().getAttribute("cook");// 获得登陆用户
		User manager = (User) hRequest.getSession().getAttribute("manager");// 获得登陆用户
		User cashier = (User) hRequest.getSession().getAttribute("cashier");// 获得登陆用户
		String returnUrl = hRequest.getContextPath() + "/index.jsp";
		String path = hRequest.getRequestURI();
		String parameters = hRequest.getQueryString();//获得参数
		boolean boo = true;
		if(cook!=null&&path.indexOf("cook")!=-1){	//当厨师登录并访问的是厨师action时放行
			chain.doFilter(request, response);
		} else if(manager!=null&&path.indexOf("manage")!=-1){	//当管理员登录并访问的是管理员action时放行
			if(parameters!=null&&parameters.indexOf("sort=cashier")!=-1){//当参数里含有sort=cashier时说明进入的是收银员，禁止进入
				boo = false;				
			}else {
				chain.doFilter(request, response);
			}
		} else {		//当用户为登录或登录超时时提醒并跳转到登录界面
			boo = false;
		}
		if(cashier!=null&&path.indexOf("manage")!=-1){	//当收银员登录并访问的是收银员action时放行//当登录了管理员，又登录了收银员，没有退出管理员去访问收银员方法时会拦截，防止此情况
			if(parameters!=null&&parameters.indexOf("sort=cashier")!=-1){
				chain.doFilter(request, response);				
			} else {
				boo = false;
			}
		}
		if(!boo){
			response.getWriter()
			.println("<script language=\"javascript\">" +"alert(\"登录失效！请重新登录\");"+ "if(window.opener==null){window.top.location.href=\""
					+ returnUrl + "\";}else{window.opener.top.location.href=\"" + returnUrl
					+ "\";window.close();}</script>");
			return;
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		Config = fConfig;
	}

}
