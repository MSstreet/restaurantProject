package com.encore.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.encore.demo.repository.OwnerBoardDao;
import com.encore.demo.vo.OwnerBoard;

@Service
public class OwnerBoradService {

	@Autowired
	private OwnerBoardDao dao;

	// 추가, 수정
	public OwnerBoard saveBoard(OwnerBoard o) {
		return dao.save(o);
	}
	
	//
	public OwnerBoard getBoard(int num) {
		return dao.getById(num);
	}

	// 작성자로 검색
	public ArrayList<OwnerBoard> getMember(String writer) {
		return dao.findByWriter(writer);
	}

	// 제목으로 검색
	public ArrayList<OwnerBoard> getByTitle(String title) {
		return dao.findByTitleLike("%" + title + "%");
	}

	// 글 목록
	public ArrayList<OwnerBoard> getAll() {
		return (ArrayList<OwnerBoard>) dao.findAll();
	}

	// 글 삭제
	public void delOwnerBoard(int num) {
		dao.deleteById(num);
	}
}
