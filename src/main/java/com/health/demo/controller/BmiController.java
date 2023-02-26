package com.health.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.health.demo.entity.Bmi;
import com.health.demo.manager.BmiManager;

@RestController
@RequestMapping("/api")
public class BmiController 
{
  @Autowired
  BmiManager bm;
  
  @PostMapping("/insert-bmi")
  public String insert(@RequestBody Bmi b)
  {
	return bm.insertData(b);
  }
  
  @GetMapping("/get")
  public String getData()
  {
	  return bm.GetData();
  }
  
}
