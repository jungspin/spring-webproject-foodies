package com.example.foodies.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.foodies.model.FreeBoard;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.member.Member;
import com.example.foodies.repository.BoardRepository;
import com.example.foodies.repository.FreeBoardRepository;



@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	@Autowired
	private FreeBoardRepository freeBoardRepository;
	public Restaurant list(Long id) {
		Restaurant restaurant = boardRepository.findById(id).get();
		return restaurant;
	}
	@Transactional
	public List<FreeBoard> findMemberAll(){
		List<FreeBoard> freeboards=freeBoardRepository.findAll();
		for (int i = 0; i < freeboards.size(); i++)
		System.out.println(freeboards.get(i));
		return freeBoardRepository.findAll();
	}
	@Transactional
	public Optional<FreeBoard> findById(Long id){
		return freeBoardRepository.findById(id);
	}
	@Transactional
	public List<Restaurant> findAll(){
		return boardRepository.findAll();
	}
	@Transactional
	public Page<FreeBoard> findAll(Pageable pageable){
		return freeBoardRepository.findAll(pageable);
	}
	//개수
	@Transactional
	public Long count() {
		return boardRepository.count();
	}
	//자유게시판글쓰기
	@Transactional
	public void insert( FreeBoard freeBoard, Member member) {
		freeBoard.setMember(member);
		freeBoardRepository.save(freeBoard);
	}
}
