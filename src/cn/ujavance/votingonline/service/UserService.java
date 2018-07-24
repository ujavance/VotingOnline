package cn.ujavance.votingonline.service;

import cn.ujavance.votingonline.entity.User;

public interface UserService {

	User hasThisAccount(User user);

	boolean createAccount(User user);

}
