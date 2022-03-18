package com.encore.demo.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@ToString
public class Member {
	
	@Id
	private String id;
	
	@Column(nullable=false)
	private String pwd;
	
	@Column(nullable=false)
	private String pwd_check;
	
	@Column(nullable=false)
	private String name;
	
	@Column(nullable=false)
	private String tel;
	
	@Column(nullable=false)
	private String email;
	
	@Column(nullable=false)
	private int type;// 1:�쑀��, 2:�젏二�

}
