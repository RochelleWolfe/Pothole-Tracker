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
		String orderBy = "marker_id";
		List<Pothole> allPotholes =sortAllPotholes(orderBy);
		return allPotholes;
	}
	
	public List<Pothole> sortAllPotholes(String orderBy) {
		List<Pothole> allPotholes = new ArrayList<>();
		String sqlSelectAllPotholes = "SELECT * FROM pothole ORDER BY "+ orderBy + ";";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllPotholes);
		while(results.next()) {
			Pothole pothole = new Pothole();
			populatePothole(results, pothole);
			//setDepth runs the setSeverity method
			// Report Date is being generated as it enters the SQL in the save()
			allPotholes.add(pothole);
		}
		
		return allPotholes;
	}

	/**
	 * @param results
	 * @param pothole
	 */
	//Pothole from database
	private void populatePothole(SqlRowSet results, Pothole pothole) {
		pothole.setMarkerId		(results.getString	("marker_id"	));
		pothole.setLat			(results.getString	("lat"			));
		pothole.setLng			(results.getString	("long"			));
		//pothole.setImg			(results.getString	("img"			));
		pothole.setStreetAdd 	(results.getString	("street_add"	));
		pothole.setSize			(results.getInt		("size"			));
		pothole.setDepth		(results.getInt     ("depth"        ));
		pothole.setReportingCount(results.getInt    ("report_count" ));
		pothole.setReportDate	(results.getDate	("report_date" 	));
		pothole.setAdmin_aware	(results.getBoolean	("admin_aware"	));
		pothole.setRepairing	(results.getBoolean	("is_repairing"	));
		pothole.setDateSentRepair(results.getDate	("sent_for_repair"));
		pothole.setUser			(results.getString	("user_reported"));
	}
	
	 //Saves information from pothole form into the database
	public void save(Pothole pothole) {
		String sqlInsertPothole = "INSERT INTO pothole(lat, 	long, 				 	street_add, 			size, 				depth, 			report_date, 		severity,				priority, 		report_count,		 is_repairing,			admin_aware,     user_reported) VALUES (?,?,?,?,?, NOW(),?,?,1,false,false,?)";
		jdbcTemplate.update(sqlInsertPothole,pothole.getLat(), pothole.getLng(), pothole.getStreetAdd(), pothole.getSize(), pothole.getDepth(),  				  pothole.getSeverity(), pothole.getPriority(), pothole.getUser()														);
	}

	
	public void updateReportCount(Pothole pothole) {
		int updatedCount= pothole.getReportingCount() +1;
		String sqlUpdateReportCount = "UPDATE pothole" + 
									" SET report_count = " + updatedCount +
									" WHERE marker_id = " + pothole.getMarkerId() +" ;" ;
		jdbcTemplate.update(sqlUpdateReportCount);
				
	
	}
	
	public void updatePotholeList(Pothole pothole) {
		String sqlUpdateReportCount = "UPDATE pothole" + 
									" SET is_repairing  = " + pothole.isRepairing() + ","
									+ " sent_for_repair = NOW(),"
									+ " admin_aware = " + pothole.isAdmin_aware() 
									+ " WHERE marker_id = " + pothole.getMarkerId() +" ;" ;
		jdbcTemplate.update(sqlUpdateReportCount);
				
	
	}
	
	public Pothole getPotholeById(String id) {
		Pothole pothole = new Pothole();
		String sqlFindPotById = "SELECT * FROM pothole WHERE marker_id = " + id;
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlFindPotById);
		while(results.next()) {
			populatePothole(results, pothole);
		}
		return pothole;
					
	}
	
	public void deletePothole(String markerId) {
		String sqlDeletePothole = "Delete * FROM pothole WHERE marker_id = " + markerId;
		 jdbcTemplate.update(sqlDeletePothole);
	}
	
	
}
