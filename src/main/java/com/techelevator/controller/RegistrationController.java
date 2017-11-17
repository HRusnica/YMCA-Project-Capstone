package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.RegistrationDAO;
import com.techelevator.model.Registration;

@Controller
public class RegistrationController {
	
	@Autowired
	private RegistrationDAO registrationDAO;
	
//	@RequestMapping(path="/register", method=RequestMethod.GET)
//	public String showRegistration(@ModelAttribute Registration registration){
//		
//		 return "registerPage";
//	}
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String processRegistration(@Valid @ModelAttribute("registration") Registration registration, BindingResult result, 
			RedirectAttributes flash){
		
		flash.addFlashAttribute("registration", registration);
		
		if(result.hasErrors()){
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "registration", result);
			return "redirect:/#register"; 
		}
		
		registrationDAO.saveUser(registration);
		 return "redirect:/";
	}	
	
	@RequestMapping(path="/confirmationPage", method=RequestMethod.GET)
	public String showConfirmationPage(){
		return "/confirmationPage";
	}
	
}
