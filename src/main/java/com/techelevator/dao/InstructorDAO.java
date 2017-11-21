package com.techelevator.dao;
import java.util.List;

import com.techelevator.model.Instructor;
import com.techelevator.model.ScheduledClass;

public interface InstructorDAO {
	Instructor InstructorByEmail(String email);
	List<ScheduledClass> GetAllScheduledClassesByInstructor(int instructorId);
}

