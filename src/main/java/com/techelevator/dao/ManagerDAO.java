package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Instructor;

public interface ManagerDAO {
	public String saveInstructorEmail(String email);
	public boolean checkForEmail (String email);
	public List<Instructor> getAllInstructors();

}
