package com.encore.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.encore.demo.service.Consumer_rateService;
import com.encore.demo.service.MemberService;
import com.encore.demo.service.ReservationService;
import com.encore.demo.service.RestaurantService;
import com.encore.demo.vo.Consumer_rate;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Reservation;
import com.encore.demo.vo.Restaurant;

@Controller
@RequestMapping("/consumer_rate")
public class Consumer_rateController {
	
	@Autowired
	private Consumer_rateService service;
	
	@Autowired
	private RestaurantService service1;
	
	@Autowired
	private ReservationService service2;
	
	@Autowired
	private MemberService service3;
	
	private String path = "C:\\img\\consumer_rate";
	
	
	@GetMapping("/write/{rev_num}")
	public String writeForm(@PathVariable("rev_num") int rev_num, HttpSession session, Map map) {
		Reservation rs = service2.getById(rev_num);
		
		map.put("rs", rs);
		return "consumer_rate/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session, Consumer_rate c) {
		Consumer_rate c1 = service.saveConsumer_rate(c);
		String loginid = (String)session.getAttribute("loginid");
		
		MultipartFile file = c.getFile();
		String ori_fname = file.getOriginalFilename();
		int idxOfLastDot = ori_fname.lastIndexOf(".");
		String fname = c1.getC_num() + ori_fname.substring(idxOfLastDot);
		try {
			file.transferTo(new File(path + fname));
			c1.setC_img(fname);
			service.saveConsumer_rate(c1);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/reservation/myorders";
	}
	
	@GetMapping("/read_img/{fname}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname) {
		File f = new File(path + fname);// 타겟 파일
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));// 마임타입
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
		
	@GetMapping("/list/{restaurant_id}")
	public String list(@PathVariable("restaurant_id") int restaurant_id, Map map) {
		Restaurant r = service1.getByRestaurant_id(restaurant_id);
		ArrayList<Consumer_rate> list = service.getByRestaurantOrderByWdateDesc(r);
		map.put("list", list);
		return "consumer_rate/list";
	}
	
	@GetMapping("/list/{restaurant_id}/rate")
	public String ratelist(@PathVariable("restaurant_id") int restaurant_id, Map map) {
		Restaurant r = service1.getByRestaurant_id(restaurant_id);
		ArrayList<Consumer_rate> list = service.getByRestaurantOrderByWdateDesc(r);
		map.put("list", list);
		return "consumer_rate/list";
	}
	
	@GetMapping("/mylist")
	public String list(HttpSession session, Map map) {
		String loginid = (String)session.getAttribute("loginid");
		Member id = service3.getMember(loginid);
		ArrayList<Consumer_rate> list = service.getById(id);
		map.put("list", list);
		return "consumer_rate/mylist";
	}
	
	@GetMapping("/del/{c_num}")
	public String del(@PathVariable("c_num") int c_num) {
		service.delConsumer_rate(c_num);
		return "redirect:/consumer_rate/mylist";
	}
	
	@GetMapping("/edit/{c_num}")
	public String editForm(@PathVariable("c_num") int c_num, HttpSession session, Map map) {
		Consumer_rate c = service.getConsumer_rate(c_num);
		map.put("c", c);
		return "consumer_rate/edit";
	}
	
	@PostMapping("/edit")
	public String edit(HttpSession session, Consumer_rate c) {
		Consumer_rate cc = service.getConsumer_rate(c.getC_num());
		c.setWdate(cc.getWdate());
		service.saveConsumer_rate(c);
		String loginid = (String)session.getAttribute("loginid");
		return "redirect:/consumer_rate/mylist";
	}
}