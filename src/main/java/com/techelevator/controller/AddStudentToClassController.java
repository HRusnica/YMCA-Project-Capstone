package com.techelevator.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.techelevator.dao.StudentDAO;
import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Student;
import com.techelevator.model.SwimClass;


@RestController
@CrossOrigin(origins = "*")
public class AddStudentToClassController {
		
		@Autowired
		StudentDAO studentDao;
		
		@RequestMapping(path="/addStudentToClass", method=RequestMethod.POST)
		public void saveStudentEnrollment (@ModelAttribute Student student) {
			System.out.println(student.getClassId());
			studentDao.saveStudentToClass(student.getStudentId(), student.getClassId());
		}
		
}
