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
 * Servlet Filter implementation class LoginFile
 */

public class LoginFile implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFile() {
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
		
		// 张金高修改
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
		System.out.println(hRequest.getRequestURI());
		User user = (User) hRequest.getSession().getAttribute("user");// 获得登陆用户
		int id = 0;
		if (hRequest.getSession().getAttribute("userId") != null) {
			id = (int) hRequest.getSession().getAttribute("userId");// 获得顾客桌号
		}
		String path = hRequest.getRequestURI();

		String returnUrl = hRequest.getContextPath() + "/index.jsp";
		System.out.println(returnUrl);
		System.out.println("------------a");
		if (user != null || id != 0 || path.equals(returnUrl)) {
			System.out.println("------------b");
			chain.doFilter(request, response);
			return;
		} else {
			System.out.println("重新登录");
//			hResponse.sendRedirect(returnUrl);
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 转码
			response.getWriter().println(
							"<script language=\"javascript\">"
							+ "if(window.opener==null){window.top.location.href=\""
									+ returnUrl+ "\";}else{window.opener.top.location.href=\""
									+ returnUrl
									+ "\";window.close();}</script>");
			return;
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
