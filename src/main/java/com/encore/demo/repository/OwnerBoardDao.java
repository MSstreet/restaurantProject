package com.encore.demo.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.vo.Member;
import com.encore.demo.vo.OwnerBoard;

public interface OwnerBoardDao extends JpaRepository<OwnerBoard, Integer> {

		ArrayList<OwnerBoard> findByWriter(String id);

	
	ArrayList<OwnerBoard> findByTitleLike(String title);
	
}