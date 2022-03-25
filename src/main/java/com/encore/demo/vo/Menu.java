package com.encore.demo.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Entity
@Data
public class Menu {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int m_num;
	
	@JoinColumn(name="mname", nullable=false)
	private String mname;
	
	@OneToOne
	@JoinColumn(name="resid", nullable=false)
	@OnDelete(action= OnDeleteAction.CASCADE) // on delete cascade �꽕�젙
	private Restaurant resid;
	
	@Column(nullable=false)
	private int price;
	
	@Column(nullable=false)
	private int amount;
	
	private String m_summary;
	
	private String img_path;
	
	@Transient
	private MultipartFile file;
}