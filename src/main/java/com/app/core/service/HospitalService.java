package com.app.core.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.core.entity.DoctorEntity;
import com.app.core.entity.HospitalEntity;
import com.app.core.repository.AppointmentRepository;
import com.app.core.repository.DoctorRepository;
import com.app.core.repository.HospitalRepository;
import com.app.core.repository.PatientRepository;

@Service
public class HospitalService {

	@Autowired
	DoctorRepository doctorRepository;

	@Autowired
	HospitalRepository hospitalRepository;
	
	@Autowired
	AppointmentRepository appointmentRepository;
	
	@Autowired
	PatientRepository patientRepository;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	AppointmentService appointmentService;


	
	
	//some methods created to perform action on doctor using "doctorService"
	 //but before that its option window provided using "hospitalService"        
	 //so one  method  written in Hospital service and another in Doctor service
	
	//@PostMapping("/AuthentHsplogin")
	public HospitalEntity AuthenticateHospital(String hspUsername,String hspPassword) {	
		HospitalEntity hospitalEntity=hospitalRepository.findByHspUsernameAndHspPassword(hspUsername, hspPassword);	
		
		if(hospitalEntity!=null) {
			
			return hospitalEntity;
		}		
		else {
			return null;
		}
	}

	// list of hospital
	public List<HospitalEntity> hspList() {
		List<HospitalEntity> hspList = hospitalRepository.findAll();		
		return hspList;
	}
	
	//read single hospital
	public HospitalEntity getHospital(String hspId) {
		int hospId=Integer.parseInt(hspId);		
		HospitalEntity hospitalEntity=hospitalRepository.findById(hospId).get();
		
		return hospitalEntity;
	}
	
	//read all doctor list   through in HospitalEntity        also we get this list in doctorService  using DoctorEntity
	//@PostMapping("/drList")
	  public List<DoctorEntity> drList(String hspId) {						
		int hospId=Integer.parseInt(hspId);		
		HospitalEntity hospitalEntity=hospitalRepository.findById(hospId).get();
		
		List<DoctorEntity> drList=hospitalEntity.getDoctorList();
		
		 return drList;
	  }

	// @PostMapping("/addHsp")
	public void addHsp(HospitalEntity hospitalEntity) {
		
		hospitalRepository.save(hospitalEntity);
	}

	// @PostMapping("/deleteHsp")
	//here id is hspid
	public List<HospitalEntity> deleteHsp(String id) {
		
		List<DoctorEntity> doctorEntities=doctorRepository.findByHspId(Integer.parseInt(id));
		
		for(DoctorEntity doctor: doctorEntities) {
            appointmentService.deleteDrAppointments(String.valueOf(doctor.getDrId()));
            doctorService.deleteDr(String.valueOf(doctor.getDrId()), id);
		}
		int hspId = Integer.parseInt(id);
		hospitalRepository.deleteById(hspId);
		List<HospitalEntity> hspList = hospitalRepository.findAll();
		return hspList;
		
		
	}
	
	

	// @PostMapping("/editHspOpt")
	public HospitalEntity editHspOpt(String id) {
		int hspId = Integer.parseInt(id);
		HospitalEntity hospitalEntity = hospitalRepository.findById(hspId).get();
	
		return hospitalEntity;
	}

	// @PostMapping("/updateHsp")
	public HospitalEntity updateHsp(String id, String hspName, String hspAdd, String hspUsername, String hspPassword) {
		int hspId = Integer.parseInt(id);
		HospitalEntity dbHsp = hospitalRepository.findById(hspId).get();
		dbHsp.setHspName(hspName);
		dbHsp.setHspAdd(hspAdd);
		dbHsp.setHspUsername(hspUsername);
		dbHsp.setHspPassword(hspPassword);
		
		hospitalRepository.save(dbHsp);
		System.out.println("hospital updated successfully in admin dao");
		return dbHsp;
	}
	
	//update bed count
	//@PostMapping("/editHspBedOpt")
	  public HospitalEntity editHspBedOpt(String hspId) {		
		int hospId=Integer.parseInt(hspId);
		HospitalEntity hospitalEntity=hospitalRepository.findById(hospId).get();
		
	    return hospitalEntity;
	  }
	  
	  //@PostMapping("/updateHspBedcount")
		 public HospitalEntity updateHspBedcount(String hspId,String hspBNo) {
			int hospId=Integer.parseInt(hspId);
			int hospBCnt=Integer.parseInt(hspBNo);
			
			HospitalEntity hospitalEntity=hospitalRepository.findById(hospId).get();
		
			
			hospitalEntity.setHspBNo(hospBCnt);
			
			hospitalRepository.save(hospitalEntity);

			return hospitalEntity;
		}
		 
		//create search hospital		 
		 public List<HospitalEntity> listAll(String keyword) {
				if (keyword != null) {
		           
					List<HospitalEntity> hspList = hospitalRepository.search(keyword);
					
					return hspList;
					
					
		        }
				
				List<HospitalEntity> hspList = hospitalRepository.findAll();
				
				return hspList;
			}
		 
		 		 
}
