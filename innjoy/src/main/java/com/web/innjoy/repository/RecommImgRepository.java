package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Board_Img;

import jakarta.transaction.Transactional;

public interface RecommImgRepository extends JpaRepository<Board_Img, Integer>{
	
	// recommId로 게시물 이미지 리스트 불러오기
	List<Board_Img> findByRecomId(int recommId);
	
	@Transactional
	void deleteByRecomId(int recommId);
}
