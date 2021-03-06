package com.techelevator.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.ScheduledClass;
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

	@Override
	public SwimClass getClassByClassId(int classId) {
		SwimClass swimClass = new SwimClass();
	
		String sql = "SELECT c.class_id, c.instructor_id, l.age_group, l.level_name, skill.skill_id, skill.skill_name, skill.skill_description, s.student_id, s.first_name, s.last_name, l.level_id FROM class c "
						+"LEFT JOIN class_student cs ON c.class_id=cs.class_id "
						+"LEFT JOIN student s ON cs.student_id=s.student_id "
						+"LEFT JOIN skill_student ss ON s.student_id=ss.student_id "
						+"LEFT JOIN skill ON skill.skill_id=ss.skill_id "
						+"LEFT JOIN skill_level sl ON skill.skill_id=sl.skill_id "
						+"LEFT JOIN level l ON l.level_id=sl.level_id WHERE c.class_id = ?";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, classId);
		if(results.next()){
			
			System.out.println("1: " + results.getString("level_name"));
			
			swimClass.setLevelId(results.getInt("level_id"));
			swimClass.setLevelName(results.getString("level_name"));
			
			System.out.println("2: " + swimClass.getLevelId());
		}
		return swimClass;
	}
	
	public List<Skill> getSkillsByClassId(int classId) {
		System.out.println(classId);
		List<Skill> classSkills = new ArrayList<Skill>();
		String sqlSearchForSkills = "SELECT s.skill_id, s.skill_name,s.skill_description, sk.introduced FROM skill s JOIN skill_level sl ON s.skill_id=sl.skill_id " +
				" JOIN level l ON l.level_id=sl.level_id JOIN class c ON c.level_id=l.level_id JOIN skill_student sk ON sk.skill_id=s.skill_id WHERE class_id=? GROUP BY class_id, skill_name, s.skill_description, sk.introduced, s.skill_id";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForSkills, classId);
		while(results.next()){
			Skill mySkill = new Skill();
			mySkill.setSkillName(results.getString("skill_name"));
			mySkill.setSkillDescription(results.getString("skill_description"));
			mySkill.setIntroduced(results.getBoolean("introduced"));
			mySkill.setSkillId(results.getInt("skill_id"));
			System.out.println(mySkill.getSkillName());
			classSkills.add(mySkill);
		}
		return classSkills;

	}
}

