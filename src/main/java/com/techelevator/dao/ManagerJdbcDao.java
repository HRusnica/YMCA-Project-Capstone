package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Instructor;
import com.techelevator.model.Manager;
import com.techelevator.model.ScheduledClass;


	@Component
	public class ManagerJdbcDao implements ManagerDAO {
		
		private JdbcTemplate jdbcTemplate;
		
		@Autowired
		public ManagerJdbcDao(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
		
		public Manager ManagerByEmail(String email){
			Manager thisManager = new Manager();
			String sqlSearchForId = "SELECT manager_id FROM manager WHERE email = ?";
			SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSearchForId, email.toUpperCase());
			if (result.next()) {
			thisManager.setManagerId((int)result.getLong("manager_id"));
			} else {
				System.out.println("email not found: " + email);
			}
			return thisManager;
		}
		
		public String getInstructorFullNameByID(int instructorId){
			String fullName = "";
			Instructor thisInstructor = new Instructor();
			String sqlSearchForFullName = "SELECT a.first_name, a.last_name FROM instructor i LEFT JOIN app_user a ON i.email = a.email WHERE i.instructor_id = ?";
			SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSearchForFullName, instructorId);
			while(result.next()){
				fullName = thisInstructor.getFullName(result.getString("first_name"), result.getString("last_name"));
			}
			return fullName;
		}
		
		public String saveInstructorEmail(String email){
			if(!checkForEmail(email)){
			jdbcTemplate.update("INSERT INTO whitelist(email, role) VALUES (?, 'instructor')", email);
			String result = "The instructor E-mail was added.";
			return result;
			} else {
				String result = "This e-mail is already in the system.";
				return result;
			}
		}
		
		public boolean checkForEmail (String email) {
			String sqlSearchForUser = "SELECT * FROM whitelist WHERE UPPER(email) = ? ";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toUpperCase());
			return (results.next());
		}

		@Override
		public List<Instructor> getAllInstructors() {
			List<Instructor> instructors = new ArrayList<>();
			String sqlSearchForInstructors = "SELECT i.instructor_id, au.first_name, au.last_name FROM instructor i JOIN app_user au ON i.email=au.email";
			SqlRowSet results =jdbcTemplate.queryForRowSet(sqlSearchForInstructors);
			while (results.next()){
				Instructor teach = new Instructor();
				teach.setFirstName(results.getString("first_name"));
				teach.setLastName(results.getString("last_name"));
				teach.setInstructorId(results.getInt("instructor_id"));
				
				instructors.add(teach);
			}
			return instructors;
		}
		
		@Override
		public List<ScheduledClass> GetAllScheduledClassesByManager(int managerId) {
			
			List<ScheduledClass> scheduledClassList = new ArrayList<ScheduledClass>();
			
			String sqlSearchForScheduledClass = "SELECT i.instructor_id, l.level_name, l.level_id, l.age_group, ct.hour, ct.day_of_week, ct.start_date,"
					+ " ct.end_date FROM instructor i JOIN class c ON c.instructor_id = i.instructor_id JOIN class_time ct ON"
					+ " c.class_time_id = ct.class_time_id JOIN level l ON c.level_id = l.level_id "
					+ "WHERE manager_id = ? AND NOW() BETWEEN start_date AND end_date";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForScheduledClass, managerId);
			while(results.next()){
				ScheduledClass myClass = new ScheduledClass();
				myClass.setAgeGroup(results.getString("age_group"));
				myClass.setDayOfWeek(results.getString("day_of_week"));
				myClass.setEndDate((results.getDate("end_date")).toLocalDate());
				myClass.setLevelId(results.getInt("level_id"));
				myClass.setLevelName(results.getString("level_name"));
				myClass.setStartDate((results.getDate("start_date")).toLocalDate());
				myClass.setHour(results.getString("hour"));
				myClass.setInstructorFullName(getInstructorFullNameByID(results.getInt("instructor_id")));
				
				scheduledClassList.add(myClass);
			}
			return scheduledClassList;
		}
		
}
