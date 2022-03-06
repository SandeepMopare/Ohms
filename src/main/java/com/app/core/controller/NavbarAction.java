package com.app.core.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class NavbarAction {

	@GetMapping("home")
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("Home");

		return mv;
	}

}
