package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.SkillAccomplishedDAO;
import com.techelevator.model.StudentSkill;

@RestController
@CrossOrigin(origins = "*")
public class SkillAccomplishedController {

	@Autowired
	SkillAccomplishedDAO skillAccomplishedDao;
	
	@RequestMapping(path="/addAccomplishedSkill", method=RequestMethod.POST)
	public void saveAccomplishedSkill (@ModelAttribute StudentSkill studentSkill){

<<<<<<< HEAD
=======
<<<<<<< HEAD
		skillAccomplishedDao.saveSkillAccomplished(studentSkill.getSkillId(), studentSkill.getStudentId());

=======

>>>>>>> 7100adf0570e99b08ccb945b3cbf2e3ddcef975b
		skillAccomplishedDao.saveSkillAccomplished(studentSkill.getThisSkill().getSkillId(), studentSkill.getStudentId());
>>>>>>> f55e453b857b6542305d6249e933c8ba618f8431

	}
	
}

