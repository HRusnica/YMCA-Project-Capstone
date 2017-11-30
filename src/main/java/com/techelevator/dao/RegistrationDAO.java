package com.techelevator.dao;

import com.techelevator.model.Registration;

public interface RegistrationDAO {

	//public void saveUser(String email, String password);

	public void saveUser(Registration registration);
	public boolean checkForEmail(String email);
	
}
