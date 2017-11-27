package com.techelevator.model;

public class Instructor extends AppUser {
	
	private int instructorId;

	public void setRole(String role){
		super.setRole("instructor");
	}

	public int getInstructorId() {
		return instructorId;
	}

	public void setInstructorId(int instructorId) {
		this.instructorId = instructorId;
	}
}

