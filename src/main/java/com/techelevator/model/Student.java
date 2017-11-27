package com.techelevator.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Student extends AppUser {
	
	private String birthday;
<<<<<<< HEAD
	

=======
>>>>>>> 5ef7923031bfdb799f1f170b06a2189190bbc6f2
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

<<<<<<< HEAD

=======
>>>>>>> 5ef7923031bfdb799f1f170b06a2189190bbc6f2
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
