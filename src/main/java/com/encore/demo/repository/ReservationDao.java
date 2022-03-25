package com.encore.demo.repository;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.vo.Member;
import com.encore.demo.vo.Reservation;
import com.encore.demo.vo.Restaurant;

public interface ReservationDao extends JpaRepository<Reservation, Integer> {

	
	ArrayList<Reservation> findById(Member id, Sort sort);
	
	ArrayList<Reservation> findByRestaurant(Restaurant restaurant, Sort sort);
	
	// 날짜 시간 동시 정렬
//	ArrayList<Reservation> findByIdOrderByDay(Member id);
	
//	ArrayList<Reservation> findByRestaurantOrderByDay(Restaurant restaurant);
	
//	@Query(value="select rev_num, day, rev_cnt, time, Reservation.id, Restaurant from Reservation where id=:id order by day, time")
//	ArrayList<Reservation> selectById(@Param("id") String id);
	
	ArrayList<Reservation> findByRestaurantAndDay(Restaurant restaurant, Date day, Sort sort);
	
	ArrayList<Reservation> findByRestaurantAndId(Restaurant restaurant, Member id, Sort sort);
	
	ArrayList<Reservation> findByIdAndDay(Member id, Date day, Sort sort);

}
