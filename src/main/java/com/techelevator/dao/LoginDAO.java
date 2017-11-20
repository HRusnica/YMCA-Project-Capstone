package com.techelevator.dao;

import javax.sql.DataSource;

import com.techelevator.model.AppUser;
import com.techelevator.security.PasswordHasher;

public interface LoginDAO {

	public void JDBCUserDAO(DataSource dataSource, PasswordHasher passwordHasher);
	public void updatePassword(String userName, String password);
	public boolean searchForEmailAndPassword(String email, String password);
	public String getRole(String email); 
	public AppUser getUser(String email);
}
