package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.ManagerDAO;
import com.techelevator.model.Instructor;
import com.techelevator.model.Login;

@Controller
public class ManagerController {
	
		@Autowired
		private ManagerDAO managerDao;
		
		@RequestMapping(path="/managerHome", method=RequestMethod.GET)
			public String getManagerHome(ModelMap modelHolder){
			if(! modelHolder.containsAttribute("instructor")) {
				modelHolder.addAttribute("instructor", new Login());
			}
			return "managerHome";
		}
		
		@RequestMapping(path="/addInstructor", method=RequestMethod.POST)
			public String addInstructor(@Valid @ModelAttribute Instructor instructor, BindingResult result, RedirectAttributes flash){
				flash.addFlashAttribute("instructor", instructor);
//				if(result.hasErrors()){
//					flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "instructor", result);
//					return "redirect:/managerHome";
//				} 
				managerDao.saveInstructorEmail(instructor.getEmail());
				return "redirect:/managerHome";
		}
}