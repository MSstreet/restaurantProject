package com.encore.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.encore.demo.repository.RestaurantDao;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Restaurant;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantDao dao;
	
	
		public Restaurant saveRestaurant(Restaurant r) {
			System.out.println(r);
			return dao.save(r);
		}
	
		public ArrayList<Restaurant> getAll(){
			return (ArrayList<Restaurant>) dao.findAll();
		}
		
		public Restaurant getByRestaurant_id(int num) {
			return dao.findById(num).orElse(null);
		}
		
		public ArrayList<Restaurant> getByWriter(Member writer){
			return dao.findById(writer);
		}
		
		public  ArrayList<Restaurant> getByName(String rn){
			return dao.findByRestaurantName(rn);
		}
			
		public ArrayList<Restaurant> getByAddrAndCategory(String addr, String category, String restauranttype){
			return dao.findByAddrLikeAndCategoryLikeAndRestauranttypeLike(addr, "%" + category + "%", restauranttype);
		}
		
		public void delRestaurant(int num){
			dao.deleteById(num);
		}
		
		 public  ArrayList<Restaurant> getByNameLike(String rn){
				return dao.findByRestaurantNameLike("%"+rn+"%");
			}
		
		 public void cntUpUpdate(int r_id) {
				dao.updateUpCnt(r_id);
			}
		 
		 public void cntDownUpdate(int r_id) {
				dao.updateDownCnt(r_id);
			}
		 
	
}
