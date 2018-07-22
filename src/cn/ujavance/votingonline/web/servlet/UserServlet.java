package cn.ujavance.votingonline.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ujavance.votingonline.entity.Question;
import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.utils.MyBeanUtils;
import cn.ujavance.votingonline.web.base.BaseServlet;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {

	public void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		MyBeanUtils.populate(user, request.getParameterMap());
		System.out.println(user);
	}

	public void createQuestion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 保存所有题目
		List allQuestion = new ArrayList<Question>();
		
		String jsonStr = request.getParameter("data");
		/* [{"title": "你最喜欢的明星？", "options": ["周***","王**","王**","王**"]}] */
		JSONArray json = JSONArray.fromObject(jsonStr);
		for (int i = 0; i < json.size(); i++) {
			// 遍历 jsonarray 数组，把每一个对象转成 json 对象,得到 每个对象中的属性值
			JSONObject job = json.getJSONObject(i);

			Question question = new Question();
			JSONArray jsonOptions = job.getJSONArray("options");
			List<String> options = new ArrayList<String>();
			for (int j = 0; j < jsonOptions.size(); j++) {
				options.add((String) jsonOptions.get(j));
			}
			question.setTitle((String) job.get("title"));
			question.setOption(options);
			// System.out.println("question :" + question);
			
			allQuestion.add(question);
		}
		System.out.println("allQuestion : " + allQuestion);
		// 将所有题目存入数据库
		
	}
}
