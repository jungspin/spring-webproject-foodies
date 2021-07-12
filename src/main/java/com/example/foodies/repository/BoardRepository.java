package com.example.foodies.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.foodies.model.Restaurant;

public interface BoardRepository extends JpaRepository<Restaurant, Long>{
	

}
