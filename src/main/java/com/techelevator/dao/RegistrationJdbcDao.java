package com.techelevator.dao;


import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Registration;
import com.techelevator.security.PasswordHasher;

@Component
public class RegistrationJdbcDao implements RegistrationDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher passwordHasher;

	@Autowired
	public RegistrationJdbcDao(DataSource dataSource, PasswordHasher passwordHasher){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.passwordHasher = passwordHasher;
	}
	
	@Override
	public void saveUser(String email, String password) {
		
		if (checkForEmail(email)) {
			byte[] salt = passwordHasher.generateRandomSalt();
			String hashedPassword = passwordHasher.computeHash(password, salt);
			String saltString = new String(Base64.encode(salt));
			jdbcTemplate.update("INSERT INTO app_user(email, password, salt) VALUES (?,?,?)", email, hashedPassword,
					saltString);
		}
	}

	@Override
	public void saveUser(Registration registration) {
		
		if (checkForEmail(registration.getEmail())) {
			byte[] salt = passwordHasher.generateRandomSalt();
			String hashedPassword = passwordHasher.computeHash(registration.getPassword(), salt);
			String saltString = new String(Base64.encode(salt));
			jdbcTemplate.update("INSERT INTO app_user(email, password, salt) VALUES (?,?,?)", registration.getEmail(), hashedPassword,
					saltString);
		}
	}
	
	public boolean checkForEmail(String email) {
		String sqlSearchForUser = "SELECT * FROM whitelist WHERE UPPER(email) = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
		return (results.next());
	}

}
