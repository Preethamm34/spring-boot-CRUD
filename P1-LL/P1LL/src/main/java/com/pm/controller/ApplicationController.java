package com.pm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = { "/app" })
public class ApplicationController {

	@ResponseBody
	@RequestMapping("/homep")
	public String homePage() {
		return "hello buddy !";
	}

	@RequestMapping("/welcome")
	public String welcomePage() {
		return "welcome";
	}
}
