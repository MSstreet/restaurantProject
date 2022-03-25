package com.encore.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
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

import com.encore.demo.service.MemberService;
import com.encore.demo.service.MenuService;
import com.encore.demo.service.RestaurantService;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Menu;
import com.encore.demo.vo.Restaurant;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService service;
	
	@Autowired
	private RestaurantService service1;
	
	@Autowired
	private MemberService service2;
	
	
	// 메뉴 사진 저장 폴더 생성 필요
	private String path = "C:\\img\\menu\\";
	
	@GetMapping("/{restaurant_id}/add")
	public String addForm(@PathVariable("restaurant_id") int r_id, Map map) {
		Restaurant r = service1.getByRestaurant_id(r_id);
		map.put("r", r);
		return "menu/add";	
	}
	
	// 연결페이지 확인 요청
	@PostMapping("/add")
	public String add(Menu m) {
		Menu m2 = service.saveMenu(m);
	
		MultipartFile file = m.getFile();
		String ori_fname = file.getOriginalFilename();
		int idxOfLastDot = ori_fname.lastIndexOf(".");
		String fname = m2.getM_num() + ori_fname.substring(idxOfLastDot);
		try {
			file.transferTo(new File(path + fname));
			m2.setImg_path(fname);
			service.saveMenu(m2);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/restaurant/detail/2/"+ m2.getResid().getRestaurant_id();
		}
	
	@RequestMapping("/readimg/{fname}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname) {
		File f = new File(path + fname);//타겟 파일
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));//마임타입
			// 이미지를 byte array로 담아서 response에 담에서 뿌린다
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		// mylist 내 img src로 result값 전달해서 img로 출력시켜줌
	}
	
	@GetMapping("/{m_num}/edit")
	public String editForm(@PathVariable("m_num") int m_num, Map map) {
		Menu m = service.getMenu(m_num);
		map.put("m", m);
		return "menu/edit";
	}
	
	@PostMapping("/edit")
	public String edit(Menu m, HttpSession session) {
		service.saveMenu(m);
		String id = (String) session.getAttribute("loginid");
		Member m1 = new Member();
		m1 = service2.getMember(id);
		return "redirect:/restaurant/"+m1.getType()+"/"+m.getResid();
		
	}
	

	
}
