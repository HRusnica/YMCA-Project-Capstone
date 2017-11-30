package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public class SkillAccomplishedJdbcDao implements SkillAccomplishedDAO{

	private JdbcTemplate jdbcTemplate; 
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveSkillAccomplished(int skillId, boolean accomplished, int studentId) {
		String sqlAddAccomplishedSkill = "UPDATE skill_student SET accomplish = ? WHERE skill_id =? AND student_id = ?";
		jdbcTemplate.update(sqlAddAccomplishedSkill, accomplished, skillId, studentId);
	}
	

}
