package com.pm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pm.model.User;
import com.pm.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@Controller
@RequestMapping(value = { "/lgn" })
public class LogonController {

	@Autowired
	private UserService userService;

	public LogonController(UserService userService) {
		super();
		this.userService = userService;
	}

	@RequestMapping("/loginP")
	public String loginP() {
		return "loginP";
	}

	@RequestMapping("/registerP")
	public String registerP(Model model, User user) {
		model.addAttribute("user", user);
		return "registerP";
	}

	@RequestMapping(value = "/editregister/{userId}", method = RequestMethod.GET)
	public String registerP2(Model model, @ModelAttribute User user) {
		model.addAttribute("user", user);
		return "registerP2";
	}

	// showing all user list
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList(Model model) {
		try {
			List<User> userList = userService.showAllUser();
			if (userList == null) {
				userList = new ArrayList<>();
			}
			model.addAttribute("userList", userList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "userList";
	}

	// save user details
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUserDetails(@Valid @ModelAttribute User user, RedirectAttributes redirectAttributes) {
		try {
			userService.saveUserDetails(user);
			redirectAttributes.addFlashAttribute("message", "User saved successfully.");
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Failed to save user details.");
		}
		return "redirect:/lgn/userList";
	}

	// deleting the user by Id
	@RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable("userId") int userId, RedirectAttributes redirectAttributes, User user) {
		try {
			userService.deleteUser(userId);
			redirectAttributes.addFlashAttribute("successMessage",
					" UserID " + user.getUserId() + " has been deleted successfully.");

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to delete the user.");
		}
		return "redirect:/lgn/userList";
	}

	// edit the user by Id
	@RequestMapping(value = "/editUser/{userId}", method = RequestMethod.POST)
	public String updateOrEditUser(@PathVariable("userId") int userId, Model model, @ModelAttribute User user) {
		try {
			userService.updateUser(userId, user);
			model.addAttribute("userId", userId);
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/lgn/userList";
	}

	// for user login
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		try {
			User checkDetails = userService.findUserEmailAndPsw(user.getEmailadd(), user.getPassword());
			if (checkDetails != null) {
				redirectAttributes.addFlashAttribute("smsg", "Login successful.");
				return "aftlogin";
			} else {
				redirectAttributes.addFlashAttribute("errormsg", "Login failed! Check credentials.");
				return "loginP";
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage",
					"An unexpected error occurred. Please try again later.");
			return "loginP";
		}
	}

	// for user logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		SecurityContextHolder.clearContext();
		HttpSession session = (HttpSession) request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/lgn/login";
	}

}
