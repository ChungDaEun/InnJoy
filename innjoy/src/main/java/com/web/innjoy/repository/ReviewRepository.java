package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.innjoy.model.Reservation;
import com.web.innjoy.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
   
   // 리뷰 리스트
   List<Review> findByReservation(Reservation res);
   
   // 리뷰 작성 여부 확인
   @Query(value="Select count(*) from REVIEW rv where rv.reservation_id = :resId", nativeQuery = true)
   int ckReview(int resId);
}