package cn.ujavance.votingonline.dao.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.ujavance.votingonline.dao.IndexDao;
import cn.ujavance.votingonline.entity.Question;
import cn.ujavance.votingonline.entity.Questionnaire;
import cn.ujavance.votingonline.entity.QuestionnaireFolder;
import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.utils.JDBCUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class IndexDaoImpl implements IndexDao {

	@Override
	public List<Question> getQuestionsList(String id) {
		// TODO Auto-generated method stub
		List<Question> listQuestion = new ArrayList<Question>();
		String sql = "select * from t_question where t_question.questionId in (\r\n" + 
				"select t_questionnaire_question.questionId from t_questionnaire_question WHERE questionnaireId = ?)";
		
		Connection connection = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtil.getConnection();
			System.out.println(connection);
			st = connection.prepareStatement(sql);

			st.setString(1, id);

			rs = st.executeQuery();
			while (rs.next()) {
				Question questionTemp = new Question();
				/* [{"title": "你最喜欢的明星？", "options": ["周***","王**","王**","王**"]}] */
				JSONObject json = JSONObject.fromObject(rs.getString("questionOption"));
				JSONArray jsonOptions = json.getJSONArray("o");
				List<String> options = new ArrayList<String>();
				for (int j = 0; j < jsonOptions.size(); j++) {
					options.add((String) jsonOptions.get(j));
				}
				 
				questionTemp.setId(rs.getString("questionId"));
				questionTemp.setTitle(rs.getString("questionName"));
				questionTemp.setQuesType(rs.getInt("questionType"));
				questionTemp.setOptions(options);
				
				System.out.println("read question from database : " + questionTemp);
				listQuestion.add(questionTemp);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JDBCUtil.closeAll(connection, st, rs);
		}
		return listQuestion;
	}



	@Override
	public List<Questionnaire> getQuestinFileList(String id) {
		// TODO Auto-generated method stub
		List<Questionnaire> listQuestionnair = new ArrayList<Questionnaire>();
		String sql = "select * from t_questionnaire where t_questionnaire.questionnaireId in(\r\n" + 
				"	select t_folder_questionnaire.questionnaireId from t_folder_questionnaire where t_folder_questionnaire.folderId = ? \r\n" + 
				")";
		
		Connection connection = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtil.getConnection();
			System.out.println(connection);
			st = connection.prepareStatement(sql);

			st.setString(1, id);

			rs = st.executeQuery();
			while (rs.next()) {
				Questionnaire questionnaire = new Questionnaire();
				
				questionnaire.setQuestionnaireId(rs.getString("questionnaireId"));
				questionnaire.setIdDelete(rs.getInt("isDelete"));
				questionnaire.setIsImportant(rs.getInt("isImportant"));
				questionnaire.setQuestionnaireName(rs.getString("questionnaireName"));
				
				System.out.println("read questionnaire from database : " + questionnaire);
				listQuestionnair.add(questionnaire);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JDBCUtil.closeAll(connection, st, rs);
		}
		return listQuestionnair;
	}
	
	

	@Override
	public List<QuestionnaireFolder> getQuestionFolderList(User user) {
		// TODO Auto-generated method stub
		List<QuestionnaireFolder> listQuestionnair = new ArrayList<QuestionnaireFolder>();
		String sql = " select   t_user_folder.folderId, folderName  from   t_user_folder   left   join   t_folder     on   t_folder.folderId = t_user_folder.folderId WHERE t_user_folder.userid = ?";
		
		Connection connection = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtil.getConnection();
			System.out.println(connection);
			st = connection.prepareStatement(sql);

			st.setString(1, user.getUserid());

			rs = st.executeQuery();
			while (rs.next()) {
				QuestionnaireFolder folder = new QuestionnaireFolder();
				folder.setFolderId(rs.getString("folderId"));
				folder.setFolderName(rs.getString("folderName"));
				System.out.println("read folder from database : " + folder);
				listQuestionnair.add(folder);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JDBCUtil.closeAll(connection, st, rs);
		}
		return listQuestionnair;
	}

	
}
