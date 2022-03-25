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

import com.encore.demo.service.MemberService;
import com.encore.demo.service.RestaurantService;
import com.encore.demo.vo.Member;
import com.encore.demo.vo.Restaurant;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	private String path = "C:\\img\\restaurant\\";
	
	@Autowired
	private RestaurantService rservice;
	
	// 로그인 전 초기화면
	@GetMapping("/index")
	public String mainForm(Map map) {
		//메인 페이지에 등록된 모든 레스토랑 정보 출력
		ArrayList<Restaurant> list = rservice.getAll();
		map.put("list", list);
		return "member/index";
	}
	
	// 회원가입 폼
	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
		
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(Member m) {
		service.saveMember(m);
		return "redirect:/member/login";
	}
	
	// 로그인 폼
	@GetMapping("/login")
	public void loginForm() {}
	
	// 로그인 
	@PostMapping("/login")
	public String login(Member m , HttpSession session) {
		Member m2 = service.getMember(m.getId());
		System.out.println("login : "+m);
		String path = "redirect:/member/main/";
		if (m2 != null && m2.getPwd().equals(m.getPwd())) {
			session.setAttribute("loginid", m2.getId());
			int type = m2.getType();
			session.setAttribute("userType", type);
			
			if (type == 1) {	// 1:유저(고객)
				session.setAttribute("typename", "고객");
				session.setAttribute("number1", 1);
				path += "1";
				System.out.println("login : consumer"+path);
			} else if (type == 2) {
				session.setAttribute("typename", "점주");
				session.setAttribute("number2", 2);
				path += "2";
			} else {
				session.setAttribute("typename", "other");
				
			}
		} else {	// 로그인 실패
			path = "member/login";
		}
		System.out.println(path);
		return path;
	}
	
	// 마이페이지
	@GetMapping("/myinfo")
	public void myinfo(HttpSession session, Map map) {
		String id = (String) session.getAttribute("loginid");
		Member m = service.getMember(id);
		map.put("m", m);
	}
	
	// 내정보 수정
	@PostMapping("/edit")
	public String edit(Member m) {
		service.saveMember(m);
		return "redirect:/member/main/"+m.getType();
	}
	
//	// 가게목록
//	@GetMapping("/list")
//	public void list(Map map) {
//		ArrayList<Restaurant> list = rservice.getAll();
//		map.put("list", list);
//	}
	
	// 사용자별 메인페이지 URL
	@RequestMapping("/main/{type}")
	public String main(@PathVariable("type") int type, Map map, HttpSession session) {
		String path = "member/";
		if (type == 1) {
			ArrayList<Restaurant> list = rservice.getAll();
			map.put("list", list);
			path += "cMain";
		} else if (type == 2){
			String id = (String) session.getAttribute("loginid");	//다운캐스팅
			Member m = new Member();
			m.setId(id);
			ArrayList<Restaurant> mylist = rservice.getByWriter(m);
			map.put("mylist", mylist);
			path += "oMain";
		}
		return path;
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();	// 세션 무효화
		return "redirect:/member/login";
	}

	// 탈퇴
	@GetMapping("/out")
	public String out(HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		service.delMember(id);
		return "redirect:/member/logout";
	}
	
	@GetMapping("/readimg/{fname}")
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
}
