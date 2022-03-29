package com.app.core.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.app.core.entity.AppointmentEntity;

@Entity
@Table(name = "patient")
public class PatientEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ptId;

	@Column(nullable = false)
	private String ptName;

	@Column(nullable = false)
	private int ptAge;

	@Column(nullable = false, unique = true)
	private String ptGmail;

	@Column(nullable = false, unique = true)
	private String ptMobile;

	@Column(nullable = false, unique = true)
	private String ptUsername;

	@Column(nullable = false, unique = true)
	private String ptPassword;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "ptId")
	private List<AppointmentEntity> appointments;

	public List<AppointmentEntity> getAppointments() {
		return appointments;
	}

	public void setAppointments(List<AppointmentEntity> appointments) {
		this.appointments = appointments;
	}

	public PatientEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PatientEntity(String ptName, int ptAge, String ptGmail, String ptMobile, String ptUsername,
			String ptPassword) {
		super();
		this.ptName = ptName;
		this.ptAge = ptAge;
		this.ptGmail = ptGmail;
		this.ptMobile = ptMobile;
		this.ptUsername = ptUsername;
		this.ptPassword = ptPassword;
	}

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public String getPtName() {
		return ptName;
	}

	public void setPtName(String ptName) {
		this.ptName = ptName;
	}

	public int getPtAge() {
		return ptAge;
	}

	public void setPtAge(int ptAge) {
		this.ptAge = ptAge;
	}

	public String getPtGmail() {
		return ptGmail;
	}

	public void setPtGmail(String ptGmail) {
		this.ptGmail = ptGmail;
	}

	public String getPtMobile() {
		return ptMobile;
	}

	public void setPtMobile(String ptMobile) {
		this.ptMobile = ptMobile;
	}

	public String getPtUsername() {
		return ptUsername;
	}

	public void setPtUsername(String ptUsername) {
		this.ptUsername = ptUsername;
	}

	public String getPtPassword() {
		return ptPassword;
	}

	public void setPtPassword(String ptPassword) {
		this.ptPassword = ptPassword;
	}

}
