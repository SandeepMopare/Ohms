package com.app.core.controller;

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
import com.app.core.dao.Appointment;
import com.app.core.entity.DoctorEntity;
import com.app.core.entity.HospitalEntity;
import com.app.core.entity.PatientEntity;
import com.app.core.enums.AptStatus;
import com.app.core.service.AppointmentService;
import com.app.core.service.DoctorService;
import com.app.core.service.HospitalService;
import com.app.core.service.PatientService;

@Controller
@RequestMapping("/dr")
public class DoctorController {
	
	@Autowired
	AppointmentService appointmentService;
	
	@Autowired
	HospitalService HospitalService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	PatientService patientService;
	
	@Autowired
	EmailSenderService emailSenderService ;

	//@Autowired
	//DoctorRepository doctorRepository;
		
	@GetMapping("/login")
	public ModelAndView drLog() {
		ModelAndView mv=new ModelAndView("DrLogin");
		return mv;
	}
	
	//@RequestMapping(value="/Authentdrlogin" ,method=RequestMethod.GET)	
	@PostMapping("/Authentdrlogin")
	public ModelAndView AuthenticateDoctor(String drUsername,String drPassword,HttpServletRequest req,HttpServletResponse res) {		
		DoctorEntity doctorEntity=doctorService.AuthenticateDoctor(drUsername, drPassword);		
		if(doctorEntity!=null) {
			ModelAndView mv=new ModelAndView("Appointment-list");
			mv.addObject("doctor", doctorEntity);
			HttpSession session=req.getSession();
			session.setAttribute("my-doctor", 1);
			
			return mv;
		}		
		else {
			ModelAndView mv=new ModelAndView("DrLogin");
			mv.addObject("drLogFail", 0);
			return mv;        
		}
	}
	
	@GetMapping("/drlogout")
	public ModelAndView drlogout(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv=new ModelAndView("DrLogin");
		req.removeAttribute("my-doctor");
		req.getSession().invalidate();
		return mv;
	}
	
	//read appointment list using drid and all booked closed cancelled
	@GetMapping("/AllpatAptlist")
    public ModelAndView AllpatAptlist(String drid) {
		 AptStatus aptStatus=AptStatus.CLOSED;
   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
   	  	      	List<Appointment> AllpatAptlist=appointmentService.Appointpatientlist(drid,aptStatus);
   	  	         mv.addObject("doctor", doctorEntity); 	  	        
   	  	         mv.addObject("AllpatAptlist", AllpatAptlist);
   	  	         mv.addObject("allPatAptlist", 1);
   	  	         
   	  	     //fetch patient list on doctor see all patient list table to display patient name on front end
   		   	  	List< PatientEntity> patientList =patientService.getAllPatient();
   		   	    mv.addObject("patientList",  patientList);
   	  	         
			    return mv;
    }
	
	
	//read appointment list using drid and confirmed // we show this to dr in ascending order so todays come first next day apt goes below
		@GetMapping("/Appointpatientlist")
	    public ModelAndView Appointpatientlist(String drid) {
			       AptStatus aptStatus=AptStatus.CONFIRMED;
	   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
	   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
	   	  	      	List<Appointment> Appointpatientlist=appointmentService.Appointpatientlist(drid,aptStatus);
	   	  	         mv.addObject("doctor", doctorEntity); 	
	   	  	         
	   	  	         mv.addObject("Appointpatientlist", Appointpatientlist);
	   	  	         mv.addObject("appointPatientlist", 1);
	   	  	  
	   	  	  //fetch patient list on doctor see appointment table to display patient name on front end
	   	  	List< PatientEntity> patientList =patientService.getAllPatient();
	   	    mv.addObject("patientList",  patientList);
				    return mv;
	    }
		
		@GetMapping("/AptCloseByDr")
	    public ModelAndView AppCloseByDr(String ptid,String drid) {
			      appointmentService.aptClosed(ptid, drid);
			
			       AptStatus aptStatus=AptStatus.CONFIRMED;
	   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
	   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
	   	  	      	List<Appointment> Appointpatientlist=appointmentService.Appointpatientlist(drid,aptStatus);
	   	  	         mv.addObject("doctor", doctorEntity); 	  	        
	   	  	         mv.addObject("Appointpatientlist", Appointpatientlist);
	   	  	         mv.addObject("appointPatientlist", 1);
	   	  	         mv.addObject("aptCloseByDr", 1);
	   	  	    
	   	  	    //fetch patient list on doctor see appointment table to display patient name on front end
	   		   	  	List< PatientEntity> patientList =patientService.getAllPatient();
	   		   	    mv.addObject("patientList",  patientList);
	   		   	    
	   		   	    PatientEntity  patientEntity=patientService.getSinglePatient(ptid);
	   		   	 //send mail after cancellation or
	   		   	emailSenderService.sendSimpleEmail(patientEntity.getPtGmail(),
	   					"Message from DoctorHub... Your checkup has been successfully done by doctor "+doctorEntity.getDrName()+". Thank You",
	   					"From DoctorHub!!!");
	   		   	    
				    return mv;
	    }
	
		@GetMapping("/AptCancelByDr")
	    public ModelAndView AptCancelByDr(String ptid,String drid) {
			      appointmentService.aptCancel(ptid, drid);
			
			       AptStatus aptStatus=AptStatus.CONFIRMED;
	   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
	   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
	   	  	      	List<Appointment> Appointpatientlist=appointmentService.Appointpatientlist(drid,aptStatus);
	   	  	         mv.addObject("doctor", doctorEntity); 	  	        
	   	  	         mv.addObject("Appointpatientlist", Appointpatientlist);
	   	  	         mv.addObject("appointPatientlist", 1);
	   	  	         mv.addObject("aptCancelByDr", 1);
	   	  	      	         
	   	  	    //fetch patient list on doctor see appointment table to display patient name on front end
	   		   	  	List< PatientEntity> patientList =patientService.getAllPatient();
	   		   	    mv.addObject("patientList",  patientList);
	   		   	    
	   		   	PatientEntity  patientEntity=patientService.getSinglePatient(ptid);
	   		   	 //send mail after cancellation or
	   		   	emailSenderService.sendSimpleEmail(patientEntity.getPtGmail(),
	   					"Message from DoctorHub... Your booking has been cancelled by doctor "+doctorEntity.getDrName()+". Thank You",
	   					"From DoctorHub!!!");
	   		   	
				    return mv;
	    }
		
		@GetMapping("/doctProfile")
		public ModelAndView doctProfile(String drid) {		
			DoctorEntity doctorEntity=doctorService.getDoctor(drid);
			String hid=String.valueOf(doctorEntity.getHspId());
			HospitalEntity hospitalEntity=HospitalService.getHospital(hid);
				ModelAndView mv=new ModelAndView("doctorProfile");
				mv.addObject("doctor", doctorEntity);
				mv.addObject("hospital", hospitalEntity);
				return mv;
			     
			
		}
}
