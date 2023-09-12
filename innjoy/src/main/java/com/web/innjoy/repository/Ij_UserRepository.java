package com.web.innjoy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.web.innjoy.model.Ij_User;

import jakarta.transaction.Transactional;

// DAO, 자동으로 bean 등록이 됨
public interface Ij_UserRepository extends JpaRepository<Ij_User, String>{

	// 로그인 - 유저 아이디, 유저 패스워드
	Ij_User findByUserIdAndUserPass(String user_id, String user_pass);
	
	// 아이디찾기 - 유저 이름, 유저 전화번호
	Ij_User findByUserNameAndUserPhone(String user_name, String user_phone);
	
	// 비밀번호 찾기 - 유저 아이디, 유저 전화번호
	Ij_User findByUserIdAndUserPhone(String user_id, String user_phone);
	
	// 아이디 중복확인
	@Query(value="Select count(*) from Ij_User ij where ij.user_id = :userId", nativeQuery = true)
	int ckId(String userId);
	
	// 비밀번호 재설정
	@Transactional
	@Modifying
	@Query(value="Update Ij_User ij set ij.user_pass = :userPass where ij.user_id = :userId", nativeQuery = true)
	int changePass(String userPass, String userId);
}
