package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.SwimClass;



@Component
public class SwimClassJdbcDao implements SwimClassDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public SwimClassJdbcDao(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<SwimClass> getAllClasses() {
		List<SwimClass> allClasses= new ArrayList<>();
		String sqlSearchForClass = "SELECT * FROM level";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForClass);
		while(results.next()){
			SwimClass swim = new SwimClass();
			swim.setLevelName(results.getString("level_name"));
			swim.setAgeGroup(results.getString("age_group"));
			
			allClasses.add(swim);
		}
		
		return allClasses;
	}

}
