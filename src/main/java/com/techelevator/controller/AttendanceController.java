package com.techelevator.controller;

import java.util.List;

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
public class AttendanceController {
	
	@Autowired
	StudentDAO  studentDao;
	
	@RequestMapping(path="/studentList", method = RequestMethod.GET)
	public List<Student> getAllStudentsAttendance(@ModelAttribute Student student){
		List<Student> students = studentDao.getAllStudentsByClass(student.getClassId());
		return students;
	}
	@RequestMapping(path = "/attendance", method = RequestMethod.POST)
	public void saveAttendance (@ModelAttribute Student student) {
		studentDao.saveStudent(student);
	}

}
