package com.proj.main.review.dao;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.review.dto.ReviewDTO;

@Mapper
public interface IReviewDAO {

	int insertReview(ReviewDTO review);
	
}
