package com.techelevator.model;

import java.time.LocalDate;

public class Student extends AppUser {
	
	private LocalDate birthday;
	private String gender;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getBirthDate() {
		return birthday;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthday = birthDate;
	}

}
