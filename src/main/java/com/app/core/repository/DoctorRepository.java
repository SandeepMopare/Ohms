package com.app.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.core.entity.DoctorEntity;

public interface DoctorRepository extends JpaRepository<DoctorEntity, Integer>{

	DoctorEntity findByDrUsernameAndDrPassword(String drUsername,String drPassword);
	
	List<DoctorEntity> findByHspId(int hspId);
}
