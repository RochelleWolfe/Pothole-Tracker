package com.techelevator.controller;



import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDao;
import com.techelevator.model.UserDAO;


@Controller
public class AuthenticationController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PotholeDao potholeDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayHome() {
		return "home";
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(@RequestParam String userName, 
						@RequestParam String password, 
						@RequestParam(required=false) String destination,
						HttpSession session) { 
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			session.setAttribute("currentUser", userDAO.getUserByUserName(userName));
			
			if(destination != null && ! destination.isEmpty()) {
				return "redirect:" + destination;
			} else {
				return "redirect:/users/"+userName;
			}
		} else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(path="/{currentUser}/reportPothole", method=RequestMethod.GET)
	public String displayPotholeReoprt(@PathVariable String currentUser,
			HttpSession session) {
		return "reportPothole";
	}

	@RequestMapping(path="/{currentUser}/reportPothole", method=RequestMethod.POST)
	public String submitPotholeReport(@RequestParam String lat, @RequestParam String lng, 
			@RequestParam String img, @RequestParam String streetAdd, @RequestParam int size,
			HttpSession session ) {
		Pothole newHole = new Pothole();
		newHole.setLat(lat);
		newHole.setLng(lng);
		newHole.setImg(img);
		newHole.setStreetAdd(streetAdd);
		newHole.setSize(size);
		potholeDAO.save(newHole); 
		
		return "redirect:/users/{currentUser}";
	}


	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}
}
