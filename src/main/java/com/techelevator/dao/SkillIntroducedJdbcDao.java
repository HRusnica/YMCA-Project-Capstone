package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class SkillIntroducedJdbcDao implements SkillIntroducedDAO {
	
	private JdbcTemplate jdbcTemplate; 
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveSkillIntroduced(int skillId, int studentId) {
		String sqlAddIntroducedSkill = "UPDATE skill_student  SET introduced=true FROM student s RIGHT JOIN class_student cs ON s.student_id=cs.student_id "
			+"	RIGHT JOIN class c ON c.class_id=cs.class_id WHERE s.student_id=? AND skill_id=?";
		jdbcTemplate.update(sqlAddIntroducedSkill, skillId, studentId);
	}

}
