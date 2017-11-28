package com.techelevator.dao;

import java.time.LocalDate;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.model.ScheduledClass;

@Component
public class ScheduledClassJdbcDao implements ScheduledClassDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveScheduledClass(ScheduledClass scheduledClass){
		String sqlInsertClassTime= "INSERT INTO class_time (hour, day_of_week, start_date, end_date) "
				+ "VALUES (?,?,?,?) RETURNING class_time_id";
		 Long newTimeId = (Long) jdbcTemplate.queryForObject(sqlInsertClassTime, Long.class, scheduledClass.getHour(), scheduledClass.getDayOfWeek(), scheduledClass.getClassStartDate(scheduledClass.getStartDate()), scheduledClass.getClassEndDate(scheduledClass.getEndDate()));
		 String sqlInsertScheduledClass = "INSERT INTO class (level_id,instructor_id,class_time_id) VALUES (?,?,?)";
		 jdbcTemplate.update(sqlInsertScheduledClass, scheduledClass.getLevelId(), scheduledClass.getInstructorId(), newTimeId);
	}

	@Override
	public void saveStudentToClass(int studentId, int classId) {
		// TODO Auto-generated method stub
		
	}
	
	

}
