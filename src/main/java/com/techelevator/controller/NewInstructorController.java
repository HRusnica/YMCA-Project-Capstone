package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.InstructorDAO;
import com.techelevator.model.Instructor;


@RestController
@CrossOrigin(origins = "*")
public class NewInstructorController {
	
	@Autowired
	InstructorDAO instructorDao;

	@RequestMapping(path = "/newInstructor", method = RequestMethod.POST)
	public void saveInstructor(@ModelAttribute Instructor instructor) {
		instructorDao.saveInstructor(instructor);
		System.out.println(instructor.getEmail());
	}

}
