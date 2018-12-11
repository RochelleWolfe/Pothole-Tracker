package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/users")
public class HomeController {

	
	@RequestMapping(path="/{userName}", method=RequestMethod.GET)
	public String displayUserHome(@PathVariable String userName,
										HttpSession session) {
		return "home";
	}
	
}
