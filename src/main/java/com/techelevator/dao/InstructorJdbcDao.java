package com.techelevator.dao;

<<<<<<< HEAD
import java.time.LocalDate;
import java.util.ArrayList;
=======
>>>>>>> bb66262f168e9981fe7c959aa0919478cf843eeb
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

<<<<<<< HEAD
import com.techelevator.model.ScheduledClass;
=======
import com.techelevator.model.Instructor;
>>>>>>> bb66262f168e9981fe7c959aa0919478cf843eeb

@Component
public class InstructorJdbcDao implements InstructorDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
<<<<<<< HEAD

	@Override
	public List<ScheduledClass> GetAllScheduledClassesByInstructor(int instructorId) {
		List<ScheduledClass> scheduledClassList = new ArrayList<ScheduledClass>();
		
		String sqlSearchForScheduledClass = "SELECT 'l.level_name', 'l.age_group', 'ct.hour', 'ct.day_of_week', 'ct.start_date', 'ct.end_date' "
				+ "FROM class c JOIN class_time ct ON c.time_id = ct.time_id JOIN level l ON c.level_id = l.level_id "
				+ "WHERE instructor_id = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForScheduledClass, instructorId);
		while(results.next()){
			ScheduledClass myClass = new ScheduledClass();
			myClass.setAgeGroup(results.getString("level_name"));
			myClass.setDayOfWeek(results.getString("day_of_week"));
			myClass.setEndDate(results.getDate("end_date"));
			myClass.setInstructorId(instructorId);
			myClass.setLevelId(results.getInt("level_id"));
			myClass.setStartDate(results.getDate("start_date"));
			myClass.setHour(results.getHour("hour"));
			
			scheduledClassList.add(myClass);
		}
		return scheduledClassList;
	}
	

=======
>>>>>>> bb66262f168e9981fe7c959aa0919478cf843eeb
}
