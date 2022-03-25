package com.encore.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.encore.demo.service.MemberService;
import com.encore.demo.service.ReservationService;
import com.encore.demo.service.RestaurantService;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Reservation;
import com.encore.demo.vo.Restaurant;


@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@Autowired
	private RestaurantService service1;
	
	@Autowired
	private MemberService service2;
	
	
	//�ϱ� ���� ���� ���� ���� ���� ���� �޾ƾ� //������� ���� �޾Ƽ� �����ؼ� map���� �����ϴ��ڵ� �߰� ���� �ʿ�
	@GetMapping("/add/{restaurant_id}")
	public String addForm(@PathVariable("restaurant_id") int restaurant_id, Map map) {
		Restaurant restaurant = new Restaurant();
		Reservation reservation = new Reservation();
		// id�� restaurant �ڷ����
		restaurant = service1.getByRestaurant_id(restaurant_id);
		reservation.setRestaurant(restaurant);
		map.put("r", reservation);
		service1.cntUpUpdate(restaurant_id);
		return "reservation/add";
	}
	
	@PostMapping("/add")
	public String add(Reservation r) {
		service.saveReservation(r);
		return "redirect:/reservation/myorders";
	}
	
	@GetMapping("/myorders")
	public void myorders(HttpSession session, Map map) {
		String loginid = (String)session.getAttribute("loginid");
		ArrayList<Reservation> list = service.getByConsumer(loginid);
		map.put("list", list);
	}
	
	@GetMapping("/gotolist/{restaurant_id}")
	public String gotolist(@PathVariable("restaurant_id") int restaurant_id, HttpSession session, Map map, Map map1) {
		String loginid = (String)session.getAttribute("loginid");
		Member id = service2.getMember(loginid);
		String path = "reservation/";
		if (id.getType() == 1) {
			ArrayList<Reservation> list = service.getByConsumer(loginid);
			map.put("list", list);
			path += "myorders";
		} else if (id.getType() == 2) {
			Restaurant r = service1.getByRestaurant_id(restaurant_id);
			ArrayList<Reservation> list = service.getByRestaurant(restaurant_id);
			map.put("list", list);
			map1.put("r", r);
			path += "/restaurantorders";
		}
		return path;
	}
	
	@GetMapping("/detail/{rev_num}")
	public String detail(@PathVariable("rev_num") int rev_num, HttpSession session, Map map) {
		Reservation r = service.getById(rev_num);
		map.put("r", r);
		return "reservation/detail";
	}
	
	@GetMapping("/edit/{rev_num}")
	public String editForm(@PathVariable("rev_num") int rev_num, HttpSession session, Map map) {
		Reservation r = service.getById(rev_num);
		map.put("r", r);
		return "reservation/edit";
	}
	
	@PostMapping("/edit")
	public String edit(Reservation r, Map map) {
		service.saveReservation(r);
		map.put("r", r);
		return "reservation/detail";
	}
	
	@GetMapping("/del/{rev_num}")
	public String del(@PathVariable("rev_num") int rev_num) {
		Reservation rs = service.getById(rev_num);
		service1.cntDownUpdate(rs.getRestaurant().getRestaurant_id());
		service.delReservation(rev_num);
		return "redirect:/reservation/myorders";
	}
	
	@GetMapping("/{restaurant_id}/restaurantorders")
	public String restaurantorders(@PathVariable("restaurant_id") int restaurant_id, Map map, Map map1) {
		// ���� ��¥ ��� ������ ���� �� �ִ��� Ȯ�� �ʿ�
		Restaurant r = service1.getByRestaurant_id(restaurant_id);
		ArrayList<Reservation> list = service.getByRestaurant(restaurant_id);
		map.put("list", list);
		map1.put("r", r);
		return "reservation/restaurantorders";
	}
	
	@GetMapping("/finddaymyorders")
	public String finddaymyorders(Date day, HttpSession session, Map map) {
		String loginid = (String)session.getAttribute("loginid");
		ArrayList<Reservation> list = service.getByConsumerfindDay(loginid, day);
		map.put("list", list);
		return "reservation/myorders";
	}
	
	@GetMapping("/{restaurant_id}/finddayrestaurantorders")
	public String finddayrestaurantorders(@PathVariable("restaurant_id") int restaurant_id, Date day, HttpSession session, Map map) {
		String loginid = (String)session.getAttribute("loginid");
		ArrayList<Reservation> list = service.getByRestaurantfindDay(restaurant_id, day);
		map.put("list", list);
		return "reservation/restaurantorders";
	}
	
	@PostMapping("/{restaurant_id}/findnametoid")
	public String findnametoid(@PathVariable("restaurant_id") int restaurant_id, String name, Map map, Map map1) {
		ArrayList<Member> list = service2.getByName(name);
		map.put("list", list);
		map1.put("r_id", restaurant_id);
		return "reservation/findnametoid";
	}
	
	@PostMapping("/findnametorestaurant")
	public String findnametoid(HttpSession session, String rname, Map map) {
		ArrayList<Restaurant> list = service1.getByNameLike(rname);
		map.put("list", list);
		return "reservation/findnametorestaurant";
	}
	
	@GetMapping("/{r_id}/{id}/searchrnamefindreservation")
	public String searchrnamefindreservation(@PathVariable("r_id") int r_id, @PathVariable("id") String id, Map map) {
		Member m = new Member();
		m.setId(id);
		ArrayList<Reservation> list = service.getByRestaurantfindId(r_id, m);
		map.put("list", list);
		return "reservation/restaurantorders";
	}
	
	@GetMapping("/{r_id}/{id}/searchnamefindreservation")
	public String searchnamefindreservation(@PathVariable("r_id") int r_id, @PathVariable("id") String id, Map map) {
		Member m = new Member();
		m.setId(id);
		ArrayList<Reservation> list = service.getByRestaurantfindId(r_id, m);
		map.put("list", list);
		return "reservation/myorders";
	}
}