package com.app.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.core.entity.DoctorEntity;
import com.app.core.repository.DoctorRepository;

@Service
public class DoctorService {
	
	@Autowired
	DoctorRepository doctorRepository;

	
	//@PostMapping("/Authentdrlogin")
	public DoctorEntity AuthenticateDoctor(String drUsername,String drPassword) {		
		DoctorEntity doctorEntity=doctorRepository.findByDrUsernameAndDrPassword(drUsername, drPassword);	
		if(doctorEntity!=null) {
			
			   return doctorEntity;
		}
		else {
			return null;
		}	
	}
	
	//read single doctor
	public DoctorEntity getSingleDoctor(String drId,String hspId) {
		  int doctId=Integer.parseInt(drId);		
			 DoctorEntity doctorEntity=doctorRepository.findById(doctId).get();				
		    return doctorEntity;
	  }
	
	//get doctor
	public DoctorEntity getDoctor(String drId) {
		  int doctId=Integer.parseInt(drId);		
			 DoctorEntity doctorEntity=doctorRepository.findById(doctId).get();				
		    return doctorEntity;
	  }
	
	//read all doctor list   through in DoctorEntity  using hspId
	public List<DoctorEntity> drList(String hspId){
		int hospId=Integer.parseInt(hspId);
		 List<DoctorEntity> drList=doctorRepository.findByHspId(hospId);		 
		 return drList;
	}
	
	//read all doctor list from doctor table
	public List<DoctorEntity> allDoctor(){
		List<DoctorEntity> drList=doctorRepository.findAll();		
		return drList;
	}
	
	
	//@PostMapping("/addDr")
	  public void addDr(DoctorEntity doctorEntity) {	
		doctorRepository.save(doctorEntity);
	  }
	  
	    //update dr status			
		//@PostMapping("/editDrStatus")
		  public void editDrStatus(String drId,String hspId) {
			 int doctId=Integer.parseInt(drId);		
			 DoctorEntity doctorEntity=doctorRepository.findById(doctId).get();	
			
			 
			 if(doctorEntity.isDrStatus()==true) {
				 doctorEntity.setDrStatus(false);				 
				
				 doctorRepository.save(doctorEntity);
				 }
			 else {
				 doctorEntity.setDrStatus(true);				 
				
				 doctorRepository.save(doctorEntity);
			 }			 				 				
		  }
		  
		 // @PostMapping("/updateDr")
			 public DoctorEntity updateDr(String id,String drName,String drSpec,String drEmail,String drMobile,String drUsername,String drPassword,String hspId) {				   				   
				     int drId=Integer.parseInt(id);
				     int hospId=Integer.parseInt(hspId);
				   
				     DoctorEntity doctorEntity=doctorRepository.findById(drId).get();
				    
				     
				     doctorEntity.setDrName(drName);
				     doctorEntity.setDrSpec(drSpec);
				     doctorEntity.setDrEmail(drEmail);
				     doctorEntity.setDrMobile(drMobile);
				     doctorEntity.setDrUsername(drUsername);
				     doctorEntity.setDrPassword(drPassword);
				     
				    					
					doctorRepository.save(doctorEntity);										
					return doctorEntity;
			}
			 
			 
			 //@PostMapping("/delDr")
			  public void deleteDr(String drId,String hspId) {				
				int doctId=Integer.parseInt(drId);	
				int hospId=Integer.parseInt(hspId);
				DoctorEntity doctorEntity=doctorRepository.findById(doctId).get();
				//List<AppointmentEntity>appointmentEntities=doctorEntity.getAppointments();
				//doctorEntity.setAppointments(null);
				doctorRepository.delete(doctorEntity);							
			  }
	
}
