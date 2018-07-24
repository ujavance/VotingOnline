package cn.ujavance.votingonline.dao;

import java.util.List;

import cn.ujavance.votingonline.entity.Question;
import cn.ujavance.votingonline.entity.Questionnaire;
import cn.ujavance.votingonline.entity.QuestionnaireFolder;
import cn.ujavance.votingonline.entity.User;

public interface IndexDao {
	
	public List<QuestionnaireFolder> getQuestionFolderList(User user);
	public List<Questionnaire> getQuestinFileList(String id);
	public List<Question> getQuestionsList(String id);
}
