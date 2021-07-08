package com.example.foodies.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Restaurant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="res_id")
private Long id;
	@Column(nullable = false)
private String resName;
	@Column(nullable = false)
private String phoneNumber;
private String img;
	@Column(nullable = false)
	@Lob
private String content;
	@Column(nullable = false)
private String addr;
}
