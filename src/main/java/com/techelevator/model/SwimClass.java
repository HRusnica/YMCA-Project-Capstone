package com.techelevator.model;

import java.util.List;

public class SwimClass {

	private String levelName;
	private String ageGroup;
	private int levelId;
	private int instructorId;
	private int classId; 
	private List<Student> students;
	private List<StudentSkill> studentSkills;
	
	
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	public String getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}
	public int getLevelId() {
		return levelId;
	}
	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}
	public List<StudentSkill> getStudentSkills() {
		return studentSkills;
	}
	public void setStudentSkills(List<StudentSkill> studentSkills) {
		this.studentSkills = studentSkills;
	}
	public int getInstructorId() {
		return instructorId;
	}
	public void setInstructorId(int instructorId) {
		this.instructorId = instructorId;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	
	
}
