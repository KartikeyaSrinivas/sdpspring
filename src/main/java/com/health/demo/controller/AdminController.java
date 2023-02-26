package com.health.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.health.demo.manager.AdminManager;
@RestController
@RequestMapping("/api")
public class AdminController 
{

	@Autowired
	AdminManager am;
	
	@PostMapping("/login-check/{username}/{password}")
	public String loginData(@PathVariable("username") String username, @PathVariable("password") String password)
	{
		return am.loginData(username, password);
	}
}
