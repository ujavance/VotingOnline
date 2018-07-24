package cn.ujavance.votingonline.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.service.UserService;
import cn.ujavance.votingonline.service.serviceimpl.UserServiceImpl;

public class CookieUtil {
	
	public static User getUserFromCookie(HttpServletRequest req) throws UnsupportedEncodingException {
		Cookie[] cookies = req.getCookies();
        String pathLogin = req.getContextPath()+"/jsp/login.jsp";
        if(cookies == null){
            return null;
        }else{
            //将cookie中的username和password
            String username = "";
            String password = "";
            for (Cookie cookie : cookies) {
                if("username".equals(cookie.getName())){
                    username = URLDecoder.decode(cookie.getValue(), "utf-8") ;
                } else if("password".equals(cookie.getName())){
                    password = cookie.getValue();
                }
            }
            if("".equals(username) || "".equals(password)){
                return null;
            }else{
                User user = new User();
                user.setPassword(password);
                user.setUsername(username);
                return user;
            }
        }
	}
	public static void setUserToCookie(User user, HttpServletResponse response) {
		 //表示用户需要记住用户名和密码自动登录
		final int saveTime = 60*60*24*7;
       Cookie c;
		try {
			c = new Cookie("username", URLEncoder.encode(user.getUsername(), "utf-8"));
	        c.setMaxAge(saveTime);
	        c.setPath("/");
	        response.addCookie(c);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       Cookie c2 = new Cookie("password",user.getPassword() );
       c2.setMaxAge(saveTime);
       c2.setPath("/");
       response.addCookie(c2);
	}
}
