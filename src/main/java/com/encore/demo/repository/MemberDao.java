package com.encore.demo.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.vo.Member;

public interface MemberDao extends JpaRepository<Member, String> {

	ArrayList<Member> findByNameLike(String name);
}
