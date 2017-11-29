package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.SkillAccomplishedDAO;
import com.techelevator.model.Skill;
import com.techelevator.model.Student;
import com.techelevator.model.StudentSkill;

@RestController
@CrossOrigin(origins = "*")
public class SkillAccomplishedController {

	@Autowired
	SkillAccomplishedDAO skillAccomplishedDao;
	
	@RequestMapping(path="/addAccomplishedSkill", method=RequestMethod.POST)
	public void saveAccomplishedSkill (@RequestParam int skillId, @RequestParam int studentId){
		skillAccomplishedDao.saveSkillAccomplished(skillId, studentId);
	}
	
}

