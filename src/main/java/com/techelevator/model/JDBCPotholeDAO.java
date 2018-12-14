package com.techelevator.model;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCPotholeDAO implements PotholeDao {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCPotholeDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override //returns a list of pothole objects with their attributes populated from the table
	public List<Pothole> getAllPotholes() {
		List<Pothole> allPotholes = new ArrayList<>();
		String sqlSelectAllPotholes = "SELECT * FROM pothole";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllPotholes);
		while(results.next()) {
			Pothole pothole = new Pothole();
			pothole.setMarkerId	(results.getString	("marker_id"	));
			pothole.setLat		(results.getString	("lat"			));
			pothole.setLng		(results.getString	("long"			));
			pothole.setImg		(results.getString	("img"			));
			pothole.setStreetAdd (results.getString	("street_add"	));
			pothole.setSize		(results.getInt		("size"			));
			pothole.setDepth	(results.getInt     ("depth"         ));
			//setDepth runs the setSeverity method
			// Report Date is being generated as it enters the SQL in the save()
			//pothole.setReportDate(results.getDate	("report_date"   ));
			allPotholes.add(pothole);
		}
		
		return allPotholes;
	}
	
	 //Saves information from pothole form into the database
	public void save(Pothole pothole) {
		//String id = getNextId(); //Used to set a unique id
		String sqlInsertPothole = "INSERT INTO pothole(lat, 	long, 				img, 			street_add, 			size, 				depth, 			report_date, 	severity,					priority) VALUES (?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertPothole,pothole.getLat(), pothole.getLng(), pothole.getImg(), pothole.getStreetAdd(), pothole.getSize(), pothole.getDepth(), "NOW()",    pothole.getSeverity(), pothole.getPriority());
		//pothole.setMarkerId(id); //Used to set a unique id
	}
	

/* I don't think we need this method because the ID is set in SQL using serial*/	
//	private String getNextId() {
//		String sqlSelectNextId = "SELECT NEXTVAL('marker_id')";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
//		String id = null;
//		if(results.next()) {
//			id = results.getString(1);
//		} else {
//			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
//		}
//		return id;
//	}
	
	public void updateReportCount(Pothole pothole) {
		int updatedCount= pothole.getReportingCount() +1;
		String sqlUpdateReportCount = "UPDATE pothole" + 
									"SET report_count = " + updatedCount +
									" WHERE marker_id = " + pothole.getMarkerId() +" ;" ;
		jdbcTemplate.update(sqlUpdateReportCount);
				
	
	}
	
	
}
