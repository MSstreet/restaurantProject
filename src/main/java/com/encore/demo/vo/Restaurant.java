package com.encore.demo.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@ToString
public class Restaurant {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int restaurant_id;
	
	@ManyToOne	// restaurant:member
	@JoinColumn(name="w_id", nullable=false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Member id;
	
	@Column(nullable=false)
	private String restaurantName;
	
	@Column(nullable=false)
	private String addr;
	
	private String detailAddr;
	
	@Column(nullable=false)
	private String oper_time;
	
	private String category;
	
	private String tel;
	
	private String restauranttype;
	
	private String menutype;
	
	private String contents;
	
	private float comsumer_rate;
	
	private String r_img;
	
	@Transient
	private MultipartFile file;
	
	private int cnt;
	

}
