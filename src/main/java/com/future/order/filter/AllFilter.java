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
		 
//		String url = ((HttpServletRequest) request).getRequestURI();
//	        if (url.indexOf("/uploadImg") >= 0) {
//	        	System.out.println("使用自定义的过滤器,图片放行");
//	            chain.doFilter(request, response);
//	        }
		HttpServletRequest request2 = (HttpServletRequest)request;
		//System.out.println("url:"+request2.getRequestURL());
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
