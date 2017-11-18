package com.techelevator.dao;

import com.techelevator.model.Instructor;

public interface ManagerDAO {
	public String saveInstructorEmail(String email);
	public boolean checkForEmail (String email);

}
