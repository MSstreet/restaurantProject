package com.encore.demo.vo;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;

@Entity
@Data
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rev_num;
	
	@ManyToOne
	@JoinColumn(name="restaurant", nullable=false)
	@OnDelete(action= OnDeleteAction.CASCADE) // on delete cascade 占쎄퐬占쎌젟
	private Restaurant restaurant;
	
	@ManyToOne
	@JoinColumn(name="id", nullable=false)
	@OnDelete(action= OnDeleteAction.CASCADE) // on delete cascade 占쎄퐬占쎌젟
	private Member id;

	@Column(nullable=false)
	private Date day;
	
	@Column(nullable=false)
	private int time;

	//占쎌굙占쎈튋 占쎌뵥占쎌뜚
	@Column(nullable=false)
	private int rev_cnt;
}
