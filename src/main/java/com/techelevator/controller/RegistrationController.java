package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.dao.RegistrationDAO;
import com.techelevator.model.Registration;

@Controller
public class RegistrationController {
	private RegistrationDAO registrationDAO;
	
	@RequestMapping(path="/register", method=RequestMethod.GET)
	public String showRegistration(@ModelAttribute Registration registration){
		
		 return "registerPage";
	}
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String processRegistration(@RequestParam String email, @RequestParam String password){
		System.out.println(email);
		System.out.println(password);
//		flash.addFlashAttribute("registration", registration);
//		
//		if(result.hasErrors()){
//			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "registration", result);
//			return "redirect:/loginPage";
//		}
//		
		registrationDAO.saveUser(email, password);
		 return "redirect:/login";
	}	
	
	@RequestMapping(path="/confirmationPage", method=RequestMethod.GET)
	public String showConfirmationPage(){
		return "/confirmationPage";
	}
	
}
