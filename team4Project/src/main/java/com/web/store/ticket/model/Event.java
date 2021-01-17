package com.web.store.ticket.model;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.web.store.company.model.Company;

@Entity
@Table(name = "event")
public class Event {
	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "typeId")
	private Integer typeId;
	@Column(name = "eventName")
	private String eventName;
	@Column(name = "eventLocation")
	private String eventLocation;
	@Column(name = "eventImage")
	private Blob eventImage;
	@Column(name = "imageName")
	private String imageName;

	@Transient
	MultipartFile eMultipartFile;
	
	@Column(name = "companyId")
	private Integer companyId;

	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "companyId")
	private Company company;

	@Transient
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Event", cascade = CascadeType.ALL)
	private Set<Price> prices = new LinkedHashSet<Price>();

	@Transient
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "Event")
	private Attraction attraction;

	@Transient
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "Event")
	private Exhibition exhibition;

	@Transient
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "Event")
	private Sport sport;

	public Event() {
	}

	public Event(Integer id, Integer typeId, String eventName, String eventLocation, Blob eventImage, String imageName,
			Integer companyId) {
		this.id = id;
		this.typeId = typeId;
		this.eventName = eventName;
		this.eventLocation = eventLocation;
		this.eventImage = eventImage;
		this.imageName=imageName;
		this.companyId = companyId;

	}

	public Event(Integer typeId, String eventName, String eventLocation, Blob eventImage, String imageName,Integer companyId) {
		this.typeId = typeId;
		this.eventName = eventName;
		this.eventLocation = eventLocation;
		this.eventImage = eventImage;
		this.imageName=imageName;
		this.companyId = companyId;

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public Blob getEventImage() {
		return eventImage;
	}

	public void setEventImage(Blob eventImage) {
		this.eventImage = eventImage;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Set<Price> getPrices() {
		return prices;
	}

	public void setPrices(Set<Price> prices) {
		this.prices = prices;
	}

	public Attraction getAttraction() {
		return attraction;
	}

	public void setAttraction(Attraction attraction) {
		this.attraction = attraction;
	}
	
	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public MultipartFile geteMultipartFile() {
		return eMultipartFile;
	}

	public void seteMultipartFile(MultipartFile eMultipartFile) {
		this.eMultipartFile = eMultipartFile;
	}


}
