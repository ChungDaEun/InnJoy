package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Recomm_comm;

public interface Recomm_CommRepository extends JpaRepository<Recomm_comm, Integer> {

	// 나의 댓글 리스트
	List<Recomm_comm> findByIjUser(Ij_User user);
	
	// 게시물에 달린 댓글 리스트 recomId로 불러오기
	List<Recomm_comm> findByRecomId(int recommId);
}
