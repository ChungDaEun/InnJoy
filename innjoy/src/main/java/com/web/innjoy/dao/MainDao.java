package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.innjoy.vo.MainProduct_p;
import com.web.innjoy.vo.MainReview_r;
import com.web.innjoy.vo.MainRecomm_r;

@Mapper
public interface MainDao {
	public List<MainProduct_p> getMainproductList();
	public List<MainRecomm_r> getMainreviewList();
	public List<MainReview_r> getMainrecommList();
}
