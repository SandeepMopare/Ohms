package com.app.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.core.entity.AppointmentEntity;
import com.app.core.enums.AptStatus;

public interface AppointmentRepository extends JpaRepository<AppointmentEntity, Integer>  {
	
	
	AppointmentEntity findByPtIdAndDrId(int patId,int doctId);
	
	AppointmentEntity findByAptId(int aptId);
	
	List<AppointmentEntity> findByPtId(int patId);
	
	List<AppointmentEntity> findByPtIdAndAptStatus(int patId,AptStatus aptStatus);
	
	List<AppointmentEntity> findByDrId(int drId);
	
	List<AppointmentEntity> findByDrIdAndAptStatus(int drid,AptStatus aptStatus);
	
	List<AppointmentEntity> findByPtIdAndDrIdAndAptStatus(int patId, int doctId, AptStatus aptStatus);
	
	List<AppointmentEntity> findByPtIdOrderByAptDateDesc(int patId);
	
	List<AppointmentEntity> findByDrIdOrderByAptDateDesc(int drId);
	
	List<AppointmentEntity> findByDrIdAndAptStatusOrderByAptDateAsc(int drid,AptStatus aptStatus);
}
