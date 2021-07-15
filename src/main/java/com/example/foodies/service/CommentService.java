package com.example.foodies.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodies.model.FreeBoard;
import com.example.foodies.model.FreeComment;
import com.example.foodies.repository.CommentRepository;
import com.example.foodies.repository.FreeBoardRepository;

@Service
public class CommentService {
	
	@Autowired
	private FreeBoardRepository freeBoardRepository;
	@Autowired
	private CommentRepository commentRepository;
	@Transactional
	public void insert(FreeComment comment) {
		//board 의 replyCnt 를 1증가
		//Optional<FreeBoard>	freeboard = freeBoardRepository.findById(comment.getFreeBoard().getId());
		//freeboard.get().setReplycnt(freeboard.get().getReplycnt()+1);
	
		//JPQL
		commentRepository.commentInsert(
				comment.getContent(),
				comment.getFreeBoard().getId(),
				comment.getMember().getId()
				);
	}
	//댓글리스트
	@Transactional
	public List<FreeComment> list(Long id){
		return commentRepository.findFreecommentById(id);
	}
	
	//댓글삭제
	public void delete(Long id) {
       
		
	commentRepository.deleteById(id);	
		
	}

	}


