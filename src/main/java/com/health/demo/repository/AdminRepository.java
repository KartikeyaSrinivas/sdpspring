package com.health.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.health.demo.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, String>
{

}
