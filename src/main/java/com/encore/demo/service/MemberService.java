package com.encore.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.encore.demo.repository.MemberDao;
import com.encore.demo.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	public void saveMember(Member m) {
		dao.save(m);
	}
	
	public Member getMember(String id) {
		return dao.findById(id).orElse(null);
	}
	
	public void delMember(String id) {
		dao.deleteById(id);
	}
	
	public ArrayList<Member> getByName(String name){
		return dao.findByNameLike("%"+name+"%");
	}
}
