package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.techelevator.dao.LoginDAO;


@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO loginDAO;
	
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
			return "redirect:/confirmationPage";
			}
		} else {
			return "redirect:/";
		}
	}

}
