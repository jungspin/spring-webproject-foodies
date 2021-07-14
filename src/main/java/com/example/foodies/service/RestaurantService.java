package com.example.foodies.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodies.model.Restaurant;
import com.example.foodies.repository.BoardRepository;

@Service
public class RestaurantService {
@Autowired
private BoardRepository boardRepository;
@Transactional
public Restaurant findById(Long id){
	Restaurant restaurant = boardRepository.findById(id).get();
	
	return restaurant;
}
}
