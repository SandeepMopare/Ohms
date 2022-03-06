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

@Entity
@Table(name = "hospital")
public class HospitalEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int hspId;

	@Column(nullable = false)
	private String hspName;

	@Column(nullable = false)
	private String hspAdd;

	@Column(nullable = false)
	private int hspBNo;

	@Column(nullable = false, unique = true)
	private String hspUsername;

	@Column(nullable = false, unique = true)
	private String hspPassword;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "hspId")
	private List<DoctorEntity> doctorList;

	public List<DoctorEntity> getDoctorList() {
		return doctorList;
	}

	public void setDoctorList(List<DoctorEntity> doctorList) {
		this.doctorList = doctorList;
	}

	public HospitalEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HospitalEntity(String hspName, String hspAdd, int hspBNo, String hspUsername, String hspPassword) {
		super();
		this.hspName = hspName;
		this.hspAdd = hspAdd;
		this.hspBNo = hspBNo;
		this.hspUsername = hspUsername;
		this.hspPassword = hspPassword;
	}

	public int getHspId() {
		return hspId;
	}

	public void setHspId(int hspId) {
		this.hspId = hspId;
	}

	public String getHspName() {
		return hspName;
	}

	public void setHspName(String hspName) {
		this.hspName = hspName;
	}

	public String getHspAdd() {
		return hspAdd;
	}

	public void setHspAdd(String hspAdd) {
		this.hspAdd = hspAdd;
	}

	public int getHspBNo() {
		return hspBNo;
	}

	public void setHspBNo(int hspBNo) {
		this.hspBNo = hspBNo;
	}

	public String getHspUsername() {
		return hspUsername;
	}

	public void setHspUsername(String hspUsername) {
		this.hspUsername = hspUsername;
	}

	public String getHspPassword() {
		return hspPassword;
	}

	public void setHspPassword(String hspPassword) {
		this.hspPassword = hspPassword;
	}

}
