package com.example.foodies.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.model.freeboard.FreeBoard;
import com.example.foodies.model.freeboard.FreeComment;
import com.example.foodies.service.CommentService;
@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	//댓글추가
	@PostMapping("/board/freeComment/{id}")
	@ResponseBody
	 public ResponseEntity<String> commentInsert( @PathVariable Long id,
			@RequestBody FreeComment freeComment,
			@AuthenticationPrincipal PrincipalDetails principal) {
					FreeBoard freeBoard = new FreeBoard();
						freeBoard.setId(id);
		System.out.println("principal.getMember() : " + principal.getMember());
		
		freeComment.setMember(principal.getMember());
		freeComment.setFreeBoard(freeBoard);//
		System.out.println(freeComment);
		commentService.insert(freeComment);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

		 @GetMapping("/comment/list/{id}")
		 public List<FreeComment> list(@PathVariable Long id){
			 
			 List<FreeComment> clist = commentService.list(id);
			 System.out.println(clist);
			 return clist;
		}
		 //댓글 삭제
		 @DeleteMapping("/board/freeComment/{id}")
		 @ResponseBody
		 public String delete(@PathVariable Long id) {
			 System.out.println("hello");
			 commentService.delete(id);
			 System.out.println("hello");
			 return "success";
		 }
}
