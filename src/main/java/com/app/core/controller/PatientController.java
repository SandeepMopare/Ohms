package com.app.core.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
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
import com.app.core.service.AppointmentService;
import com.app.core.service.DoctorService;
import com.app.core.service.HospitalService;
import com.app.core.service.PatientService;

@Controller
@RequestMapping("/patient")
public class PatientController {

	@Autowired
	PatientService patientService;
	
	@Autowired
	DoctorService doctorService;

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	AppointmentService  appointmentService;
	
	@Autowired
	EmailSenderService emailSenderService ;

	// show
	@GetMapping("/reg")
	public ModelAndView show() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}

	// create
	@PostMapping("/registered")
	public ModelAndView create(String ptName, String age, String ptGmail, String ptMobile, String ptUsername,
			String ptPassword) {
		try {
		//encrypt pass using hashPassword() method
		PatientController patientDao=new PatientController();		
		String encrpPassUser=patientDao.hashPassword(ptPassword);
		
		ModelAndView mv = new ModelAndView("register");
		int ptAge = Integer.parseInt(age);
		PatientEntity patientEntity = new PatientEntity(ptName, ptAge, ptGmail, ptMobile, ptUsername, encrpPassUser);
		patientService.create(patientEntity);
		
		emailSenderService.sendSimpleEmail(ptGmail,
				"You have successfully registered with DoctorHub... You can log with following credentials "
					+" Username: "	+ptUsername  + "  Password: " + ptPassword,
					"From DoctorHub!!!");
		
		
	
		mv.addObject("patReg", 1);
		return mv;
		}
		catch(Exception e) {
			ModelAndView mv = new ModelAndView("register");
			mv.addObject("patReg", 0);
			return mv;
		}
		
	}
	
	private String hashPassword(String plainTextPassword){
		return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
	}
	

	@GetMapping("/login")
	public ModelAndView log() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	@PostMapping("/AuthPtlogin")
	public ModelAndView Authenticatepatient(String ptUsername, String ptPassword, HttpServletRequest req, HttpServletResponse res) {
		try {		 
		PatientEntity patientEntity = patientService.AuthentPatUname(ptUsername);
		
		  if (patientEntity != null) {
			PatientController patientDao=new PatientController();
			boolean passresult=patientDao.checkPass(ptPassword,patientEntity.getPtPassword() );
			if(passresult) {
			   ModelAndView mv = new ModelAndView("Appointment");
			   mv.addObject("patient", patientEntity);
			  
                 HttpSession session=req.getSession();
                 session.setAttribute("my-patient", 1);
			   
			   return mv;
		     } 
		  }
		  ModelAndView mv = new ModelAndView("login");
		   mv.addObject("ptLogFail", 0);
		   return mv;
		}
		catch(Exception e) {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("ptLogFail", 0);
			return mv;
		}	
	}
	
	private boolean checkPass(String plainPassword, String hashedPassword) {
		if (BCrypt.checkpw(plainPassword, hashedPassword)) {
			System.out.println(plainPassword + hashedPassword);
			System.out.println("The password matches.");
		    return true;
		}
		else {
			System.out.println(plainPassword + hashedPassword);
			System.out.println("The password does not match.");
		     return false;
		}
	}
	
	@PostMapping("/reqforgotPass")
	public ModelAndView reqforgotPass(String ptUsername,String ptGmail) {
		PatientEntity patientEntity = patientService.AuthentPatUnameGml(ptUsername,ptGmail);
		if (patientEntity != null ) {
			ModelAndView mv = new ModelAndView("login");
			PatientController patientDao=new PatientController();		
			mv.addObject("ptPassFail", 1);
			
			emailSenderService.sendSimpleEmail(ptGmail,
					"click on this link to update your password   " + "http://localhost:8080/patient/applyforgotPass?UserName="+ patientEntity.getPtUsername() ,
						"From DoctorHub!!!");
			
			System.out.println(ptGmail);
			
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("ptPassFail", 0);
			return mv;
		}	
	}
	
	@GetMapping("/applyforgotPass")
		public ModelAndView applyforgotPass(String UserName ) {
		ModelAndView mv = new ModelAndView("loginForgotPass");
		PatientEntity patientEntity=new PatientEntity();
		patientEntity.setPtUsername(UserName);
		mv.addObject("UserName",patientEntity.getPtUsername());
		System.out.println(patientEntity.getPtUsername());
		return mv;
	}
	
	
	@PostMapping("/applyforgotPassinput")
	public ModelAndView applyforgotPass(String ptUsername, String ptPassword) {
		PatientEntity patientEntity = patientService.AuthentPatUname(ptUsername);
		if (patientEntity != null ) {
			ModelAndView mv = new ModelAndView("login");
			PatientController patientDao=new PatientController();		
			String encrpPassUser=patientDao.hashPassword(ptPassword);	
			patientEntity.setPtPassword(encrpPassUser);
			patientService.create(patientEntity);
			mv.addObject("ptPassUpdated", 1);	
			return mv;
			
		} else {
			ModelAndView mv = new ModelAndView("loginForgotPass");
			mv.addObject("ptPassUpdated", 0);
			return mv;
		}	
		
	}
	
	
	@GetMapping("/ptlogout")
    public ModelAndView ptlogout(HttpServletRequest req, HttpServletResponse res) {
    	ModelAndView mv=new ModelAndView("login");
    	req.removeAttribute("my-patient");
    	req.getSession().invalidate();
    	return mv;
    }
	
	@GetMapping("/showPatientProf")
	public ModelAndView showPatientProf(String id) {
		PatientEntity patientEntity = patientService.patientUpdateOpt(id);		 
			ModelAndView mv = new ModelAndView("Appointment");
			mv.addObject("patient", patientEntity);
			mv.addObject("patProf", 1 );
			return mv;
		
	}

	@GetMapping("/update-opt")
	public ModelAndView patientUpdateOpt(String id) {
		PatientEntity patientEntity = patientService.patientUpdateOpt(id);
		if (patientEntity != null) {
			ModelAndView mv = new ModelAndView("updatePatientProfile");
						
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 2);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 3);
			return mv;
		}
	}

	@PostMapping("/upd-patient")
	public ModelAndView patientupdated(String id, String ptName, String age, String ptGmail, String ptMobile,String ptUsername) {
		try {
		    PatientEntity patientEntity = patientService.patientupdated(id, ptName, age, ptGmail, ptMobile,ptUsername);
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 1);
			return mv;
		}
		catch(Exception e) {
			PatientEntity patientEntity=patientService.getSinglePatient(id);
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 0);
			return mv;
		}
	}
	
	
	@GetMapping("/bookAppBtn")
	public ModelAndView bookAppoint(String ptid){
		ModelAndView mv=new ModelAndView("bookAptShowHspList"); 
		PatientEntity patientEntity=patientService.getSinglePatient(ptid);
		 mv.addObject("patient", patientEntity);
			List<HospitalEntity> hspList = hospitalService.hspList();
			mv.addObject("hspList", hspList);
			mv.addObject("HSPLIST", 1);
			return mv;
	}
	
	
	 // read all doctor list as per hspId
	  @GetMapping("/drList") 
	  public ModelAndView drList(String hspid, String ptid) { 
		  List<DoctorEntity> drList=doctorService.drList(hspid);
		  PatientEntity patientEntity =patientService.getSinglePatient(ptid);
	  ModelAndView mv = new ModelAndView("viewDoctorForApt"); 
	  mv.addObject("patient",  patientEntity); // List<DoctorEntity> drList=doctorRepository.findAll(); //
	  mv.addObject("drList", drList); 
	   mv.addObject("DRLIST", 1); 
	   return mv;
     }
	 
     @GetMapping("/aptBooking")
     public ModelAndView aptBooking(String appdate,String ptid,String drid ){
    	 
    	 //patient is booking first time or second time....first time null value in appointment table and second type find set save
    	 
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);
    	 //fetch by ptid and drid
    	 
    	 boolean alreadypresent=appointmentService.aptPresentCheck(ptid,drid);
    	 
    	 if(alreadypresent) {
    		 ModelAndView mv=new ModelAndView("viewDoctorForApt");
    		 mv.addObject("patient",  patientEntity);
    		 mv.addObject("b",2);
    		 System.out.println("appointment already present");
    		 return mv;
    	 }
    	 else {
    	 appointmentService.aptBooking(appdate,ptid,drid);
    	 ModelAndView mv=new ModelAndView("viewDoctorForApt"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("b",1);
    	 System.out.println("appointment booked succesfully");    	     	 
    	 
    	 return mv;
    	 }
     }
     
     @GetMapping("/aptinfoWindow")
     public ModelAndView aptinfoWindow(String ptid){
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);
    	List<Appointment> aptList=appointmentService.getAptListPt(ptid);
    	 ModelAndView mv=new ModelAndView("appointmentInfo"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("aptList",  aptList);
    	 mv.addObject("APTLIST", 1);  
    	 
    	// List< Patient> patientList =patientService.getAllPatient();
    	 //mv.addObject("patientList",  patientList);
    	 
    	 //fetch doctorlist on patient appointment table to display doctor name on front end
    	 List<DoctorEntity> drList=doctorService.allDoctor();
    	 mv.addObject("drList",  drList);
    	 
    	//fetch doctorlist on patient appointment table to display doctor name on front end
    	 List<HospitalEntity> hspList = hospitalService.hspList();
			mv.addObject("hspList", hspList);
    	 
    	 return mv;
     }
     
     @GetMapping("/aptCancel")
     public ModelAndView aptCancel(String ptid,String drid){
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);    	  	   
    	 appointmentService.aptCancel(ptid,drid);
    	 ModelAndView mv=new ModelAndView("appointmentInfo"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("c",1);
    	 System.out.println("appointment cancelled");
    	 
  
    	 return mv;
     }
     
     
     
     @GetMapping("patientPayOPt")
     public ModelAndView patientPayOPt(String ptid, String drid) {      //12
       PatientEntity patientEntity=patientService.getSinglePatient(ptid);       //12 
       
       ModelAndView mv=new ModelAndView("paymentOption");
       mv.addObject("patient",patientEntity);
       
       DoctorEntity doctorEntity=doctorService.getDoctor(drid);
       mv.addObject("doctor", doctorEntity);
       
       mv.addObject("payOnce", 5);
       return mv;       
      }
     
     @PostMapping("patientpay")
     public ModelAndView patientpay( String cardnum   , String  exp, String cvv, String ptid,String drid   ) {
    	 try{
    	 String checkcardnum="987654321098";
    	 String checkexp="07/25";
    	 String checkcvv="777";
    	 
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid); 
    	 
    	 if(checkcardnum.equals(cardnum) && checkexp.equals(exp) && checkcvv.equals(cvv) ) {
    		 
    		 //check payment already done for ptid and drid means check aptStatus CONFIRMED if confirmed means payment done
    		 //method already written in appointmentservice just call here 
    		 
    		/* boolean alreadypresent=appointmentService.aptPresentCheck(ptid,drid);
    		 if(alreadypresent) {
    			 ModelAndView mv=new ModelAndView("paymentOption");
        		 mv.addObject("payment",2);                                      //2 for payment already done dont do it again
        		 mv.addObject("patient",patientEntity);   		 
        		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
        	       mv.addObject("doctor", doctorEntity);
            	 System.out.println("payment already done");
        		 return mv;
    		 }
    		 */
    		 
    		 ModelAndView mv=new ModelAndView("paymentOption");
    		 mv.addObject("payment",1);
    		 mv.addObject("patient",patientEntity);   		 
    		 appointmentService.aptConfirmed(ptid,drid);
    		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
    	       mv.addObject("doctor", doctorEntity);
        	 System.out.println("appointment confirmed with successfully payment");
        	 
        	 emailSenderService.sendSimpleEmail(patientEntity.getPtGmail(),
        			 "Message from DoctorHub... You have successfully completed payment."
        			 + " Your appointment is confirmed with doctor "+doctorEntity.getDrName()+". Thank You",
     					"From DoctorHub!!!");
        	 
    		 return mv;
    	 }
    	 else {
    		 ModelAndView mv=new ModelAndView("paymentOption");
    		 mv.addObject("payment",0);
    		 mv.addObject("patient",patientEntity);
    		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
    	       mv.addObject("doctor", doctorEntity);
        	 System.out.println("appointment not confirmed bcz payment fail");
    		 return mv; 
    	 }
    	 }
    	 catch(Exception e) {
    		 PatientEntity patientEntity=patientService.getSinglePatient(ptid); 
    		 ModelAndView mv=new ModelAndView("paymentOption");
    		 mv.addObject("patient",patientEntity);
    		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
    	       mv.addObject("doctor", doctorEntity);
    	       mv.addObject("payment",0);
        	 System.out.println("appointment not  confirmed bcz payment fail");
    		 return mv; 
    	 }
    	 
     }
       
}
