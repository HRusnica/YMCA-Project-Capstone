package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.ScheduledClass;

public interface InstructorDAO {
	
	List<ScheduledClass> GetAllScheduledClassesByInstructor(int instructorId);
}
