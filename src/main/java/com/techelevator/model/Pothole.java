package com.techelevator.model;

import java.util.Date;

public class Pothole {

	private String		markerId;
	private String		lat;
	private String		lng;
	private String		img;
	private String		streetAdd;
	private int			size;
	private int			depth;
	private Date		reportDate;
	private int			reportingCount;
	private int			priority; 
	
	private int			severity= 0;
	private boolean		isRepairing;
	private Date		dateSentRepair;
	private boolean		admin_aware;
	
	private static final int 	GREEN_IS_UNDER_YELLOW_IS_OVER 	= 200;
	private static final int	YELLOW_IS_UNDER_RED_IS_OVER		= 700;
	
	/* I am unsure about when to run setSeverity(), currently run with setDepth*/
	
	
	
	public int getReportingCount() {
		return reportingCount;
	}
	public void setReportingCount(int reportingCount) {
		this.reportingCount = reportingCount;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
		this.setSeverity(depth, size);		//the setSeverity is called here
	}

	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getMarkerId() {
		return markerId;
	}
	public void setMarkerId(String markerId) {
		this.markerId = markerId;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStreetAdd() {
		return streetAdd;
	}
	public void setStreetAdd(String streetAdd) {
		this.streetAdd = streetAdd;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public boolean isRepairing() {
		return isRepairing;
	}
	public void setRepairing(boolean isRepairing) {
		this.isRepairing = isRepairing;
	}
	public Date getDateSentRepair() {
		return dateSentRepair;
	}
	public void setDateSentRepair(Date dateSentRepair) {
		this.dateSentRepair = dateSentRepair;
	}
	public boolean isAdmin_aware() {
		return admin_aware;
	}
	public void setAdmin_aware(boolean admin_aware) {
		this.admin_aware = admin_aware;
	}
	
	
	public int getSeverity() {
		return severity;
	}
	
	public void setSeverity(int depth, int size) {
		int area = depth * size;
		if (area <= GREEN_IS_UNDER_YELLOW_IS_OVER) {
			severity = 1;
		} 
		else if (area >= GREEN_IS_UNDER_YELLOW_IS_OVER && area < YELLOW_IS_UNDER_RED_IS_OVER ){
			severity = 2;
		}
		else if (area >= YELLOW_IS_UNDER_RED_IS_OVER) {
			severity = 3;
		}
		
	}
	
}
