package com.health.demo.manager;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.health.demo.entity.Register;
import com.health.demo.repository.RegisterRepository;

@Service
public class RegisterManager 
{
	@Autowired
	RegisterRepository rr;
	
	public String saveData(Register r)
	{
		rr.save(r);
		return "Data Inserted Successfully....!";
	}
	public String loginData(String username ,String password)
	{
	  if(rr.existsById(username))
	  {
		  Register r= new Register();
		  r=rr.getById(username);
		  if(r.getPassword().equals(password))
		  {
			  return "Login success";
		  }
	  }
	  return "login failed ";
	}
	public String InsertProfile(Register r, String username)
	{
	      	Register data = rr.findById(username).get();
	      	data.setAddress(r.getAddress());
	      	data.setDob(r.getDob());
	      	data.setGender(r.getGender());
	      	data.setName(r.getName());
	      	data.setPhno(r.getPhno());
	      	data.setPincode(r.getPincode());
	      	data.setState(r.getState());
	      	rr.save(data);
	      	return "Data Inserted";
	}
	public String displayData()
	{
		return toJsonString(rr.findAll());
	}
	
	public String toJsonString(List<Register> r)
	{
		GsonBuilder gb=new GsonBuilder();
		Gson g=gb.create();
		return g.toJson(r);
	}
	public String delete(String username)
	{
		rr.deleteById(username);
		return "Deleted Successfully...!";
	}
	public String update(Register r,String username)
	{
		Register k =rr.findById(username).get();
		k.setName(r.getName());
		k.setEmail(r.getEmail());
		k.setDob(r.getDob());
		k.setGender(r.getGender());
		k.setPhno(r.getPhno());
		k.setAddress(r.getAddress());
		
		k.setState(r.getState());
		k.setPincode(r.getPincode());
		
		rr.save(k);
		return "Updated Successfully...!";
	}
	public String displayUser(String username)
	{
		return toJsonString(rr.findByUsername(username));
	}
	
		public String readEvent(String username)
		  {
		    return JsontoString(rr.findById(username)).toString();
		  }
		  
		  public String JsontoString(Optional<Register> op)
		  {
		    final List<Register> list = op.stream().collect(Collectors.toList());
		    
		      GsonBuilder gb=new GsonBuilder();
		      Gson g=gb.create();
		      return g.toJson(list);
		  }
		  
	public String updatePassword(Register r,String username)
	{
		Register rrr=rr.findById(username).get();
		rrr.setPassword(r.getPassword());
		rr.save(rrr);
		return "Password Updated";
	}
}

