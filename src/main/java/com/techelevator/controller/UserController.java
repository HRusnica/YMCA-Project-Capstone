package com.techelevator.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.Login;
import com.techelevator.model.Registration;

@Controller
public class UserController {

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String getMainScreen() {
		return "homePage";
	}

	@RequestMapping(path="/register", method=RequestMethod.GET)
	public String showRegistration(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("registration")){
			modelHolder.put("registration", new Registration());
		}
		 return "registerPage";
	}
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String processRegistration(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("registration")){
			modelHolder.put("registration", new Registration());
		}
		 return "registerPage";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String showLogin(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("login")){
			modelHolder.put("login", new Login());
		}
		return "loginPage";	
	}

}
