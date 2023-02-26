package com.health.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.health.demo.entity.Bmi;

@Repository
public interface BmiRepository extends JpaRepository<Bmi,Long>
{
	
}
