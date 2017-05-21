package com.future.order.base;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;


import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected Map<String,Object> session;
	
	//service 注入
	/*@Resource
	protected IPartyIntroductionService partyIntroductionService;*/
	
	
	protected HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	
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
	
}
