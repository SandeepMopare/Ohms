package com.app.core.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.core.entity.Contactus;
import com.app.core.entity.DoctorEntity;
import com.app.core.entity.HospitalEntity;
import com.app.core.repository.ContactusRepository;
import com.app.core.service.DoctorService;
import com.app.core.service.HospitalService;

@Controller
@RequestMapping("/")
public class NavbarAction {

	@Autowired
	ContactusRepository contactusRepository;

	@Autowired
	DoctorService doctorService;

	@Autowired
	HospitalService hospitalService;

	@GetMapping("home")
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("Home");

		return mv;
	}

	@RequestMapping("hospitalList")
	public ModelAndView viewHomePage(@Param("keyword") String keyword) {
		ModelAndView mv = new ModelAndView("HospitalList");
		List<HospitalEntity> hospitallist = hospitalService.listAll(keyword);
		mv.addObject("hospitallist", hospitallist);
		mv.addObject("keyword", keyword);
		System.out.println(keyword);

		if (hospitallist.size() == 0) {
			mv.addObject("noresult", 0);

		}
		return mv;
	}

	@GetMapping("doctorlist")
	public ModelAndView showdoctlist(String hspid) {
		// int hospid=Integer.parseInt(hspid);
		HospitalEntity hospital = hospitalService.getHospital(hspid);
		List<DoctorEntity> drList = hospital.getDoctorList();
		ModelAndView mv = new ModelAndView("doctorlist");
		mv.addObject("hospital", hospital);
		mv.addObject("drList", drList);
		return mv;
	}

	@GetMapping("searchOpt")
	public ModelAndView ddd() {
		ModelAndView mv = new ModelAndView("searchOpt");
		return mv;
	}

	@GetMapping("aboutus")
	public ModelAndView aboutus() {
		ModelAndView mv = new ModelAndView("AboutUs");
		return mv;
	}

	@GetMapping("contactus")
	public ModelAndView contactus() {
		ModelAndView mv = new ModelAndView("contact");
		return mv;
	}

	@PostMapping("createcont")
	public ModelAndView createcont(Contactus contactus) {
		Date now = new Date();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String mysqlDateString = formatter.format(now);
		String ctDate = mysqlDateString;

		contactus.setCtDate(ctDate);
		ModelAndView mv = new ModelAndView("contact");
		contactusRepository.save(contactus);
		mv.addObject("contdone", 1);
		return mv;
	}

}
