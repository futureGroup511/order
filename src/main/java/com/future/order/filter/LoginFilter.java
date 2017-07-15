package com.future.order.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
		User user = (User) hRequest.getSession().getAttribute("user");// 获得登陆用户
		int id = 0;
		if(hRequest.getParameter("id")!=null){			//获得顾客桌号
			id = Integer.parseInt(hRequest.getParameter("id"));
		}
		String path = hRequest.getRequestURI();
		String returnUrl = hRequest.getContextPath() + "/index.jsp";
		String noPath =  Config.getInitParameter("noPath");		//获得不过滤的url
		System.out.println("判断外id--"+id);
		if(noPath!=null){
			String []str = noPath.split(";");
			for (int i = 0; i < str.length; i++) {
				if(str[i]==null||str[i]==""){
					continue;
				}
				if(hRequest.getRequestURI().indexOf(str[i])!=-1){
					chain.doFilter(request, response);
					return;						//若此时页面为不过滤页面则过滤器放行，不执行下面代码
				}
			}
		}
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 转码
		if (user != null || path.equals("/order/index.jsp")) {
			chain.doFilter(request, response);
			return;
		} else if(hRequest.getRequestURI().indexOf("toIndex")!=-1){
			System.out.println("id----------");
			if(id==0){
				String errorPath = hRequest.getContextPath()+"/error404.jsp";
				System.out.println("id"+id+" errorPath"+errorPath);
				response.getWriter()
				.println("<script language=\"javascript\">" + "if(window.opener==null){window.top.location.href=\""
						+ errorPath + "\";}else{window.opener.top.location.href=\"" + errorPath
						+ "\";window.close();}</script>");
			} else {
				chain.doFilter(request, response);
			}
			return;
		} else {
			response.getWriter()
					.println("<script language=\"javascript\">" + "if(window.opener==null){window.top.location.href=\""
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
