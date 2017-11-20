package com.techelevator.dao;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.AppUser;
import com.techelevator.security.PasswordHasher;

	@Component
	public class LoginJdbcDao implements LoginDAO{
		

			private JdbcTemplate jdbcTemplate;
			private PasswordHasher passwordHasher;

			@Autowired
			public void JDBCUserDAO(DataSource dataSource, PasswordHasher passwordHasher) {
				this.jdbcTemplate = new JdbcTemplate(dataSource);
				this.passwordHasher = passwordHasher;
			}
			
			@Override
			public String getRole(String email){
				String sqlSearchForRole = "SELECT * FROM whitelist WHERE UPPER(email) = ? ";
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForRole, email.toUpperCase());
				if(results.next()){
					String role = results.getString("role");
					return role;	
				} else {
					return "";	
				}
			}
			
			@Override
			public boolean searchForEmailAndPassword(String email, String password) {
				String sqlSearchForUser = "SELECT * "+
									      "FROM app_user "+
									      "WHERE UPPER(email) = ? ";
									    
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
				if(results.next()) {
					String dbSalt = results.getString("salt");
					String dbHashedPassword = results.getString("password");
					String passwordCheck = passwordHasher.computeHash(password, Base64.decode(dbSalt));
					return passwordCheck.equals(dbHashedPassword);
				}
				return false;
			}

			@Override
			public void updatePassword(String email, String password) {
				byte[] salt = passwordHasher.generateRandomSalt();
				String hashedPassword = passwordHasher.computeHash(password, salt);
				String saltString = new String(Base64.encode(salt));
				jdbcTemplate.update("UPDATE app_user SET password = ?, salt = ? WHERE email = ?",
						hashedPassword, saltString, email);
			}
			
			public boolean checkForEmail(String email){
				String sqlSearchForUser = "SELECT * FROM whitelist WHERE UPPER(email) = ? ";
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
				return (results.next());
			}
			
			public AppUser getUser(String email){
				AppUser user = new AppUser();
				String sqlSearchForUser = "SELECT * FROM app_user WHERE UPPER(email) = ?";
				String sqlSearchForRole = "SELECT role FROM whitelist WHERE UPPER(email) = ?";
				
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
				SqlRowSet role = jdbcTemplate.queryForRowSet(sqlSearchForRole, email.toUpperCase());
				
				if(results.next()) {
					user.setEmail(results.getString("email"));
					user.setFirstName(results.getString("first_name"));
					user.setLastName(results.getString("last_name"));
				}
				
				if(role.next()) {
					user.setRole(role.getString("role"));
				}
				
				return user;
			}
	
}

	
