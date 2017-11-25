package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Skill;
import com.techelevator.model.StudentSkill;
import com.techelevator.model.SwimClass;



@Component
public class SwimClassJdbcDao implements SwimClassDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public SwimClassJdbcDao(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<SwimClass> getAllClasses() {
		List<SwimClass> allClasses= new ArrayList<>();
		String sqlSearchForClass = "SELECT * FROM level";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForClass);
		while(results.next()){
			SwimClass swim = new SwimClass();
			swim.setLevelName(results.getString("level_name"));
			swim.setAgeGroup(results.getString("age_group"));
			swim.setLevelId(results.getInt("level_id"));
			
			allClasses.add(swim);
		}
		
		return allClasses;
	}
	public List<Skill> getSkills(int classId) {
		List<Skill> classSkills = new ArrayList<Skill>();
		String sqlSearchForSkills = "SELECT s.skill_name,s.skill_description FROM skill s RIGHT JOIN skill_level sl ON s.skill_id=sl.skill_id " +
				"Right JOIN level l ON l.level_id=sl.level_id JOIN class c ON c.level_id=l.level_id WHERE class_id=?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForSkills, classId);
		while(results.next()){
			Skill mySkill = new Skill();
			mySkill.setSkillName(results.getString("skill_name"));
			mySkill.setSkillDescription(results.getString("skill_description"));
			classSkills.add(mySkill);
		}
		return classSkills;

	}

	@Override
	public List<StudentSkill> getStudentSkills(int studentId) {
		List<StudentSkill> studentSkills = new ArrayList<>();
		String sqlStudentSkills = "SELECT ss.introduced, ss.accomplished FROM skill_student ss JOIN class_student cs ON ss.student_id=cs.student_id "
					+" JOIN class c ON c.class_id=cs.class_id WHERE c.class_id=?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlStudentSkills, studentId);
		while(results.next()){
			StudentSkill newSkill = new StudentSkill();
			newSkill.setIntroduced(results.getBoolean("introduced"));
			newSkill.setAccomplished(results.getBoolean("accomplished"));
			studentSkills.add(newSkill);
		}
		
		return studentSkills;
	}
	
}

