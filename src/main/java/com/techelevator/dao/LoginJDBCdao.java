package com.techelevator.dao;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.security.PasswordHasher;

	@Component
	public class LoginJDBCdao implements LoginDAO{
		

			private JdbcTemplate jdbcTemplate;
			private PasswordHasher passwordHasher;

			@Autowired
			public void JDBCUserDAO(DataSource dataSource, PasswordHasher passwordHasher) {
				this.jdbcTemplate = new JdbcTemplate(dataSource);
				this.passwordHasher = passwordHasher;
			}
			
			@Override
			public void saveUser(String email, String password) {
				if (checkForEmail(email)) {
				byte[] salt = passwordHasher.generateRandomSalt();
				String hashedPassword = passwordHasher.computeHash(password, salt);
				String saltString = new String(Base64.encode(salt));
				jdbcTemplate.update("INSERT INTO app_user(email, password, salt) VALUES (?,?,?)",
						email, hashedPassword, saltString);
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
				String sqlSearchForUser = "SELECT * FROM app_user WHERE UPPER(email) = ? ";
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
				return (results.next());
			}

}
