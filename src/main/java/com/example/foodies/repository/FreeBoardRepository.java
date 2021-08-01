package com.example.foodies.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.foodies.model.freeboard.FreeBoard;



public interface FreeBoardRepository extends JpaRepository<FreeBoard, Long>{
	
	public void deleteById(Long id);
	
	
	@Modifying
	@Query(value = "DELETE FROM freeboard WHERE member_id = ?1", nativeQuery = true )
	public void deleteByMemberId(Long memId);
	
	//@Query(value = "SELECT * FROM freeboard WHERE comment_id = ?1", nativeQuery = true )
	//public void findByCommentId(Long commentId);
}
