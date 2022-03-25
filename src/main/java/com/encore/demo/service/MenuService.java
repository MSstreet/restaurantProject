package com.encore.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.encore.demo.repository.MenuDao;
import com.encore.demo.vo.Menu;
import com.encore.demo.vo.Restaurant;

@Service
public class MenuService {
	
	@Autowired
	private MenuDao dao;
	

	public Menu saveMenu(Menu m) {
		return dao.save(m);
	}
	

	public ArrayList<Menu> getAll(int m){
		Restaurant resid = new Restaurant();
		resid.setRestaurant_id(m);
		return (ArrayList<Menu>) dao.findByResid(resid);
	}
	
	public Menu getMenu(int m_num) {
		return dao.findById(m_num).orElse(null);
	}
	

	public void delMenu(int id) {
		dao.deleteById(id);
	}
	

	public ArrayList<Menu> getByName(String mname){
		return dao.findByMnameLike("%"+mname+"%");
	}
	
	public ArrayList<Menu> getByRestaurantId(Restaurant rid){
		return dao.findByResid(rid);
	}
}