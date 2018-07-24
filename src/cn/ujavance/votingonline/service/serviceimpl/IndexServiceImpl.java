package cn.ujavance.votingonline.service.serviceimpl;

import java.util.List;

import cn.ujavance.votingonline.dao.IndexDao;
import cn.ujavance.votingonline.dao.daoimpl.IndexDaoImpl;
import cn.ujavance.votingonline.entity.Question;
import cn.ujavance.votingonline.entity.Questionnaire;
import cn.ujavance.votingonline.entity.QuestionnaireFolder;
import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.service.IndexService;

public class IndexServiceImpl implements IndexService {

	private IndexDao indexDao = new IndexDaoImpl();
	
	@Override
	public  List<Questionnaire>  getQuestinFileList(String folderId) {
		// TODO Auto-generated method stub
		return indexDao.getQuestinFileList(folderId);
	}

	@Override
	public List<QuestionnaireFolder> getQuestionFolderList(User user) {
		// TODO Auto-generated method stub
		return indexDao.getQuestionFolderList(user);
	}

	@Override
	public List<Question> getQuestionsList(String id) {
		// TODO Auto-generated method stub
		return indexDao.getQuestionsList(id);
	}

}
