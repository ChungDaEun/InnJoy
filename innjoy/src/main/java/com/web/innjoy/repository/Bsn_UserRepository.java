package com.web.innjoy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.web.innjoy.model.Bsn_User;

import jakarta.transaction.Transactional;

public interface Bsn_UserRepository extends JpaRepository<Bsn_User,String>{
	
	// 사업자 아이디, 사업자 패스워드
	Bsn_User findByBsnIdAndBsnPass(String bsn_id, String bsn_pass);
	
	// 사업자 이름, 사업자 전화번호
	Bsn_User findByCeoNameAndBsnPhone(String ceo_name, String bsn_phone);
	
	// 사업자 아이디, 사업자 전화번호
	Bsn_User findByBsnIdAndBsnPhone(String bsn_id, String bsn_phone);
	
	// bsn Id
	@Query(value="Select count(*) from Bsn_User bu where bu.bsn_id = :bsnId", nativeQuery = true)
	int ckBsnId(String bsnId);
	
	// 비밀번호 재설정
	@Transactional
	@Modifying
	@Query(value="Update Bsn_User bu set bu.bsn_pass = :bsnPass where bu.bsn_id = :bsnId", nativeQuery = true)
	int changePass(String bsnPass, String bsnId);
}