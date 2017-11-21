package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.InstructorDAO;

@Controller
public class InstructorController {
	
	@Autowired
	private InstructorDAO instructorDao;
	
	@RequestMapping(path="/instructorDashboard", method=RequestMethod.GET)
	public String getInstructorHomePage() {
		return "instructorDashboard";
	}

}
