package com.proj.main.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.review.dao.IReviewDAO;
import com.proj.main.review.dto.ReviewDTO;

@Service
public class ReviewService {

	@Autowired
	IReviewDAO dao;
	
	public int insertReview(ReviewDTO review) {
		int result = dao.insertReview(review);
		return result;
	}
}
