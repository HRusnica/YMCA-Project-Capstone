package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Student;

public interface StudentDAO {

	void saveStudent(Student student);
	public List<Student> getAllStudentsByClass(int classId);
	public List<Student> getAllStudentsByInstructor(int instructorId);
}
