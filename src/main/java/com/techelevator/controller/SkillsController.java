package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.dao.ManagerDAO;
import com.techelevator.dao.SkillAccomplishedDAO;
import com.techelevator.dao.SkillIntroducedDAO;
import com.techelevator.dao.StudentDAO;
import com.techelevator.dao.SwimClassDAO;
import com.techelevator.model.Login;
import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Skill;

@Controller
public class SkillsController {
	
		@Autowired
		SkillIntroducedDAO skillIntroducedDao;
		
		@RequestMapping(path="/introducedSkills", method=RequestMethod.POST)
			public String saveSkillIntroduced(@RequestParam int skillId, @RequestParam(defaultValue="false") boolean introduced, @RequestParam int classId){
			System.out.println(classId);
			skillIntroducedDao.saveSkillIntroduced(skillId, introduced, classId);
			return "redirect:/instructorViewClasses";
		}
		
}
