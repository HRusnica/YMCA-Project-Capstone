package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.StudentDAO;
import com.techelevator.model.Student;

@RestController
@CrossOrigin(origins = "*")
public class NewStudentController {
	
	@Autowired
	StudentDAO studentDao;
	
	@RequestMapping(path = "/newStudent", method = RequestMethod.PUT)
	public void saveStudent (@ModelAttribute Student student) {
		studentDao.saveStudent(student);
	}

}
