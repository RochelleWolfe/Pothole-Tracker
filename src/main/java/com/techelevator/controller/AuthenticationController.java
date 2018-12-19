package com.techelevator.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDao;
import com.techelevator.model.User;
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
	public String displayHome(HttpSession session) {
		
		
		
		List<Pothole> potholeList = potholeDAO.getAllPotholes();

		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String json = objectMapper.writeValueAsString(potholeList);
			session.setAttribute("potholeJson", json);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		session.setAttribute("potholeList", potholeList);

		
		
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
	
	
	@RequestMapping(path="/{currentUser}/updatePothole", method=RequestMethod.POST)
	public String updatePotholeReport(@PathVariable String currentUser, @RequestParam String markerId) {
		Pothole thisHole = potholeDAO.getPotholeById(markerId);
		
		
		potholeDAO.updateReportCount(thisHole);
		return "redirect:/";
		
	}

	@RequestMapping(path="/{currentUser}/reportPothole", method=RequestMethod.POST)
	public String submitPotholeReport(@RequestParam String lat, 
										@RequestParam String lng, 
										@RequestParam String streetAdd, 
										@RequestParam int size,
										@RequestParam int depth,
																HttpSession session ) {
		User currentUser = (User)session.getAttribute("currentUser");
		String user = currentUser.getUserName();
		
		Pothole newHole = new Pothole();
		newHole.setLat(lat);
		newHole.setLng(lng);
		newHole.setStreetAdd(streetAdd);
		newHole.setSize(size);
		newHole.setDepth(depth);
		newHole.setUser(user);
		//newHole.setReportDate(java.time.LocalDate.now());
		potholeDAO.save(newHole); 
		
		return "redirect:/";
	}
	
	@RequestMapping(path="/{currentUser}/potholeList", method=RequestMethod.GET)
	public String displayListOfPotholes(@PathVariable String currentUser, 
			HttpSession session) {
		User newUser = (User)session.getAttribute("currentUser");
		String user = newUser.getUserName();
		
		List<Pothole> potholeList = potholeDAO.getAllPotholes();
		session.setAttribute("potholeList", potholeList);
		
		if(userDAO.isAdmin(user)) {
			return "adminPotholeList";
		} 
		return "userPotholeList";
	}
	
	
	@RequestMapping(path="/{currentUser}/potholeList", method=RequestMethod.POST)
	public String submitListOfPotholesAdmin(@RequestParam("repairing") List<Boolean> repairing,
			@RequestParam boolean admin_aware,
			@RequestParam String markerId,
			HttpSession session) {
//		System.out.println(repairing);
//		System.out.println(admin_aware);
		
		System.out.println(repairing);
		
		User currentUser = (User)session.getAttribute("currentUser");
		String user = currentUser.getUserName();

		Pothole updatePothole = new Pothole();
		//updatePothole.setRepairing(repairing);
		updatePothole.setAdmin_aware(admin_aware);
		updatePothole.setMarkerId(markerId);
		updatePothole.setUser(user);

		potholeDAO.updatePotholeList(updatePothole);
		

		return "redirect:/{currentUser}/potholeList";
	}
	
	@RequestMapping(path="/{currentUser}/potholeDelete", method=RequestMethod.POST)
	public String deletePotholes(
			@RequestParam String markerId,
			HttpSession session) {
		System.out.println(markerId);
		
		User currentUser = (User)session.getAttribute("currentUser");
		String user = currentUser.getUserName();
		
		potholeDAO.deletePothole(markerId);
		return "redirect:/{currentUser}/potholeList";
	} 
	


	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}
}
