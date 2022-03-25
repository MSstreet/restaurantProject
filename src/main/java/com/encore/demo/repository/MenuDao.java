package com.encore.demo.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.vo.Menu;
import com.encore.demo.vo.Restaurant;

public interface MenuDao extends JpaRepository<Menu, Integer> {
	
	ArrayList<Menu> findByResid(Restaurant resid);
	ArrayList<Menu> findByMnameLike(String mname);
	
	
}