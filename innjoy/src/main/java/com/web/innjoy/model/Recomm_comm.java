package com.web.innjoy.model;
// 댓글

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="RECOMM_COMM")
public class Recomm_comm {
	
	@Id
	@Column(name="rc_com_id", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "rc_com_id_seq_generator")
	@SequenceGenerator(name = "rc_com_id_seq_generator", sequenceName = "rc_com_id_seq", allocationSize = 1)
	private int rcComId;
	
	@ManyToOne	// many comments, one recomm
	@JoinColumn(name="recom_id", insertable = false, updatable = false)
	private Recomm recomm;
	
	@Column(name="recom_id")
	private int recomId;
	
	@ManyToOne	// many commets, one user
	@JoinColumn(name="user_id", insertable = false, updatable = false)
	private Ij_User ijUser;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="rc_com_det")
	private String rcComDet;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="rc_com_time")
	private Date rcComTime;
	
	// 생성자
	public Recomm_comm() {}
	
	public Recomm_comm(int rcComId, Recomm recomm, Ij_User ijUser, String rcComDet, Date rcComTime) {
		this.rcComId = rcComId;
		this.recomm = recomm;
		this.ijUser = ijUser;
		this.rcComDet = rcComDet;
		this.rcComTime = rcComTime;
	}
	
	public Recomm_comm(int recomId, String userId, String rcComDet) {
		this.recomId = recomId;
		this.userId = userId;
		this.rcComTime = new Date();
		this.rcComDet = rcComDet;
	}

	// getter, setter
	public int getRcComId() {
		return rcComId;
	}

	public void setRcComId(int rcComId) {
		this.rcComId = rcComId;
	}

	public Recomm getRecomm() {
		return recomm;
	}

	public void setRecomm(Recomm recomm) {
		this.recomm = recomm;
	}

	public Ij_User getIjUser() {
		return ijUser;
	}

	public void setIjUser(Ij_User ijUser) {
		this.ijUser = ijUser;
	}

	public String getRcComDet() {
		return rcComDet;
	}

	public void setRcComDet(String rcComDet) {
		this.rcComDet = rcComDet;
	}

	public Date getRcComTime() {
		return rcComTime;
	}

	public void setRcComTime(Date rcComTime) {
		this.rcComTime = rcComTime;
	}

	public int getRecomId() {
		return recomId;
	}

	public void setRecomId(int recomId) {
		this.recomId = recomId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}
