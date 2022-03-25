package com.encore.demo.repository;

import java.util.ArrayList;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.encore.demo.vo.Member;
import com.encore.demo.vo.Restaurant;

public interface RestaurantDao extends JpaRepository<Restaurant, Integer> {
	
	

	ArrayList<Restaurant> findById(Member writer);
	

	ArrayList<Restaurant> findByRestaurantName(String Restaurant);
	

	ArrayList<Restaurant> findByAddrLikeAndCategoryLikeAndRestauranttypeLike(String addr, String category, String restauranttype);
	
	
	ArrayList<Restaurant> findByRestaurantNameLike(String Restaurant);
	
	//cnt 추가 부분
		@Transactional // 트랜젝션 커밋
		@Modifying // 검색이 아닌 쓰기작업 // 쿼리문 상세 설정
		@Query(value="update Restaurant set cnt=cnt+1 where restaurant_id=:restaurant_id") // 다운로드 진행시 카운트 증가
		void updateUpCnt(@Param("restaurant_id") int restaurant_id);
		
		@Transactional // 트랜젝션 커밋
		@Modifying // 검색이 아닌 쓰기작업 // 쿼리문 상세 설정
		@Query(value="update Restaurant set cnt=cnt-1 where restaurant_id=:restaurant_id") // 다운로드 진행시 카운트 증가
		void updateDownCnt(@Param("restaurant_id") int restaurant_id);
}
