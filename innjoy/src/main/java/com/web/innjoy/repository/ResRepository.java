package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Reservation;

public interface ResRepository extends JpaRepository<Reservation, Integer>{
	
	// user 엔티티로 내 예약 리스트 가져오기
	List<Reservation> findByIjUser(Ij_User user);
	
	// reservation Id로 예약 가져오기
	Reservation findByReservationId(int resId);
}
