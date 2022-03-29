package com.app.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.core.entity.HospitalEntity;

public interface HospitalRepository extends JpaRepository<HospitalEntity, Integer> {

	HospitalEntity findByHspUsernameAndHspPassword(String hspUsername,String hspPassword);	
	
	
	@Query("SELECT p FROM HospitalEntity p WHERE p.hspName LIKE %?1%"
            + " OR p.hspAdd LIKE %?1%"
           )
    public List<HospitalEntity> search(String keyword);
	
	
}
