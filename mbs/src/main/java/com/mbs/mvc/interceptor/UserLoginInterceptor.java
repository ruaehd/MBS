package com.mbs.mvc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserLoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception {
		HttpSession httpsession = request.getSession();
		if(httpsession.getAttribute("Mem_Id") == null) {
		String path = request.getServletPath();
		String query = request.getQueryString();
		if(query != null) {
			httpsession.setAttribute("back_url", path+"?"+query);
		}
		else {
			httpsession.setAttribute("back_url", path);
		}
		return super.preHandle(request,response,handler);
		}
		else {
			response.sendRedirect("/user_login.do");
			return false;
		}
	}
}
