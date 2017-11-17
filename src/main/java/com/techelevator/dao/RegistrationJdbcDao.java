package com.techelevator.dao;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.security.PasswordHasher;

	@Component
	public class RegistrationJdbcDao implements RegistrationDAO{
		
		private JdbcTemplate jdbcTemplate;
		private PasswordHasher passwordHasher;

		@Override
		public void saveUser(String email, String password) {
			if (true) {
			byte[] salt = passwordHasher.generateRandomSalt();
			String hashedPassword = passwordHasher.computeHash(password, salt);
			String saltString = new String(Base64.encode(salt));
			jdbcTemplate.update("INSERT INTO app_user(email, password, salt) VALUES (?,?,?)",
					email, hashedPassword, saltString);
			}
		}
		public boolean checkForEmail(String email){
			String sqlSearchForUser = "SELECT * FROM whitelist WHERE UPPER(email) = ? ";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
			return (results.next());
		}
	
	}
