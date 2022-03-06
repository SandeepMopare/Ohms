package com.app.core.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Contactus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ctId;
	private String ctName;
	private String ctEmail;
	private String ctMobile;
	private String ctSubject;
	private String ctMessage;
	private String ctDate;

	public Contactus() {
		super();
	}

	public Contactus(String ctName, String ctEmail, String ctMobile, String ctSubject, String ctMessage,
			String ctDate) {
		super();
		this.ctName = ctName;
		this.ctEmail = ctEmail;
		this.ctMobile = ctMobile;
		this.ctSubject = ctSubject;
		this.ctMessage = ctMessage;
		this.ctDate = ctDate;
	}

	public int getCtId() {
		return ctId;
	}

	public void setCtId(int ctId) {
		this.ctId = ctId;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public String getCtEmail() {
		return ctEmail;
	}

	public void setCtEmail(String ctEmail) {
		this.ctEmail = ctEmail;
	}

	public String getCtMobile() {
		return ctMobile;
	}

	public void setCtMobile(String ctMobile) {
		this.ctMobile = ctMobile;
	}

	public String getCtSubject() {
		return ctSubject;
	}

	public void setCtSubject(String ctSubject) {
		this.ctSubject = ctSubject;
	}

	public String getCtMessage() {
		return ctMessage;
	}

	public void setCtMessage(String ctMessage) {
		this.ctMessage = ctMessage;
	}

	public String getCtDate() {
		return ctDate;
	}

	public void setCtDate(String ctDate) {
		this.ctDate = ctDate;
	}

}