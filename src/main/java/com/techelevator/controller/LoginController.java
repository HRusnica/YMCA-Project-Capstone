package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.LoginDAO;
import com.techelevator.model.Login;
import com.techelevator.model.Registration;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO loginDAO;
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String getMainScreen() {
		return "homePage";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String showLogin(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("login")){
			modelHolder.put("login", new Login());
		}
		return "loginPage";	
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String makeLogin(@RequestParam String email, 
			@RequestParam String password, HttpServletRequest request,
			@RequestParam(required=false) String destination){
		
		if(loginDAO.searchForEmailAndPassword(email, password)) {
			request.changeSessionId();
			request.getSession().setAttribute("email", email);
			if(destination!=null&& !destination.isEmpty()){
				return "redirect:" + destination;
			}else{
			return "redirect:/confirmationPage/";
			}
		} else {
			return "redirect:/login";
		}
	}
//	@RequestMapping(path="/login", method=RequestMethod.POST)
//	public String login(@RequestParam String userName, 
//						@RequestParam String password, 
//						HttpServletRequest request,
//						@RequestParam(required=false) String destination) {
//		if(userDAO.searchForUsernameAndPassword(userName, password)) {
//			request.changeSessionId();
//			request.getSession().setAttribute("currentUser", userName);
//			if(destination!=null&& !destination.isEmpty()){
//				return "redirect:" + destination;
//			}else{
//			return "redirect:/users/"+userName;
//			}
//		} else {
//			return "redirect:/login";
//		}
//	}
	
	@RequestMapping(path="/index", method=RequestMethod.GET)
	public String laurensGloriousIndex(){
		 return "index";
	}
}
