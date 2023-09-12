package com.web.innjoy.controller.filter;

import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginFilter extends GenericFilterBean {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String requestURI = httpRequest.getRequestURI();

		// /sec/ 경로에 대해서만 필터 동작
		if (requestURI.startsWith("/sec/")) {
			HttpSession session = httpRequest.getSession(false); // 세션 가져오기, 없으면 null
			System.out.println("filter 호출");
			if (session == null ||session.getAttribute("userId")==null && session.getAttribute("bsnId")==null && session.getAttribute("admId")==null ) { // 세션이 없거나 userId가 비어있으면,
				System.out.println("Session is Null");
				HttpServletResponse httpResponse = (HttpServletResponse) response;
				httpResponse.sendRedirect("/login");// 로그인 페이지 URL로 이동
				return;
			}
		}
		// 세션 존재 시,
		chain.doFilter(request, response);
	}
}