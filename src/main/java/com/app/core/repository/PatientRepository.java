package com.app.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.core.entity.PatientEntity;

public interface PatientRepository extends JpaRepository<PatientEntity, Integer>{

	PatientEntity findByPtUsernameAndPtPassword(String ptUsername,String ptPassword);
	
	PatientEntity findByptId(int ptId);
	//PatientEntity findByPtId(int ptId);
	
	PatientEntity findByPtUsername(String ptUsername);
	
	PatientEntity findByPtUsernameAndPtGmail(String ptUsername,String ptGmail);
}
