package com.encore.demo.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.vo.ConsumerRate;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Restaurant;

public interface ConsumerRateDao extends JpaRepository<ConsumerRate, Integer> {
		// 오래된순
		ArrayList<ConsumerRate> findByRestaurantOrderByWdate(Restaurant restaurant);
		
		// 최신순
		ArrayList<ConsumerRate> findByRestaurantOrderByWdateDesc(Restaurant restaurant);
		
		// 평점낮은순
		ArrayList<ConsumerRate> findByRestaurantOrderByRate(Restaurant restaurant);
		
		// 평점높은순
		ArrayList<ConsumerRate> findByRestaurantOrderByRateDesc(Restaurant restaurant);
		
		// 아이디로 검색
		ArrayList<ConsumerRate> findById(Member id);
}
