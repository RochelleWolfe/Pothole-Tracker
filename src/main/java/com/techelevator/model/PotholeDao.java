package com.techelevator.model;

import java.util.List;

public interface PotholeDao {

	public List<Pothole> getAllPotholes();
	
	public void save(Pothole pothole);
	public void updateReportCount(Pothole pothole);
	public Pothole getPotholeById(String markerId);
	public void updatePotholeList(Pothole pothole);
	public void deletePothole(String markerId);
}
