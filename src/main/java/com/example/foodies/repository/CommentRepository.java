package com.example.foodies.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.foodies.model.freeboard.FreeComment;



public interface CommentRepository extends JpaRepository<FreeComment, Long> {

	@Modifying
	@Query(value = "insert into freecomment(content, reg_date, freeboard_id, member_id) values(?1,now(), ?2, ?3)", nativeQuery = true)
	public void commentInsert(String content, Long id, Long member_id);

	@Query(value = "select c from freecomment c where freeboard_id=?1", nativeQuery = true)
	public List<FreeComment> findFreecommentById(Long id);
	
	@Modifying
	@Query(value = "DELETE FROM freecomment WHERE member_id = ?1", nativeQuery = true )
	public void deleteByMemberId(Long memId);

}
