/**
 * 
 */
package com.fpt.springmongo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpt.springmongo.model.User;
import com.fpt.springmongo.repositories.UserRepository;

/**
 * @author Sunshine Cotejo
 *
 */
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository repository;
	
	@Override
	public List<User> getUsers() {
		return repository.findAll();
	}
	
}
