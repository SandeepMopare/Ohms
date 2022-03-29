package com.app.core.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.core.EmailSenderService;
import com.app.core.entity.DoctorEntity;
import com.app.core.entity.HospitalEntity;
import com.app.core.service.AppointmentService;
import com.app.core.service.DoctorService;
import com.app.core.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	AppointmentService appointmentService;
	
	@Autowired
	EmailSenderService emailSenderService;
	
	//@Autowired
	//DoctorRepository doctorRepository;
	
	//@Autowired
	//HospitalRepository hospitalRepository;
	
	@GetMapping("/login")
	  public ModelAndView Admin() {
		ModelAndView mv=new ModelAndView("HspLogin");
	  return mv;
	  }
	
	@PostMapping("/AuthentHsplogin")
	public ModelAndView AuthenticateHospital(String hspUsername,String hspPassword, HttpServletRequest req, HttpServletResponse res) {	
		HospitalEntity hospitalEntity=hospitalService.AuthenticateHospital(hspUsername, hspPassword);	
		if(hospitalEntity!=null) {
			ModelAndView mv=new ModelAndView("hospital");
			mv.addObject("hospital", hospitalEntity);
		   HttpSession session=req.getSession();
		   session.setAttribute("my-hospital", 1);
			return mv;
		}		
		else {
			ModelAndView mv=new ModelAndView("HspLogin");
			mv.addObject("HspLogFail", 0);
			return mv;
		}
	}
	
	@GetMapping("/hsplogout")
	public ModelAndView logoutHsp(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView("HspLogin");
		req.getSession().invalidate();
		return mv;
	}
	
	
	     //get doctor list using two way using hospitalService and using doctorService
	      //read all doctor list
			@GetMapping("/drList")
			  public ModelAndView drList(String hspId) {				
				if(hspId==null) {
					ModelAndView mv=new ModelAndView("HspLogin");	
					return mv;
				}			
				ModelAndView mv=new ModelAndView("hospital");	
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);				
				List<DoctorEntity> drList=doctorService.drList(hspId);
				mv.addObject("hospital", hospitalEntity);
				mv.addObject("drList", drList);
				mv.addObject("DRLIST", 1);
			    return mv;
			  }
			
			//update dr status			
			@GetMapping("/editDrStatus")
			  public ModelAndView editDrStatus(String drId,String hspId) {
				doctorService.editDrStatus(drId, hspId);				
				ModelAndView mv=new ModelAndView("hospital");	
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);				
				List<DoctorEntity> drList=doctorService.drList(hspId);
				mv.addObject("hospital", hospitalEntity);
				mv.addObject("drList", drList);
				mv.addObject("DRLIST", 1);
			    return mv;
			  }
			
			//update bed count
			@GetMapping("/editHspBedOpt")
			  public ModelAndView editHspBedOpt(String hspId) {
				ModelAndView mv=new ModelAndView("hospital");				
				HospitalEntity hospitalEntity=hospitalService.editHspBedOpt(hspId);
				mv.addObject("hospital",hospitalEntity );
				mv.addObject("editHspProf", 1);
				mv.addObject("hspprofile", 2);	
			    return mv;
			  }
			
			@PostMapping("/updateHspBedcount")
			 public ModelAndView updateHspBedcount(String hspId,String hspBNo) {
				try {
				      ModelAndView mv=new ModelAndView("hospital");
				      HospitalEntity hospitalEntity=hospitalService.updateHspBedcount(hspId, hspBNo);
						mv.addObject("hospital",hospitalEntity );
						mv.addObject("editHspProf", 1);
						mv.addObject("hspprofile", 1);	
					return mv;
				}
				catch(Exception e) {
					 ModelAndView mv=new ModelAndView("hospital");
				      HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
						mv.addObject("hospital",hospitalEntity );
						mv.addObject("editHspProf", 1);
						mv.addObject("hspprofile", 0);	
					return mv;
				}
			}
			
			@GetMapping("/editDrOpt")
			  public ModelAndView editDrOpt(String drId,String hspId) {
				ModelAndView mv=new ModelAndView("hospital");												
				DoctorEntity drOldInfo=doctorService.getSingleDoctor(drId, hspId);					
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
				mv.addObject("hospital",hospitalEntity );
				mv.addObject("drOldInfo",drOldInfo );
				mv.addObject("editDrProf", 1);
				mv.addObject("drprofile", 2);	
			    return mv;
			  }
			
			@PostMapping("/updateDr")
			 public ModelAndView updateDr(String id,String drName,String drSpec,String drEmail,String drMobile,String drUsername,String drPassword,String hspId) {
				     try {
				    	 ModelAndView mv=new ModelAndView("hospital");				    
				      DoctorEntity doctorEntity=doctorService.updateDr(id, drName, drSpec, drEmail, drMobile, drUsername, drPassword, hspId);				     				     			
					mv.addObject("editDrProf", 1);
					mv.addObject("drprofile", 1);				
					HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
					mv.addObject("hospital",hospitalEntity );
					System.out.println("doctor updated successfully in admin dao");
					return mv;
				     }
				     catch(Exception e) {
				    	 ModelAndView mv=new ModelAndView("hospital");				    				     				     			
						mv.addObject("editDrProf", 1);
						mv.addObject("drprofile", 0);				
						HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
						mv.addObject("hospital",hospitalEntity );
						System.out.println("doctor not updated in admin dao");
						return mv;
				     }
			}
			
			@GetMapping("/delDr")
			  public ModelAndView deleteDr(String drId,String hspId) {
				try {
				ModelAndView mv=new ModelAndView("hospital");	

				appointmentService.deleteDrAppointments(drId);								
				doctorService.deleteDr(drId, hspId);
				
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);				
				List<DoctorEntity> drList=doctorService.drList(hspId);
				
				mv.addObject("hospital", hospitalEntity);
				mv.addObject("drList", drList);
				mv.addObject("DRLIST", 1);
				System.out.println("doctor deleted successfully in hospital dao");
			    return mv;
				}
				catch(Exception e){
					ModelAndView mv=new ModelAndView("hospital");	

					//appointmentService.deleteDrAppointments(drId);								
					//doctorService.deleteDr(drId, hspId);
					
					HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);				
					List<DoctorEntity> drList=doctorService.drList(hspId);
					
					mv.addObject("hospital", hospitalEntity);
					mv.addObject("drList", drList);
					mv.addObject("DRLIST", 1);
					System.out.println("doctor not deleted  in hospital dao");
				    return mv;
				}
			  }
			
			@GetMapping("/addDrOpt")
			  public ModelAndView addDrOpt(String hspId) {
				ModelAndView mv=new ModelAndView("hospital");				
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
				 mv.addObject("hospital", hospitalEntity);
				mv.addObject("addDrWindow", 1);
				mv.addObject("drReg", 2);
			    return mv;
			  }
			
			@PostMapping("/addDr")
			  public ModelAndView addDr(String drName,String drSpec,String drEmail,String drMobile,String drUsername,String drPassword,String hspId) {
				try{
					ModelAndView mv=new ModelAndView("hospital");
				int hospId=Integer.parseInt(hspId);		
				DoctorEntity doctorEntity=new DoctorEntity(drName,drSpec,drEmail,drMobile,drUsername,drPassword,false,hospId);
				doctorService.addDr(doctorEntity);
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
				mv.addObject("hospital", hospitalEntity);
				mv.addObject("drReg", 1);
				mv.addObject("addDrWindow", 1);
				System.out.println("doctor added successfully in hospital dao");
				
				emailSenderService.sendSimpleEmail(drEmail,
						"Your registration done by hospital- "+hospitalEntity.getHspName()+"... You can log with following credentials "
							+" Username: "	+drUsername  + "  Password: " + drPassword,
							"From DoctorHub!!!");
				
			    return mv;
				}
				catch(Exception e) {
					ModelAndView mv=new ModelAndView("hospital");
					int hospId=Integer.parseInt(hspId);				
					HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
					mv.addObject("hospital", hospitalEntity);
					mv.addObject("drReg", 0);
					mv.addObject("addDrWindow", 1);
					System.out.println("doctor not added in hospital dao");
				    return mv;
				}
			  }
			
			
			@GetMapping("/hospProfile")
			  public ModelAndView hospProfile(String hspId) {
				ModelAndView mv=new ModelAndView("hospitalProfile");				
				HospitalEntity hospitalEntity=hospitalService.getHospital(hspId);
				List<DoctorEntity> doctorEntity=hospitalEntity.getDoctorList();
				int drcount=doctorEntity.size();
				 mv.addObject("hospital", hospitalEntity);
				 mv.addObject("drcount", drcount);
			    return mv;
			  }
			
			
			
}
