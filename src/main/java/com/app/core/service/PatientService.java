package com.app.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.core.entity.PatientEntity;
import com.app.core.repository.PatientRepository;

@Service
public class PatientService {

	@Autowired
	PatientRepository patientRepository;
	
	public PatientEntity getSinglePatient(String ptId) {   //12   string
		int patId=Integer.parseInt(ptId);                     //12  int
		PatientEntity PatientEntity=patientRepository.findByptId(patId);      //findById(12)
		return PatientEntity;
	}
	
	public List<PatientEntity> getAllPatient() {
		List<PatientEntity> patientEntities=patientRepository.findAll();		
		return patientEntities;
	}

	// @PostMapping("/registered")
	public void create(PatientEntity patientEntity) {
		patientRepository.save(patientEntity);
	}

	// @PostMapping("/AuthPtlogin")
	public PatientEntity Authenticatepatient(String ptUsername, String ptPassword) {
		PatientEntity PatientEntity = patientRepository.findByPtUsernameAndPtPassword(ptUsername, ptPassword);
		if (PatientEntity != null) {
			return PatientEntity;
		} else {
			return null;
		}
	}
	
	// @PostMapping("/AuthPtloginwithencrupt")
		public PatientEntity AuthentPatUname(String ptUsername) {
			PatientEntity PatientEntity = patientRepository.findByPtUsername(ptUsername);
			if (PatientEntity != null) {
				return PatientEntity;
			} else {
				return null;
			}
		}
		
		//@PostMapping("/forgotPass")
				public PatientEntity AuthentPatUnameGml(String ptUsername,String ptGmail) {
					PatientEntity PatientEntity = patientRepository.findByPtUsernameAndPtGmail(ptUsername,ptGmail);
					if (PatientEntity != null) {
						return PatientEntity;
					} else {
						return null;
					}
				}
				
		

	// @PostMapping("/update-opt")
	public PatientEntity patientUpdateOpt(String id) {
		int ptId = Integer.parseInt(id);
		PatientEntity patientEntity = patientRepository.findByptId(ptId);
		return patientEntity;
	}

	// @PostMapping("/upd-patient")
	public PatientEntity patientupdated(String id, String ptName, String age, String ptGmail, String ptMobile,String ptUsername) {
		int ptId = Integer.parseInt(id);
		int ptAge = Integer.parseInt(age);
		PatientEntity patientEntity = patientRepository.findByptId(ptId);
		
		if (patientEntity != null) {
			patientEntity.setPtId(ptId);
			patientEntity.setPtName(ptName);
			patientEntity.setPtAge(ptAge);
			patientEntity.setPtGmail(ptGmail);
			patientEntity.setPtMobile(ptMobile);
			patientEntity.setPtUsername(ptUsername);
			
			patientRepository.save(patientEntity);
			return patientEntity;
		} else {
			// check here this is null patient
			return patientEntity;
		}
	}
	
	  
	
}
