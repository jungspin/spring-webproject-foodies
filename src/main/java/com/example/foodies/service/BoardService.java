package com.example.foodies.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.foodies.model.Restaurant;
import com.example.foodies.model.freeboard.FreeBoard;
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
	public List<FreeBoard> findMemberAll() {
		List<FreeBoard> freeboards = freeBoardRepository.findAll();
		for (int i = 0; i < freeboards.size(); i++)
			System.out.println(freeboards.get(i));
		return freeBoardRepository.findAll();
	}



	//자유게시판상세보기 

	@Transactional
	public FreeBoard findById(Long id) {
		FreeBoard freeBoard = freeBoardRepository.findById(id).get();
		freeBoard.setClickCnt(freeBoard.getClickCnt()+1);
		return freeBoardRepository.findById(id).get();
	}

	@Transactional
	public List<Restaurant> findAll() {
		return boardRepository.findAll();
	}

	// 자유게시판 전체보기
	@Transactional
	public Page<FreeBoard> findAll(Pageable pageable) {
		return freeBoardRepository.findAll(pageable);
	}

	// 개수
	@Transactional
	public Long count() {
		return boardRepository.count();
	}

	// 자유게시판글쓰기
	@Transactional
	public void insert(FreeBoard freeBoard, Member member) {
		freeBoard.setMember(member);
		freeBoardRepository.save(freeBoard);
	}

	//자유게시판 수정 
	@Transactional 
	public void update(FreeBoard freeBoard) {
		FreeBoard b = freeBoardRepository.findById(freeBoard.getId()).get();
		b.setContent(freeBoard.getContent());
		b.setTitle(freeBoard.getTitle());
	}
	//자유게시판 수정폼
	@Transactional
	public FreeBoard view(Long id) {
	 FreeBoard freeboard =	freeBoardRepository.findById(id).get();
	 return freeboard;
	}
	//자유게시판 삭제
	
	@Transactional
	public void delete(Long id) {
		freeBoardRepository.deleteById(id);
	}
	//검색하기
	@Transactional 
	public List<Restaurant> findRestaurantsByKeyword(String keyword) {
		System.out.println(keyword);
		return boardRepository.findRestaurantsByKeyword(keyword);
	}
	
	

}
