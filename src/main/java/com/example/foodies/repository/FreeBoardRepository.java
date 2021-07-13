package com.example.foodies.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.foodies.model.FreeBoard;


public interface FreeBoardRepository extends JpaRepository<FreeBoard, Long>{
	

}
