package cn.ujavance.votingonline.service.serviceimpl;

import cn.ujavance.votingonline.dao.UserDao;
import cn.ujavance.votingonline.dao.daoimpl.UserDaoImpl;
import cn.ujavance.votingonline.entity.User;
import cn.ujavance.votingonline.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDaoImpl = new UserDaoImpl();
	
	@Override
	public User hasThisAccount(User user) {
		// TODO Auto-generated method stub
		return userDaoImpl.hasThisAccount(user);
	}

	@Override
	public boolean createAccount(User user) {
		// TODO Auto-generated method stub
		boolean createOk = false;
		
		
		createOk = userDaoImpl.createAccount(user);	
		return createOk;
	}

}
