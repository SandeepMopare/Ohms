package com.app.core.dao;

import com.app.core.enums.AptStatus;

public class Appointment {

	private int aptId;
	private AptStatus aptStatus;
	private String aptDate;
	private int ptId;
	private int drId;
	
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Appointment(AptStatus aptStatus, String aptDate, int ptId, int drId) {
		super();
		this.aptStatus = aptStatus;
		this.aptDate = aptDate;
		this.ptId = ptId;
		this.drId = drId;
	}

	public int getAptId() {
		return aptId;
	}

	public void setAptId(int aptId) {
		this.aptId = aptId;
	}

	public AptStatus getAptStatus() {
		return aptStatus;
	}

	public void setAptStatus(AptStatus aptStatus) {
		this.aptStatus = aptStatus;
	}

	public String getAptDate() {
		return aptDate;
	}

	public void setAptDate(String aptDate) {
		this.aptDate = aptDate;
	}

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public int getDrId() {
		return drId;
	}

	public void setDrId(int drId) {
		this.drId = drId;
	}

}
