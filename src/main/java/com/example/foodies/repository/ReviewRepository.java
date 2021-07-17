package com.example.foodies.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.foodies.model.ReviewBoard;

public interface ReviewRepository extends JpaRepository<ReviewBoard, Long> {

}
