package com.health.demo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.health.demo.entity.Bmi;
import com.health.demo.repository.BmiRepository;

@Service

public class BmiManager 
{
	@Autowired
	BmiRepository br;
	
	public String insertData(Bmi b)
	{
		br.save(b);
		return "data inserted successfully";
	}
	public String GetData()
	{
		return toJsonString(br.findAll());
	}
	public String toJsonString(List<Bmi> list)
	  {
	    GsonBuilder gb=new GsonBuilder();
	    Gson g=gb.create();
	    return g.toJson(list);
	  }
}
