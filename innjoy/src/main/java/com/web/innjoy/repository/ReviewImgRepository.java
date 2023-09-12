package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Review_Img;

import jakarta.transaction.Transactional;

public interface ReviewImgRepository extends JpaRepository<Review_Img, Integer>{
	
	Review_Img save(Review_Img ri);
	
	// 리뷰 아이디로 이미지 리스트 불러오기
	List<Review_Img> findByReviewId(int reviewId);
	
	// 리뷰 아이디로 이미지 삭제하기
	@Transactional
	void deleteByReviewId(int reviewId);
}
