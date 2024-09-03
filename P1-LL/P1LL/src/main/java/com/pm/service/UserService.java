package com.pm.service;

import java.util.List;

import com.pm.model.User;

public interface UserService {
	
	//1
	public void saveUserDetails(User user); // to add/save user details
	
	//2
	public List<User> showAllUser(); // view all user List (defauly method)

	public List<User> showAllUser1(); // view all user List (customised method)
	
	//4
	public void deleteUser(int userId);
	
	//3
	public void updateUser(int userId,User user);

	//5 for login
	public User findUserEmailAndPsw(String emailadd, String password);
}
