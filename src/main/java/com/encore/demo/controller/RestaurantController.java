package com.encore.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Map;

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

import com.encore.demo.service.ConsumerRateService;
import com.encore.demo.service.MenuService;
import com.encore.demo.service.RestaurantService;
import com.encore.demo.vo.Menu;
import com.encore.demo.vo.Restaurant;
import com.encore.demo.vo.OwnerBoard;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

	@Autowired
	private RestaurantService service;
	private String path = "C:\\img\\restaurant\\";

	
	@Autowired
	private MenuService service1;
	
	@Autowired
	private ConsumerRateService service2;
	
	
	@GetMapping("/detail/{restaurant_id}")
	public String detailForm(@PathVariable("restaurant_id")int num, Map map) {
		Restaurant r = service.getByRestaurant_id(num);
		map.put("r", r);
		String jpath = "restaurant/detail_c";
		return jpath;
	}
	
	//���� ���� �������� - 1.���� 2.���� ����
	@GetMapping("/detail/{type}/{restaurant_id}")
	public String detail(@PathVariable("type") int type, @PathVariable("restaurant_id")int num, Map map, Map map1) {
		//ArrayList<Restaurant> list1 = service.getAll();
		Restaurant r = service.getByRestaurant_id(num); 
		ArrayList<Menu> list = service1.getByRestaurantId(r);	
		float avg =  service2.getAvgByRestaurant(r);
		r.setConsumerRate(avg);
		map.put("r", r);
		map1.put("list", list);
		//map2.put("list1", list1);
		String jpath = "restaurant/";
		
		if (type == 1) {
			jpath += "detail_c";
		} else if (type == 2) {
			jpath += "detail_o";
		}
		return jpath;
	}
	
	@GetMapping("/readimg/{fname}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname) {
		File f = new File(path + fname);// C:\\img\\shop\\fname
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));// ����Ÿ��
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	@PostMapping("/edit/{restaurant_id}")
	public String edit(@PathVariable("restaurant_id")int restaurant_id,Restaurant r) {
		Restaurant rr = service.getByRestaurant_id(restaurant_id);
		rr.setAddr(r.getAddr());
		rr.setCategory(r.getCategory());
		rr.setContents(r.getContents());
		rr.setDetailAddr(r.getDetailAddr());
		rr.setMenutype(r.getMenutype());
		rr.setOper_time(r.getOper_time());
		service.saveRestaurant(rr);
		return "redirect:/member/main/2";
	}
	
	
	
	//���� - ���� �� ��� ��
	@GetMapping("/write")
	public void writeForm() {}
	
	//���� - ���� �� ��� �Ϸ�
	@PostMapping("/write")
	public String write(Restaurant r) {
		Restaurant r2 = service.saveRestaurant(r);
		
		MultipartFile file = r.getFile();
		String ori_fname = file.getOriginalFilename();
		int idxOfLastDot = ori_fname.lastIndexOf(".");
		String fname = r2.getRestaurant_id() + ori_fname.substring(idxOfLastDot);
		try {
			file.transferTo(new File(path + fname));
			r2.setR_img(fname);
			service.saveRestaurant(r2);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/member/main/2";
	}
	
	// ���� ����
	@GetMapping("/del/{restaurant_id}")
	public String del(@PathVariable("restaurant_id")int restaurant_id) {
		service.delRestaurant(restaurant_id);
		return "redirect:/member/main/2";
	}


		
	// �ּ�+ī�װ��� �˻�
		@RequestMapping("/getByAddrAndCategory")
		public String getByAddrAndCategory(String addr,String category, String restauranttype, String menutype, Map map) {
			ArrayList<Restaurant> list = service.getByAddrAndCategory(addr, category, restauranttype);
			map.put("list", list);
			return "member/index";
		}
	// �޴��� �˻�
	
	
	
}
