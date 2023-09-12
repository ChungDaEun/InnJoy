package com.web.innjoy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, String>{
	
	// 관리자 아이디, 관리자 패스워드
	Admin findByAdmIdAndAdmPass(String adm_id, String adm_pass);
}
