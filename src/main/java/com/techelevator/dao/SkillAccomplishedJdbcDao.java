package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;



public class SkillAccomplishedJdbcDao implements SkillAccomplishedDAO{

	private JdbcTemplate jdbcTemplate; 
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveSkillAccomplished(int skillId, int studentId) {
		String sqlAddAccomplishedSkill = "INSERT INTO skill_student (skill_id, student_id, accomplished) VALUES (?, ?, true)" ;
		
	}
}
