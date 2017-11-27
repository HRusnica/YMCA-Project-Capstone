package com.techelevator.dao;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Student;
import com.techelevator.model.Instructor;


@Component
public class InstructorJdbcDao implements InstructorDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public Instructor InstructorByEmail(String email){
		Instructor thisInstructor = new Instructor();
		
		
		String sqlSearchForId = "SELECT instructor_id FROM instructor WHERE email = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSearchForId, email.toUpperCase());
		if (result.next()) {
		thisInstructor.setInstructorId((int)result.getLong("instructor_id"));
		} else {
			System.out.println("email not found: " + email);
		}
		return thisInstructor;
	}

	@Override
	public List<ScheduledClass> GetAllScheduledClassesByInstructor(int instructorId) {
		
		List<ScheduledClass> scheduledClassList = new ArrayList<ScheduledClass>();
		
		String sqlSearchForScheduledClass = "SELECT l.level_name, l.level_id, l.age_group, ct.hour, ct.day_of_week, "
				+ "ct.start_date, ct.end_date, c.class_id FROM class c JOIN class_time ct ON c.class_time_id = "
				+ "ct.class_time_id JOIN level l ON c.level_id = l.level_id WHERE instructor_id = ? AND NOW() BETWEEN start_date AND end_date";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForScheduledClass, instructorId);
		while(results.next()){
			ScheduledClass myClass = new ScheduledClass();
			myClass.setAgeGroup(results.getString("age_group"));
			myClass.setDayOfWeek(results.getString("day_of_week"));
			myClass.setEndDate((results.getDate("end_date")).toLocalDate());
			myClass.setInstructorId(instructorId);
			myClass.setLevelId(results.getInt("level_id"));
			myClass.setLevelName(results.getString("level_name"));
			myClass.setStartDate((results.getDate("start_date")).toLocalDate());
			myClass.setHour(results.getString("hour"));
			myClass.setClassId(results.getInt("class_id"));
			
			scheduledClassList.add(myClass);
		}
		return scheduledClassList;
	}
	
	@Override
	public void saveInstructor(Instructor instructor) {
		jdbcTemplate.update("INSERT INTO whitelist (email, role) VALUES (?,?)", instructor.getEmail(), "instructor");
	}

}
