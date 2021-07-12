package com.example.foodies.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodies.model.Restaurant;
import com.example.foodies.repository.BoardRepository;



@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	public Restaurant list(Long id) {
		Restaurant restaurant = boardRepository.findById(id).get();
		return restaurant;
	}
	@Transactional
	public List<Restaurant> findAll(){
		return boardRepository.findAll();
	}

}
