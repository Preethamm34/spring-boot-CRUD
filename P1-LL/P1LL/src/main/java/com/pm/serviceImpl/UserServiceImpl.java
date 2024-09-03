package com.pm.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.pm.model.User;
import com.pm.repository.UserRepository;
import com.pm.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;

	public UserServiceImpl(UserRepository userRepo) {
		super();
		this.userRepo = userRepo;
	}

	@Override
	public void saveUserDetails(User user) {
		userRepo.save(user);
	}

	// view all user List
	@Override
	public List<User> showAllUser() {
		return userRepo.findAll();
	}

	@Override
	public List<User> showAllUser1() {
		return userRepo.findAllUsers();
	}

	@Override
	public void deleteUser(int userId) {
		userRepo.deleteById(userId);
	}

	@Override
	public void updateUser(int userId, User user) {
		User existingUser = userRepo.findById(userId).orElse(null);
		if (existingUser != null) {
			existingUser.setUserId(user.getUserId());
			existingUser.setUserName(user.getUserName());
			existingUser.setPhoneNumber(user.getPhoneNumber());
			existingUser.setEmailadd(user.getEmailadd());
			userRepo.save(existingUser);
		} else {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found with id: " + userId);
		}
	}

	@Override
	public User findUserEmailAndPsw(String emailadd, String password) {
		return userRepo.findUserEmailAndPsw(emailadd, password);
	}

}
