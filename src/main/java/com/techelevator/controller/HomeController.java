package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDao;

@Controller
@RequestMapping(value = "/users")
public class HomeController {

	@Autowired
	private PotholeDao potholeDao;

	@RequestMapping(path = "/{userName}", method = RequestMethod.GET)
	public String displayUserHome(@PathVariable String userName, HttpSession session) {
		
		//session.setAttribute("currentUser", userName);
		
		List<Pothole> potholeList = potholeDao.getAllPotholes();

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

}
