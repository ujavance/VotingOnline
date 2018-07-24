package cn.ujavance.votingonline.web.filter;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.service.UserService;
import cn.ujavance.votingonline.service.serviceimpl.IndexServiceImpl;
import cn.ujavance.votingonline.service.serviceimpl.UserServiceImpl;
import cn.ujavance.votingonline.utils.CookieUtil;

public class AutoLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain arg2)
			throws IOException, ServletException {
        //第一步： 获取数据 （cookie username password）
        //HttpServletRequest?
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;
        
        System.out.println("AutoLoginFilter");
        // 未登录，前往登录页面
        String pathLogin = req.getContextPath()+"/jsp/login.jsp";
        User user = CookieUtil.getUserFromCookie(req);
        System.out.println("Get From Cookie : " + user);
        if(user != null) {
        	// 保存过用户信息
        	UserService userService = new UserServiceImpl();
        	//第三步：根局不同返回值，不同处理
        	User readFromDB = userService.hasThisAccount(user);
            if(readFromDB==null){
            	// 数据库查无此人
                res.sendRedirect(pathLogin);
                System.out.println("查无此人");
                return;
            }else{
                req.getSession().setAttribute("userInfo", readFromDB);
                req.setAttribute("folder", new IndexServiceImpl().getQuestionFolderList(readFromDB));
                req.getRequestDispatcher("/IndexServlet?method=uiHome").forward(req, res);
                return;
            }
        }else {
        	System.out.println("No cookie about user info - AutoFilter");
        	res.sendRedirect(pathLogin);
            return;
        }
    }

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
