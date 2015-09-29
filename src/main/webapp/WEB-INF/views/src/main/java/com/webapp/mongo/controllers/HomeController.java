package com.webapp.mongo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.mongo.models.Employee;
import com.webapp.mongo.repositories.EmployeeRepository;

@Controller
public class HomeController {

	@Autowired
	private EmployeeRepository repository;

	@Autowired
	HttpSession httpSession;

//	@RequestMapping(value = "/add", method = RequestMethod.POST)
//	@ResponseBody
//	public Employee addEmployee(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
//			@RequestParam("age") String age, @RequestParam("department") String department) {
//		Employee employee = repository.save(new Employee(firstName, lastName, Integer.parseInt(age), department));
//		return employee;
//	}

	@RequestMapping(value = "/save")
	@ResponseBody
	public Employee updateEmployee(@RequestParam("id") String id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("age") String age,
			@RequestParam("department") String department) {
		
		if ("null".equals(id))
			return repository.save(new Employee(firstName, lastName, Integer.parseInt(age), department));
		
		Employee employee = repository.findOne(id);
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setAge(Integer.parseInt(age));
		employee.setDepartment(department);		
		return repository.save(employee);
	}
	
	@RequestMapping(value = "/read")
	@ResponseBody
	public Employee readEmployee(@RequestParam("id") String id){
		return repository.findOne(id);
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public Employee deleteEmployeeById(@RequestParam("id") String id) {
		Employee employee = repository.findOne(id);
		repository.delete(employee);
		return employee;
	}

	@RequestMapping(value = "/home")
	public String home() {
		List<Employee> listEmployees = repository.findAll();
		httpSession.setAttribute("listEmployees", listEmployees);
		return "home";
	}
}

/*
 * // fetch all customers System.out.println("Customers found with findAll():");
 * System.out.println("-------------------------------"); for (Customer customer
 * : repository.findAll()) { System.out.println(customer); }
 * System.out.println();
 * 
 * // fetch an individual customer System.out.println(
 * "Customer found with findByFirstName('Alice'):");
 * System.out.println("--------------------------------");
 * System.out.println(repository.findByFirstName("Alice"));
 * 
 * System.out.println("Customers found with findByLastName('Smith'):");
 * System.out.println("--------------------------------"); for (Customer
 * customer : repository.findByLastName("Smith")) {
 * System.out.println(customer); }
 */
