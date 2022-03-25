package com.encore.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
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

import com.encore.demo.service.OwnerBoradService;
import com.encore.demo.vo.OwnerBoard;

@Controller
@RequestMapping("/ownerboard")
public class OwnerBoardController {

	@Autowired
	private OwnerBoradService service;
	private String path = "C:\\img\\ownerboard\\";
	
	// 湲� 紐⑸줉(硫붿씤)
	@GetMapping("/list")
	public void list(Map map) {
		ArrayList<OwnerBoard> list = service.getAll();
		map.put("list", list);
	}
	
	
	// 湲��옉�꽦 �뤌
	@GetMapping("/write")
	public void writeForm() {}
	
	// 湲� �옉�꽦
	@PostMapping("/write")
	public String write(OwnerBoard o) {
		
		OwnerBoard tmp = service.saveBoard(o);
		MultipartFile f = o.getFile();
		
		String orname = f.getOriginalFilename();
		int lastdot = orname.lastIndexOf(".");
		String fname = orname.substring(lastdot);
		fname = tmp.getNum() + fname;
		File new_file = new File(path+fname);
		try {
			f.transferTo(new_file);	//�뾽濡쒕뱶�맂 �뙆�씪 �궡�슜�쓣 �깉 �뙆�씪�뿉 蹂듭궗
			tmp.setImg_path(fname);
			service.saveBoard(tmp);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/ownerboard/list/";
		
	}
	
	@GetMapping("/read_img/{fname}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname) {
		File f = new File(path + fname);// ��寃� �뙆�씪
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));// 留덉엫���엯
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// �젣紐⑹쑝濡� 寃��깋
	@PostMapping("/getbytitle")
	public String getbytitle(String title, Map map) {
		ArrayList<OwnerBoard> list = service.getByTitle(title);
		map.put("list", list);
		return "ownerboard/list";
	}
	
	// 湲� �궘�젣
	@GetMapping("/del/{num}")
	public String del(@PathVariable("num")int num) {
		service.delOwnerBoard(num);
		return "redirect:/ownerboard/list";
	}
	
	// 湲� �긽�꽭
	@GetMapping("/detail/{num}")
	public String detail(@PathVariable("num") int num, Map map) {
		OwnerBoard o = service.getBoard(num);
		map.put("o", o);
		return "ownerboard/detail";
	}
	
	// 湲� �닔�젙
	@PostMapping("/edit/{num}")
	public String edit(@PathVariable("num")int num, OwnerBoard o) {
		OwnerBoard oo = service.getBoard(num);
		oo.setContent(o.getContent());
		oo.setTitle(o.getTitle());
		oo.setTime(new Date());
		OwnerBoard tmp = service.saveBoard(oo);
		return "redirect:/ownerboard/list/";
		
	}
}
