package cn.ujavance.votingonline.service;

import java.util.List;

import cn.ujavance.votingonline.entity.Question;
import cn.ujavance.votingonline.entity.Questionnaire;
import cn.ujavance.votingonline.entity.QuestionnaireFolder;
import cn.ujavance.votingonline.entity.User;

public interface IndexService {

	public List<Question> getQuestionsList(String id);
	public List<QuestionnaireFolder> getQuestionFolderList(User user);

	public List<Questionnaire> getQuestinFileList(String folderId);
}
