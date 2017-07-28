package com.future.order.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class CustomerFilter
 */
public class CustomerFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CustomerFilter() {
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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 转码
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
		int urlId = 0;
		if(hRequest.getParameter("id")!=null&&hRequest.getParameter("id")!=""){			//获得顾客桌号
			urlId = Integer.parseInt(hRequest.getParameter("id"));
		} 
		int sessionId = 0;
		if(hRequest.getSession().getAttribute("userId")!=null){		//当不在顾客首页时使用从session中封装的session，避免其他页面参数为id
			sessionId = (int) hRequest.getSession().getAttribute("userId");	
			
		}
		if(hRequest.getRequestURI().indexOf("toIndex")==-1&&sessionId!=0){
			chain.doFilter(request, response);
			return;												//避免在非首页时传参为id的情况
		} else if(hRequest.getRequestURI().indexOf("toIndex")!=-1&&urlId!=0){
			chain.doFilter(request, response);
			return;
		}  else {		//当顾客没有登录或超时时跳转到超时界面
			String errorPath = hRequest.getContextPath()+"/overtime.jsp";	
			response.getWriter()
			.println("<script language=\"javascript\">" + "if(window.opener==null){window.top.location.href=\""
					+ errorPath + "\";}else{window.opener.top.location.href=\"" + errorPath
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
