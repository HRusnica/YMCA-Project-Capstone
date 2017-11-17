package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String getMainScreen(ModelMap modelHolder) {
		if(! modelHolder.containsAttribute("login")) {
			modelHolder.addAttribute("login", new Login());
		}
		if(! modelHolder.containsAttribute("registration")) {
			modelHolder.addAttribute("registration", new Registration());
		}
		return "index";
	}
	
}
