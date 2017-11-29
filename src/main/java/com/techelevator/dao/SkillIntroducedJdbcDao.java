package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Skill;

@Component
public class SkillIntroducedJdbcDao implements SkillIntroducedDAO {
	
	private JdbcTemplate jdbcTemplate; 
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveSkillIntroduced(int skillId, boolean introduced, int classId) {
		String sqlAddIntroducedSkill = "UPDATE skill_student  SET introduced=? FROM student s RIGHT JOIN class_student cs ON s.student_id=cs.student_id "
			+"	RIGHT JOIN class c ON c.class_id=cs.class_id WHERE skill_id=? AND c.class_id = ?";
		jdbcTemplate.update(sqlAddIntroducedSkill, introduced, skillId, classId);
	}

}
