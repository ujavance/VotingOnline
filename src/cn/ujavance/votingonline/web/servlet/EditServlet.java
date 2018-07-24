package cn.ujavance.votingonline.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ujavance.votingonline.web.base.BaseServlet;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends BaseServlet {
	
	public String registerUI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "jsp/edit.jsp";
	}

}
