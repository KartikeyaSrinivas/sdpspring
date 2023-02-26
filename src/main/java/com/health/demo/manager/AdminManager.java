package com.health.demo.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.demo.entity.Admin;
import com.health.demo.repository.AdminRepository;

@Service
public class AdminManager 
{
	@Autowired
	AdminRepository ar;

	public String loginData(String username, String password) {
		if(ar.existsById(username))
		  {
			  Admin a= new Admin();
			  a=ar.getById(username);
			  if(a.getPassword().equals(password))
			  {
				  return "Login success";
			  }
		  }
		  return "login failed ";
	}
	
	

}
