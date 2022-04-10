package com.app.core.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "prescription")
public class PrescriptionEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "prec_id")
	private int precId;

	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
	private LocalDate dateTime;

	@Column(name = "blood_pressure")
	private int bloodPressure;

	@Column(name = "pulse_rate")
	private int pulseRate;

	@Column(name = "weight")
	private int weight;
	/*
	 * @OneToOne( mappedBy = "prescription") private AppointmentEntity appointment;
	 */
	@Column(length = 200, name = "diagnosed_with")
	private String diagnosedWith;

	@Column(length = 50)
	private String allergies;

	@Column(length = 50)
	private String disabilities;

	@Column(length = 100)
	private String drug1;

	@Column(length = 50)
	private String unit1;

	@Column(length = 50)
	private String dose1;

	@Column(length = 100)
	private String drug2;

	@Column(length = 50)
	private String unit2;

	@Column(length = 50)
	private String dose2;

	@Column(length = 50)
	private String test1;

	@Column(length = 50)
	private String test2;

	@Column(nullable = false)
	private int ptId;

	@Column(nullable = false)
	private int drId;

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

	public int getPrecId() {
		return precId;
	}

	public void setPrecId(int precId) {
		this.precId = precId;
	}

	public LocalDate getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDate dateTime) {
		this.dateTime = dateTime;
	}

	public int getBloodPressure() {
		return bloodPressure;
	}

	public void setBloodPressure(int bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	public int getPulseRate() {
		return pulseRate;
	}

	public void setPulseRate(int pulseRate) {
		this.pulseRate = pulseRate;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getDiagnosedWith() {
		return diagnosedWith;
	}

	public void setDiagnosedWith(String diagnosedWith) {
		this.diagnosedWith = diagnosedWith;
	}

	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public String getDisabilities() {
		return disabilities;
	}

	public void setDisabilities(String disabilities) {
		this.disabilities = disabilities;
	}

	public String getDrug1() {
		return drug1;
	}

	public void setDrug1(String drug1) {
		this.drug1 = drug1;
	}

	public String getUnit1() {
		return unit1;
	}

	public void setUnit1(String unit1) {
		this.unit1 = unit1;
	}

	public String getDose1() {
		return dose1;
	}

	public void setDose1(String dose1) {
		this.dose1 = dose1;
	}

	public String getDrug2() {
		return drug2;
	}

	public void setDrug2(String drug2) {
		this.drug2 = drug2;
	}

	public String getUnit2() {
		return unit2;
	}

	public void setUnit2(String unit2) {
		this.unit2 = unit2;
	}

	public String getDose2() {
		return dose2;
	}

	public void setDose2(String dose2) {
		this.dose2 = dose2;
	}

	public String getTest1() {
		return test1;
	}

	public void setTest1(String test1) {
		this.test1 = test1;
	}

	public String getTest2() {
		return test2;
	}

	public void setTest2(String test2) {
		this.test2 = test2;
	}

	public PrescriptionEntity() {
		super();
	}

	public PrescriptionEntity(LocalDate dateTime, int bloodPressure, int pulseRate, int weight, String diagnosedWith,
			String allergies, String disabilities, String drug1, String unit1, String dose1, String drug2, String unit2,
			String dose2, String test1, String test2, int drId, int ptId) {
		super();

		this.dateTime = dateTime;
		this.bloodPressure = bloodPressure;
		this.pulseRate = pulseRate;
		this.weight = weight;
		this.diagnosedWith = diagnosedWith;
		this.allergies = allergies;
		this.disabilities = disabilities;
		this.drug1 = drug1;
		this.unit1 = unit1;
		this.dose1 = dose1;
		this.drug2 = drug2;
		this.unit2 = unit2;
		this.dose2 = dose2;
		this.test1 = test1;
		this.test2 = test2;
		this.drId = drId;
		this.ptId=ptId;
	}

	@Override
	public String toString() {
		return "PrescriptionEntity [precId=" + precId + ", dateTime=" + dateTime + ", bloodPressure=" + bloodPressure
				+ ", pulseRate=" + pulseRate + ", weight=" + weight + ", diagnosedWith=" + diagnosedWith
				+ ", allergies=" + allergies + ", disabilities=" + disabilities + ", drug1=" + drug1 + ", unit1="
				+ unit1 + ", dose1=" + dose1 + ", drug2=" + drug2 + ", unit2=" + unit2 + ", dose2=" + dose2 + ", test1="
				+ test1 + ", test2=" + test2 + "]";
	}

}
