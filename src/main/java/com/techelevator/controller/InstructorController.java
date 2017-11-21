package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.InstructorDAO;
import com.techelevator.model.Instructor;

@Controller
public class InstructorController {
	
	@Autowired
	private InstructorDAO instructorDao;
	
	@RequestMapping(path="/instructorHome", method=RequestMethod.GET)
	public String getInstructorHomePage() {
		return "instructorHome";
	}
//	@RequestMapping(path="/addStudent", method=RequestMethod.POST)
//	public String addInstructor(@Valid @ModelAttribute Student student, BindingResult result, RedirectAttributes flash){
//		flash.addFlashAttribute("student", student);
//
//		instructorDao.addStudent(student);
//		return "redirect:/managerHome";
//}

}
