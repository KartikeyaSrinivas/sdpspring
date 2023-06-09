package com.health.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.health.demo.entity.Register;
@Repository
public interface RegisterRepository  extends JpaRepository<Register, String>
{
	List<Register> findByUsername(String username);
}