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
 * Servlet Filter implementation class AllFilter
 */

public class AllFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AllFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		((HttpServletResponse)response).setHeader("Cache-Control","no-cache");
		
		//张金高修改
		HttpServletRequest hRequest = (HttpServletRequest)request;
		User user = (User) hRequest.getSession().getAttribute("user");
		System.out.println("User "+user);
		String path = hRequest.getRequestURI();
		System.out.println("returnUri:----"+hRequest.getRequestURI()+" url");
		if(user!=null||path.equals("/order/")){
			chain.doFilter(request, response);
			return ;
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
