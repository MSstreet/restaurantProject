package com.encore.demo.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.encore.demo.repository.ReservationDao;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Reservation;
import com.encore.demo.vo.Restaurant;


@Service
public class ReservationService {

	@Autowired
	private ReservationDao dao;
	
	public Reservation saveReservation(Reservation r) {
		return dao.save(r);			
	}
	
	public Reservation getById(int num){
		return dao.findById(num).orElse(null);
	}
	
	public ArrayList<Reservation> getAll(){
		return (ArrayList<Reservation>) dao.findAll();
	}
	
	public ArrayList<Reservation> getByConsumer(String s){
		Member consumer = new Member();
		consumer.setId(s);	
//		return dao.findById(consumer, Sort.by("day").descending().and(Sort.by("time")));
		return dao.findById(consumer, Sort.by("day").and(Sort.by("time")));
	}
	
	//�궇吏쒕퀎 寃��깋
	public ArrayList<Reservation> getByConsumerfindDay(String s, Date day){
		Member consumer = new Member();
		consumer.setId(s);	
		return dao.findByIdAndDay(consumer, day, Sort.by("time"));
	}
	

	public ArrayList<Reservation> getByRestaurant(int restaurant_id){
		Restaurant restaurant = new Restaurant();
		restaurant.setRestaurant_id(restaurant_id);
		return dao.findByRestaurant(restaurant, Sort.by("day").and(Sort.by("time")));
	}
	
	
	public ArrayList<Reservation> getByRestaurantfindDay(int restaurant_id, Date day){
		Restaurant restaurant = new Restaurant();
		restaurant.setRestaurant_id(restaurant_id);
		return dao.findByRestaurantAndDay(restaurant, day, Sort.by("time"));
	}


	public ArrayList<Reservation> getByRestaurantfindId(int restaurant_id, Member id){
		Restaurant restaurant = new Restaurant();
		restaurant.setRestaurant_id(restaurant_id);
		return dao.findByRestaurantAndId(restaurant, id, Sort.by("day").and(Sort.by("time")));
	}


	public void delReservation(int num) {
		dao.deleteById(num);
	}
}
