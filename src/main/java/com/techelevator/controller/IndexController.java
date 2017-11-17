package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.RegistrationDAO;
import com.techelevator.model.Login;
import com.techelevator.model.Registration;

@Controller
public class IndexController {
	
	@Autowired
	private RegistrationDAO registrationDAO;
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String getMainScreen(@ModelAttribute Registration registration, @ModelAttribute Login login) {
		return "index";
	}
	
}
