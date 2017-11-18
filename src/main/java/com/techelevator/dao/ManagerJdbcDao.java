package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Instructor;

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
		
		
		
		

}
