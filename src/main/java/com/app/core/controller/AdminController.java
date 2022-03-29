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

import com.app.core.entity.Contactus;
import com.app.core.entity.HospitalEntity;
import com.app.core.repository.ContactusRepository;
import com.app.core.service.AppointmentService;
import com.app.core.service.DoctorService;
import com.app.core.service.HospitalService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	AppointmentService  appointmentService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
    ContactusRepository contactusRepository;

	@GetMapping("/login")
	public ModelAndView Admin() {
		ModelAndView mv = new ModelAndView("AdmLogin");
		return mv;
	}

	// authenticate admin
	@PostMapping("/AuthentAdmlogin")
	public ModelAndView AuthenticateAdmin(String admUsername, String admPassword, HttpServletRequest req, HttpServletResponse res)  {
		String adminusername = "doctorhub";
		String adminpassword = "doctorhub";
		if ((adminusername.equals(admUsername)) && (adminpassword.equals(admPassword))) {
			ModelAndView mv = new ModelAndView("Admin");
		//	req.getSession().setAttribute(admUsername, adminusername);
			//req.getSession().setAttribute(admPassword, adminpassword);
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("my-admin",1);
			
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("AdmLogin");
			mv.addObject("AdmLogFail", 0);
			HttpSession session=req.getSession();
			session.setAttribute("my-admin",0);
			return mv;
		} 
	}
	
	
	@RequestMapping("/admlogout")
	public ModelAndView logoutAdmin(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView("AdmLogin");
		req.removeAttribute("my-admin");
		req.getSession().invalidate();
		return mv;
	}

	// read all hospital list
	// error while list empty at starting fetch null value
	@GetMapping("/hspList")
	public ModelAndView hspList() {
		ModelAndView mv = new ModelAndView("Admin");
		List<HospitalEntity> hspList = hospitalService.hspList();
		mv.addObject("hspList", hspList);
		mv.addObject("HSPLIST", 1);
		return mv;
	}

	@GetMapping("/addHspOpt")
	public ModelAndView addHspOpt() {
		ModelAndView mv = new ModelAndView("Admin");
		mv.addObject("addHspWindow", 1);
		mv.addObject("hspReg", 2);
		return mv;	
	}

	@PostMapping("/addHsp")
	public ModelAndView addHsp(String hspName, String hspAdd, String hspUsername, String hspPassword) {
		try {
		ModelAndView mv = new ModelAndView("Admin");
		
		//apply internal validation
		String hospName=hspName.trim();
		String hospAdd=hspAdd.trim();
		String hospUsername=hspUsername.trim();
		String hospPassword=hspPassword.trim();
		
		HospitalEntity hospitalEntity = new HospitalEntity(hospName, hospAdd, 0, hospUsername, hospPassword);
		hospitalService.addHsp(hospitalEntity);		
		mv.addObject("addHspWindow", 1);
		mv.addObject("hspReg", 1);
		System.out.println("hospital added successfully in admin dao");
		return mv;
		}
		catch(Exception e) {
			ModelAndView mv = new ModelAndView("Admin");
			mv.addObject("addHspWindow", 1);
			mv.addObject("hspReg", 0);
			System.out.println("doctor not added in admin dao");
			return mv;
		}
	}

	@GetMapping("/deleteHsp")
	public ModelAndView deleteHsp(String id) {
		try {
		ModelAndView mv = new ModelAndView("Admin");		
		List<HospitalEntity> hspList = hospitalService.deleteHsp(id);
		mv.addObject("hspList", hspList);
		mv.addObject("HSPLIST", 1);
		System.out.println("doctor deleted successfully in admin dao");
		mv.addObject("hspdel", 1);		
		return mv;
		}
		catch(Exception e) {
			ModelAndView mv = new ModelAndView("Admin");		
			List<HospitalEntity> hspList = hospitalService.hspList();
			
			mv.addObject("hspList", hspList);
			mv.addObject("HSPLIST", 1);
			
			mv.addObject("hspdel", 0);	
			System.out.println("doctor not deleted in admin dao");
			return mv;
		}
	}

	@GetMapping("/editHspOpt")
	public ModelAndView editHspOpt(String id) {		
		ModelAndView mv = new ModelAndView("Admin");
		HospitalEntity hspOldInfo = hospitalService.editHspOpt(id);
		mv.addObject("hspOldInfo", hspOldInfo);
		mv.addObject("editHspProf", 1);
		mv.addObject("hspprofile", 2);
		return mv;		
	}

	@PostMapping("/updateHsp")
	public ModelAndView updateHsp(String id, String hspName, String hspAdd, String hspUsername, String hspPassword) {
		try {
		ModelAndView mv = new ModelAndView("Admin");
		HospitalEntity hospitalEntity = hospitalService.updateHsp(id, hspName, hspAdd, hspUsername, hspPassword);
		mv.addObject("editHspProf", 1);
		mv.addObject("hspprofile", 1);
		System.out.println("hospital updated successfully in admin dao");
		return mv;
		}
		catch(Exception e){
			ModelAndView mv = new ModelAndView("Admin");
			mv.addObject("editHspProf", 1);
			mv.addObject("hspprofile", 0);
			System.out.println("hospital not updated in admin dao");
			return mv;
		}
	}
	
	@GetMapping("/contactList")
	public ModelAndView contactList(){
		ModelAndView mv=new ModelAndView("Admin");
		List<Contactus> contactList=contactusRepository.findAll();
		mv.addObject("CONTACTLIST", 1);
		mv.addObject("contactList", contactList);
		AdminController adminDao=new AdminController(); 
		mv.addObject("adminDao", adminDao);
		return mv;
		
	}

}
