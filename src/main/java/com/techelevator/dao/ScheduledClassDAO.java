package com.techelevator.dao;

import com.techelevator.model.ScheduledClass;

public interface ScheduledClassDAO {
	
	public void saveScheduledClass(ScheduledClass scheduledClass);
	public void saveStudentToClass(int studentId, int classId);
}
