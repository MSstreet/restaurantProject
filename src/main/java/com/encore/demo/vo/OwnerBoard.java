package com.encore.demo.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
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
public class OwnerBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	
	@ManyToOne
	@JoinColumn(name="writer", nullable=false)
	@OnDelete(action= OnDeleteAction.CASCADE) // on delete cascade 占쎄퐬占쎌젟
	private Member writer;
	
	@Column(nullable=false)
	private String title;
	
	@Column(nullable=false)
	private String content;

//	@Column(nullable=false)
//	private Date w_date;

	@Column(nullable=false)
	private String pwd;

	private String img_path;
	
	@Transient // 燁살눖�쓥占쎌몵嚥∽옙 筌띾슢諭억옙堉깍쭪占쏙쭪占� 占쎈륫占쎌벉
	private MultipartFile file;
	
	@Column(nullable = false)
	private Date time;
	
	@PrePersist	// insert 占쎈땾占쎈뻬占쎈뻻 占쎌쁽占쎈짗 占쎄문占쎄쉐 : 疫뀐옙 占쎌삂占쎄쉐 占쎈뻻揶쏉옙 占쎌쁽占쎈짗 雅뚯눘�뿯
	public void writingTime() {
		time = new Date();
	}
}
