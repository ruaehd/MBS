package com.mbs.mvc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserLoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpsession = request.getSession();
		String path = request.getServletPath();
		String query = request.getQueryString();
		String ps = path.toString().substring(1, 6);
		String url = null;
		
		if (httpsession.getAttribute("Mem_Id") != null) {
			if (ps.equals("admin")) {
				int gr = (Integer) httpsession.getAttribute("Mem_Grade");
				if (gr == 3) {
					if (query != null) {
						httpsession.setAttribute("back_url", path + "?" + query);
					} 
					else {
						httpsession.setAttribute("back_url", path);
					}
					return super.preHandle(request, response, handler);
				}
				else {
					url = "/mvc/ad_alert.do";
				}
			}
		}
		else {
			if (query != null) {
				httpsession.setAttribute("back_url", path + "?" + query);
			} 
			else {
				httpsession.setAttribute("back_url", path);
			}
			url = "/mvc/user_login.do";
		}
		if(url == null) {
		return super.preHandle(request, response, handler);
		}
		else {
			response.sendRedirect(url);
			return false;
		}
	}
}
