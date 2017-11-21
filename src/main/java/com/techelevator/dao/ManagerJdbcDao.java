package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Instructor;
import com.techelevator.model.SwimClass;

	@Component
	public class ManagerJdbcDao implements ManagerDAO {
		
		private JdbcTemplate jdbcTemplate;
		
		@Autowired
		public ManagerJdbcDao(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
		
		public String saveInstructorEmail(String email){
			if(!checkForEmail(email)){
			jdbcTemplate.update("INSERT INTO whitelist(email, role) VALUES (?, 'instructor')", email);
			String result = "The instructor E-mail was added.";
			return result;
			} else {
				String result = "This e-mail is already in the system.";
				return result;
			}
		}
		
		public boolean checkForEmail (String email) {
			String sqlSearchForUser = "SELECT * FROM whitelist WHERE UPPER(email) = ? ";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
			return (results.next());
		}

		@Override
		public List<Instructor> getAllInstructors() {
			List<Instructor> instructors = new ArrayList<>();
			String sqlSearchForInstructors = "SELECT * FROM instructor i JOIN app_user au ON i.email=au.email";
			SqlRowSet results =jdbcTemplate.queryForRowSet(sqlSearchForInstructors);
			while (results.next()){
				Instructor teach = new Instructor();
				teach.setFirstName(results.getString("first_name"));
				teach.setLastName(results.getString("last_name"));
				teach.setInstructorId(results.getInt("instructor_id"));
				
				instructors.add(teach);
			}
			return instructors;
		}
		
}
