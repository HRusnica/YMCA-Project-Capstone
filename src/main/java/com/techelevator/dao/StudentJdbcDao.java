package com.techelevator.dao;

import java.time.LocalDate;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.model.Student;

@Component
public class StudentJdbcDao implements StudentDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveStudent(Student student) {
		jdbcTemplate.update("INSERT INTO student (first_name, last_name, birthday, gender) VALUES (?,?,?,?)",
		student.getFirstName(), student.getLastName(), LocalDate.now(), "Trans");
	}

}
