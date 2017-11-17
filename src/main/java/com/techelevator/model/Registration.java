package com.techelevator.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class Registration {

		@NotBlank(message="First Name is required") @Length(max=20)   
		private String firstName;
		
		@NotBlank(message="Last Name is required") @Length(max=20) 
		private String lastName; 
		
		@NotBlank(message="Invalid Email") @Email
		private String email;
	
		//add requirements for special characters or capitals
		@NotBlank(message="Password is Required") //@Length(min=12, message="Password must be at least 12 characters long") 
		private String password;
		

		private String confirmPassword;


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


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}

		
		public String getPassword() {
			return password;
		}


		public void setPassword(String password) {
			this.password = password;
		}


		public String getConfirmPassword() {
			return confirmPassword;
		}


		public void setConfirmPassword(String confirmPassword) {
			this.confirmPassword = confirmPassword;
		}
	
		
		
}
