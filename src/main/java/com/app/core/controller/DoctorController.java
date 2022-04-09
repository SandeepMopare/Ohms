package com.app.core.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import com.app.core.entity.AppointmentEntity;
import com.app.core.entity.DoctorEntity;
import com.app.core.entity.HospitalEntity;
import com.app.core.entity.PatientEntity;
import com.app.core.entity.PrescriptionEntity;
import com.app.core.enums.AptStatus;
import com.app.core.service.AppointmentService;
import com.app.core.service.DoctorService;
import com.app.core.service.HospitalService;
import com.app.core.service.PatientService;
import com.app.core.service.PrescriptionService;

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

	@Autowired
	PrescriptionService prescriptionService;
		
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
	   					"Message from OHMS... Your checkup has been successfully done by doctor "+doctorEntity.getDrName()+". Thank You",
	   					"From OHMS!!!");
	   		   	    
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
	   					"Message from OHMS... Your booking has been cancelled by doctor "+doctorEntity.getDrName()+". Thank You",
	   					"From OHMS!!!");
	   		   	
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
		
		@GetMapping("/addPrescription")
		public ModelAndView addPrecription(String drid, String ptid, String aptId) {
			ModelAndView mv = new ModelAndView("Prescription");
			System.out.println("in addPrescription");
			mv.addObject("addPrecWindow", 1);
			mv.addObject("precReg", 2);
			DoctorEntity doctorEntity = doctorService.getDoctor(drid);
			mv.addObject("doctor", doctorEntity);
			PatientEntity patientEntity = patientService.getSinglePatient(ptid);
			mv.addObject("patient", patientEntity);
			// HospitalEntity hospitalEntity = HospitalService.getHospital(hid);
			// mv.addObject("hospital", hospitalEntity);
			AppointmentEntity appointmentEntity = appointmentService.getAptById(aptId);
			mv.addObject("appointment", appointmentEntity);
			return mv;
		}

		@PostMapping("/addPrec")
		public ModelAndView addPrec(String drid, String ptid, String aptId, String dateTime, String diagnosedWith, String bloodPressure, String pulseRate,
				String weight, String allergies, String disabilities, String dose1, String drug1, String unit1,
				String dose2, String drug2, String unit2, String test1, String test2) {
			ModelAndView mv = new ModelAndView("Prescription");
			DoctorEntity doctorEntity = doctorService.getDoctor(drid);
			mv.addObject("doctor", doctorEntity);
			PatientEntity patientEntity = patientService.getSinglePatient(ptid);
			mv.addObject("patient", patientEntity);
			// HospitalEntity hospitalEntity = HospitalService.getHospital(hid);
			// mv.addObject("hospital", hospitalEntity);
			AppointmentEntity appointmentEntity = appointmentService.getAptById(aptId);
			mv.addObject("appointment", appointmentEntity);
			try {

				

				// apply internal validation
				System.out.println(dateTime);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate localDate = LocalDate.parse(dateTime, formatter);
				// LocalDate localDate = LocalDate.of(2020, 12, 31);

				System.out.println("In addPrec");

				System.out.println(diagnosedWith.trim());
				String diagnoseWith = diagnosedWith;

				int bP = Integer.parseInt(bloodPressure.trim());
				int pR = Integer.parseInt(pulseRate.trim());
				int wt = Integer.parseInt(weight.trim());
				String allergy = allergies.trim();
				String disability = disabilities.trim();
				String dos1 = dose1.trim();
				String drg1 = drug1.trim();
				String unt1 = unit1.trim();
				String dos2 = dose1.trim();
				String drg2 = drug1.trim();
				String unt2 = unit1.trim();
				String tst1 = test1.trim();
				String tst2 = test2.trim();

				PrescriptionEntity prescriptionEntity = new PrescriptionEntity(localDate, bP, pR, wt, diagnoseWith, allergy,
						disability, drg1, unt1, dos1, drg2, unt2, dos2, tst1, tst2);
				// hospitalService.addHsp(hospitalEntity);
				System.out.println(prescriptionEntity);
				prescriptionService.addPrec(prescriptionEntity);

				mv.addObject("addPrecWindow", 1);
				mv.addObject("precReg", 1);
				System.out.println("Precription added successfully ");
				return mv;
			} catch (Exception e) {
				mv.addObject("addPrecWindow", 1);
				mv.addObject("precReg", 0);
				System.out.println("Precription not added ");
				return mv;
			}
		}
}
