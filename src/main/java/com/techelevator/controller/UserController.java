package com.techelevator.controller;


import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.LoginDAO;
import com.techelevator.model.Login;
import com.techelevator.model.Registration;

@Controller
public class UserController {
	
	private LoginDAO loginDAO;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String getMainScreen() {
		return "homePage";
	}

	@RequestMapping(path="/register", method=RequestMethod.GET)
	public String showRegistration(@ModelAttribute Registration registration){
		
		 return "registerPage";
	}
	
	@RequestMapping(path="/index", method=RequestMethod.GET)
	public String laurensGloriousIndex(){
		 return "index";
	}
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String processRegistration(@ModelAttribute Registration registration, BindingResult result, 
			RedirectAttributes flash){
		
		flash.addFlashAttribute("registration", registration);
		
		if(result.hasErrors()){
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "registration", result);
			return "redirect:/loginPage";
		}
		
		loginDAO.saveUser(registration.getEmail(), registration.getPassword());
		 return "redirect:/login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String showLogin(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("login")){
			modelHolder.put("login", new Login());
		}
		return "loginPage";	
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String makeLogin(@Valid @ModelAttribute Login login, BindingResult result, 
			RedirectAttributes flash){
		
		flash.addFlashAttribute("login", login);
		
		if(result.hasErrors()){
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "login", result);
			return "redirect:/loginPage";
		}
		return "redirect:/confirmationPage";
	}

	@RequestMapping(path="/confirmationPage", method=RequestMethod.GET)
	public String showConfirmationPage(){
		return "/confirmationPage";
	}
}
