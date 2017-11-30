package com.techelevator.dao;


import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Student;

@Component
public class StudentJdbcDao implements StudentDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveStudent(Student student) {
		jdbcTemplate.update("INSERT INTO student (first_name, last_name, birthday, gender) VALUES (?,?,?,?)",
		student.getFirstName(), student.getLastName(), student.getBirthDate(student.getBirthday()), student.getGender());
	}
	
	@Override
	public List<Student> getAllStudents(){
		List<Student> studentList = new ArrayList<Student>();		
		String sqlSearchForStudents = "SELECT first_name, last_name, student_id FROM student";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForStudents);
		while(results.next()){
			Student student = new Student();
			student.setFirstName(results.getString("first_name"));
			student.setLastName(results.getString("last_name"));
			student.setStudentId(results.getInt("student_id"));
			studentList.add(student);
		}
		return 	studentList;	
	}
	
	@Override
	public void saveStudentToClass(int studentId, int classId){
		String sqlInsertStudent = "INSERT INTO class_student (student_id, class_id) VALUES (?,?)";
		jdbcTemplate.update(sqlInsertStudent, studentId, classId);
		List<Integer> skillIdList = getAllSkillIdForClass(classId);
		for(Integer skillId : skillIdList){
			String sqlInsertSkilledStudent = "INSERT INTO skill_student (student_id, skill_id) VALUES (?, ?)";
			jdbcTemplate.update(sqlInsertSkilledStudent, studentId, skillId);
		}
	}
	
	public List<Integer> getAllSkillIdForClass(int classId){
		List<Integer> skillIdList = new ArrayList<Integer>();
		String sqlSearchForSkill = "SELECT skill_id FROM skill_level sk JOIN class c ON sk.level_id = c.level_id WHERE c.class_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForSkill, classId);
		if(results.next()){
			Integer skillId = null;
			skillId = results.getInt("skill_id");
			skillIdList.add(skillId);
		}
		return skillIdList;
	}
	
	@Override
	public List<Student> getAllStudentsByClass(int classId){
		List<Student> studentClassList = new ArrayList<Student>();		
		String sqlSearchForStudentsByClass = "SELECT s.first_name, s.last_name, s.student_id FROM student s JOIN class_student cs "
				+" ON s.student_id=cs.student_id JOIN class c ON c.class_id =cs.class_id WHERE cs.class_id= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForStudentsByClass, classId);
		while(results.next()){
			Student student = new Student();
			student.setStudentId(results.getInt("student_id"));
			student.setFirstName(results.getString("first_name"));
			student.setLastName(results.getString("last_name"));
			studentClassList.add(student);
		}
		return 	studentClassList;	
	}
	@Override
	public List<Student> getAllStudentsByInstructor(int instructorId){
		List<Student> studentClassList = new ArrayList<Student>();		
		String sqlSearchForStudentsByClass = "SELECT  c.class_id,s.first_name, s.last_name FROM student s JOIN class_student cs "
				+" ON s.student_id=cs.student_id JOIN class c ON c.class_id =cs.class_id JOIN instructor i ON i.instructor_id=c.instructor_id WHERE i.instructor_id= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForStudentsByClass, instructorId);
		while(results.next()){
			Student student = new Student();
			student.setClassId(results.getInt("class_id"));
			student.setFirstName(results.getString("first_name"));
			student.setLastName(results.getString("last_name"));
			
			studentClassList.add(student);
		}
		return 	studentClassList;	
	}

}
