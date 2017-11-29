package com.techelevator.dao;

import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Skill;

public interface SkillIntroducedDAO {

	

	public void saveSkillIntroduced(int skillId, boolean introduced, int classId);


}
