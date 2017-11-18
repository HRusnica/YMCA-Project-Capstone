package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.LoginDAO;
import com.techelevator.dao.ManagerDAO;

@Controller
public class ManagerController {
	
		@Autowired
		private ManagerDAO managerDAO;
		
		@RequestMapping(path="/addInstructor", method=RequestMethod.POST){
		
	}

}
