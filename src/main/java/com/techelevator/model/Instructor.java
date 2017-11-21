package com.techelevator.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

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
//	@NotBlank (message="E-mail address is required") @Email (message="properly format")
//	private String email;
//
//	public String getEmail() {
//		return email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//	 public String emailToUpperCase() {
//		return email.toUpperCase();
//	}



