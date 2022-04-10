package com.app.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.core.entity.PrescriptionEntity;

@Repository
public interface PrescriptionRepository extends JpaRepository<PrescriptionEntity, Integer> {

	PrescriptionEntity findByPrecId(int precId);
	
	List<PrescriptionEntity> findByDrIdAndPtId(int ptId,int drId);

}
