package com.encore.demo.vo;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Transient;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Entity  //�뿏�꽣�떚(�뀒�씠釉�) �젙�쓽
@Setter
@Getter
@ToString
public class Consumer_rate {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int c_num;
    
    @ManyToOne
    @JoinColumn(name="id", nullable=false)
    @OnDelete(action= OnDeleteAction.CASCADE) 
    private Member id;
    
    @ManyToOne
    @JoinColumn(name="restaurant", nullable=false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Restaurant restaurant;
    
    @OneToOne
    @JoinColumn(name = "rev_num")
    private Reservation rev_num;
    
    private int rate;
    
    private String contents;
    
    private String c_img;
    
    @Transient
    private MultipartFile file;
    
    private Date wdate;
    
    
    @PrePersist
    public void beforeCreate() {
        wdate = new Date();
    }
}