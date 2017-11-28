package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Skill;
import com.techelevator.model.StudentSkill;
import com.techelevator.model.SwimClass;

public interface SwimClassDAO {

	public List<SwimClass> getAllClasses();
	public List<Skill> getSkills(int classId);
	public List<StudentSkill> getStudentSkills(int studentId);
	public SwimClass getClassByClassId(int classId);
	
	List<Skill> getSkillsByCLassId(int classId);
}
