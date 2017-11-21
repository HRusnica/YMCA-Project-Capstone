package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.dao.InstructorDAO;
import com.techelevator.dao.LoginDAO;
import com.techelevator.model.AppUser;
import com.techelevator.model.Instructor;
import com.techelevator.model.Login;


@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO loginDAO;
	private InstructorDAO instructorDao;
	
	@RequestMapping(path="/users", method=RequestMethod.GET)
	public String getClasses(){
		return "users";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String makeLogin(@RequestParam String email, 
			@RequestParam String password, HttpServletRequest request,
			@RequestParam(required=false) String destination, ModelMap modelHolder, 
			HttpSession session){
		
		if(loginDAO.searchForEmailAndPassword(email, password)) {
			request.changeSessionId();
			request.getSession().setAttribute("email", email);
			
			AppUser user = loginDAO.getUser(email);
				
			if(destination != null && !destination.isEmpty()){
				return "redirect:" + destination;
			}else if(loginDAO.getRole(email).equals("manager")){
				if(! modelHolder.containsAttribute("instructor")) {
					modelHolder.addAttribute("instructor", new Login());
				}
				if(! modelHolder.containsAttribute("student")) {
					modelHolder.addAttribute("student", new Login());
				}
				return "redirect:/managerDashboard";
			} else if(loginDAO.getRole(email).equals("instructor")){
					Instructor loggedInInstructor = instructorDao.InstructorByEmail(email);
					request.getSession().setAttribute("instructor", loggedInInstructor);
				}
				return "redirect:/instructorDashboard";
		} else {
			return "redirect:/";
		}
	}

}
