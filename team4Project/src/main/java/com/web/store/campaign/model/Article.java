//package com.web.store.campaign.model;
//
//import java.sql.Timestamp;
//import java.util.HashSet;
//import java.util.Set;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
//@Entity
//@Table(name="article")
//public class Article {
//	
//	@Id @Column(name="id")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer id;	
//	private String title;
//	private Timestamp postTime;
//	private String content;
//	private Boolean Status;
//	private String picturePath;
//	private Integer viewCount;
//	private Integer thumbUpCount;
//	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "article")
//	private Set<Response> responses = new HashSet<Response>();
////  關聯member，之後補上
////	@JoinColumn(name="memberId")
////	@ManyToOne
////	private Member member;
//	public Integer getId() {
//		return id;
//	}
//	public void setId(Integer id) {
//		this.id = id;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public Timestamp getPostTime() {
//		return postTime;
//	}
//	public void setPostTime(Timestamp postTime) {
//		this.postTime = postTime;
//	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public Boolean getStatus() {
//		return Status;
//	}
//	public void setStatus(Boolean status) {
//		Status = status;
//	}
//	public String getPicturePath() {
//		return picturePath;
//	}
//	public void setPicturePath(String picturePath) {
//		this.picturePath = picturePath;
//	}
//	public Integer getViewCount() {
//		return viewCount;
//	}
//	public void setViewCount(Integer viewCount) {
//		this.viewCount = viewCount;
//	}
//	public Integer getThumbUpCount() {
//		return thumbUpCount;
//	}
//	public void setThumbUpCount(Integer thumbUpCount) {
//		this.thumbUpCount = thumbUpCount;
//	}
//	public Set<Response> getResponses() {
//		return responses;
//	}
//	public void setResponses(Set<Response> responses) {
//		this.responses = responses;
//	}
//	
//	
//}
