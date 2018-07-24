package cn.ujavance.votingonline.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ujavance.votingonline.utils.CookieUtil;

public class LoginFilter implements Filter {
    private int testNum = 0;
	@Override
	public void destroy() {
		System.out.println("用户登录的过滤器被销毁");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain)throws IOException, ServletException {
		
		HttpServletRequest request2 = (HttpServletRequest)request;
		System.out.println("登录判断过滤器执行.." + 
				request2.getPathInfo());
		HttpServletResponse response2 = (HttpServletResponse) response;
		//验证是否有登录
		boolean isRememberAccount = false;
		if (CookieUtil.getUserFromCookie(request2) != null) {
			// 本地保存有 记住登录信息
			isRememberAccount = true;
			System.out.println("Have cookie about user info - LoginFilter");
		}
		if(request2.getSession().getAttribute("user") == null && !isRememberAccount){
			// 第一个/表示项目的根目录
			response2.sendRedirect(request2.getContextPath() + "/index.jsp");
			System.out.println("LoginFilter No any account info");
			return;
		}
		
		//把请求与响应向下一个过滤器传递。
		chain.doFilter(request2, response2);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("用户登录的过滤器被初始化");
	}

}
