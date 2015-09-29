package com.fpt.springmongo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fpt.springmongo.repositories.UserRepository;
import com.fpt.springmongo.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView helloWorld( ModelMap model ) {
		List users = userService.getUsers();
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("users", users );
		return modelAndView;
	}
	
	
}
