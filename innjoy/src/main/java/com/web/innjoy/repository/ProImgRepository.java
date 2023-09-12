package com.web.innjoy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Pro_Img;

public interface ProImgRepository extends JpaRepository<Pro_Img, Integer>{
	
	Pro_Img save(Pro_Img pi);
}
