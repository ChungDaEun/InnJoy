package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Board_Img;
import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Reservation;
import com.web.innjoy.model.Review_Img;

public interface RecommRepository extends JpaRepository<Recomm, Integer>{

	// 나의 게시물 리스트
	List<Recomm> findByReservation(Reservation res);

	Board_Img save(Board_Img bi);
	
}
