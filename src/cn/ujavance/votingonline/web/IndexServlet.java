package cn.ujavance.votingonline.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ujavance.votingonline.entity.QuestionnaireFolder;
import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.service.IndexService;
import cn.ujavance.votingonline.service.serviceimpl.IndexServiceImpl;
import cn.ujavance.votingonline.web.base.BaseServlet;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends BaseServlet {
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		//转发到/jsp/index.jsp
		return "/jsp/login.jsp";
	}
	
	public String  uiHome(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		//转发到/jsp/index.jsp
		return "/jsp/home.jsp";
	}

	public String  getFileOfFolder(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		//转发到/jsp/index.jsp
		String folderId = req.getParameter("folderId");
		IndexService indexServiceImpl = new IndexServiceImpl();
		
		JSONArray array = JSONArray.fromObject(indexServiceImpl.getQuestinFileList(folderId));
		JSONObject object = new JSONObject();
		object.put("filelist", array);
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		System.out.println(object.toString());
		pw.write(object.toString());
		pw.close();
		return null;
	}
	
	public String  getQuestOfFile(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		//转发到/jsp/index.jsp
		String folderId = req.getParameter("fileId");
		IndexService indexServiceImpl = new IndexServiceImpl();
		req.setAttribute("questions", indexServiceImpl.getQuestionsList(folderId));
		
		/*JSONArray array = JSONArray.fromObject(indexServiceImpl.getQuestionsList(folderId));
		JSONObject object = new JSONObject();
		object.put("questList", array);
		resp.setHeader("Content-type", "text/html;charset=UTF-8");  
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		System.out.println(object.toString());
		pw.write(object.toString());
		pw.close();*/
		return "jsp/edit.jsp";
	}
	
	
}
