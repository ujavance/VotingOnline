package cn.ujavance.votingonline.dao;

import cn.ujavance.votingonline.entity.User;

public interface UserDao {

	boolean createAccount(User user);

	User hasThisAccount(User user);

}
