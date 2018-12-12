package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDao;

@Controller
@RequestMapping(value = "/users")
public class HomeController {

	private PotholeDao potholeDao;
	
	@RequestMapping(path="/{userName}", method=RequestMethod.GET)
	public String displayUserHome(@PathVariable String userName,
										HttpSession session) {
		
		List<Pothole> potholeList = potholeDao.getAllPotholes();
		session.setAttribute("potholeList", potholeList);
		
		return "home";
	}

	
	
}
