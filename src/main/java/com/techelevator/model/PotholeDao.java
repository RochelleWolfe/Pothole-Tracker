package com.techelevator.model;

import java.util.List;

public interface PotholeDao {

	public List<Pothole> getAllPotholes();
	
	public void save(Pothole pothole);
}
