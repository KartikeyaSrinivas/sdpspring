package com.health.demo.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.health.demo.entity.Register;
import com.health.demo.manager.RegisterManager;
@RestController
@RequestMapping("/api")
public class RegisterController 
{
	@Autowired
	RegisterManager rm;
	@PostMapping("/insert")
	public String insertData(@RequestBody Register r)
	{
		return rm.saveData(r);
	}
	@PostMapping("/login/{username}/{password}")
	public String loginData(@PathVariable("username") String username, @PathVariable("password") String password)
	{
		return rm.loginData(username, password);
	}
	@PutMapping("/profile/{username}")
	public String insertprofile(@RequestBody Register r, @PathVariable("username") String username)
	{
		return rm.InsertProfile(r, username);
	}
	
	@GetMapping("/display")
	public String displayData()
	{
		return rm.displayData();
	}
	
	@DeleteMapping("/kartik/del/{username}")
	public String deleteData(@PathVariable("username") String username)
	{
		return rm.delete(username);
	}
	
	@GetMapping("karthik/dis/{username}")
	public String displayData(@PathVariable("username") String username)
	{
		return rm.displayUser(username);
	}

	@PutMapping("karthik/up/{username}")
	public String updateData(@RequestBody Register r,@PathVariable("username") String username)
	{
		return rm.update(r, username);
	}
	
	@GetMapping("karthik/display/{username}")
	public String readRole(@PathVariable("username") String username)
	{
		return rm.readEvent(username);
	}
    
	
	@PutMapping("/update/password/{username}")
	public String updateKarthekeya(@RequestBody Register r, @PathVariable("username") String username)
	{
		return rm.updatePassword(r, username).toString();
	}
}