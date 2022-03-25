package com.encore.demo.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.vo.Consumer_rate;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Restaurant;

public interface Consumer_rateDao extends JpaRepository<Consumer_rate, Integer> {
	
	// 오래된순
	ArrayList<Consumer_rate> findByRestaurantOrderByWdate(Restaurant restaurant);
	
	// 최신순
	ArrayList<Consumer_rate> findByRestaurantOrderByWdateDesc(Restaurant restaurant);
	
	// 평점낮은순
	ArrayList<Consumer_rate> findByRestaurantOrderByRate(Restaurant restaurant);
	
	// 평점높은순
	ArrayList<Consumer_rate> findByRestaurantOrderByRateDesc(Restaurant restaurant);
	
	// 아이디로 검색
	ArrayList<Consumer_rate> findById(Member id);
}