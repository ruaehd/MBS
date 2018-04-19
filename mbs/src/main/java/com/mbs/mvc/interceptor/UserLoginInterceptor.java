package com.mbs.mvc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserLoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception {
		String path = request.getServletPath();
		System.out.println(path);
		String query = request.getQueryString();
		
		HttpSession httpsession = request.getSession();
		if(query != null) {
			httpsession.setAttribute("back_url", path+"?"+query);
		}
		else {
			httpsession.setAttribute("back_url", path);
		}
		return super.preHandle(request,response,handler);
	}
}
