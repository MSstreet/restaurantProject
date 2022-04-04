package com.encore.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.encore.demo.repository.ConsumerRateDao;
import com.encore.demo.vo.ConsumerRate;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Restaurant;

@Service
public class ConsumerRateService {
	@Autowired
	private ConsumerRateDao dao;
	
	// 후기 작성
	public ConsumerRate saveConsumerRate(ConsumerRate c) {
		return dao.save(c);
	}
	// 가게별 전체 후기 목록
	// 후기 키워드로 검색(선택)
	
	// 내가 쓴 전체 후기 목록
	// 후기 수정
	// 후기 삭제
	
	// 가게별 후기목록
	// 날짜 오름차순
	public ArrayList<ConsumerRate> getByRestaurantOrderByWdate(Restaurant restaurant) {
		return dao.findByRestaurantOrderByWdate(restaurant);
	}
	
	// 날짜 내림차순
	public ArrayList<ConsumerRate> getByRestaurantOrderByWdateDesc(Restaurant restaurant) {
		return dao.findByRestaurantOrderByWdateDesc(restaurant);
	}
	
	// 평점 오름차순
	public ArrayList<ConsumerRate> getByRestaurantOrderByRate(Restaurant restaurant) {
		return dao.findByRestaurantOrderByRate(restaurant);
	}
	
	// 평점 내림차순
	public ArrayList<ConsumerRate> getByRestaurantOrderByRateDesc(Restaurant restaurant) {
		return dao.findByRestaurantOrderByRateDesc(restaurant);
	}
	
	// 아이디로 검색
	public ArrayList<ConsumerRate> getById(Member id) {
		return dao.findById(id);
	}
	
	public void delConsumerRate(int rev_num) {
		dao.deleteById(rev_num);
	}
	
	public ConsumerRate getConsumerRate(int rev_num) {
		return dao.findById(rev_num).orElse(null);
	}
	
	//평점 평균 구하는 기능
	public float getAvgByRestaurant(Restaurant restaurant) {
		ArrayList<ConsumerRate> rates = dao.findByRestaurantOrderByRate(restaurant);
		int cnt = rates.size();
		float sum = 0;
		for(ConsumerRate r: rates) {
			sum += r.getRate();
		}
		return sum/cnt;
	}
}