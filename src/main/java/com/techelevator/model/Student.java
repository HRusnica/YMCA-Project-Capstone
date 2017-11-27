package com.techelevator.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Student extends AppUser {
	
	private String birthday;
	
<<<<<<< HEAD
	
=======
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

>>>>>>> 8d9e47c566957a7dd44bfa59fe52bf5eeda60809
	public String getBirthday() {
		return birthday;
	}

	private String gender;
	private String firstName;
	private String lastName;
	private int classId;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getBirthDate(String birthDate) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate dt = LocalDate.parse(birthDate, formatter);;
		return dt;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

}
