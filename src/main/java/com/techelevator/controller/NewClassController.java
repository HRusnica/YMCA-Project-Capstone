package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.ScheduledClassDAO;
import com.techelevator.model.ScheduledClass;

@RestController
@CrossOrigin(origins = "*")
public class NewClassController {
	
	@Autowired
	ScheduledClassDAO scheduledClassDao;
	
	@RequestMapping(path = "/newScheduledClass", method = RequestMethod.POST)
	public void saveNewClass(@ModelAttribute ScheduledClass scheduledClass) {
		System.out.println("Hey");
		scheduledClassDao.saveScheduledClass(scheduledClass);
		System.out.println(scheduledClass.getDayOfWeek());
	}
	
}
