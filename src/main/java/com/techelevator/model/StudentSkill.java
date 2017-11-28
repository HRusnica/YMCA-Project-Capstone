package com.techelevator.model;

public class StudentSkill {
	
	public Skill thisSkill;
	public boolean introduced;
	public boolean accomplished;
	public String comments;
	public int studentId;

	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	public boolean isIntroduced() {
		return introduced;
	}
	public void setIntroduced(boolean introduced) {
		this.introduced = introduced;
	}
	public boolean isAccomplished() {
		return accomplished;
	}
	public void setAccomplished(boolean accomplished) {
		this.accomplished = accomplished;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Skill getThisSkill() {
		return thisSkill;
	}
	public void setThisSkill(Skill thisSkill) {
		this.thisSkill = thisSkill;
	}
	

}
