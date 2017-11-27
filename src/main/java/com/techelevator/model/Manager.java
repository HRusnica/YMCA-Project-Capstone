package com.techelevator.model;

public class Manager extends AppUser {
	
	public int managerId;
	
	public void setRole(String role){
		super.setRole("manager");
	}

	public int getManagerId() {
		return managerId;
	}
	
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	
}
