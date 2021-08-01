package com.example.foodies.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.foodies.model.Bookmark;

public interface BookmarkRepository extends JpaRepository<Bookmark, Long>{
	
	
	List<Bookmark> findByMemberId(Long memberId);
	
	List<Bookmark> findByRestaurantId(Long id);
	
	
	@Query(value = "SELECT * FROM bookmark WHERE member_id = ?1 AND res_id = ?2", nativeQuery = true)
	Bookmark findByMemAndRest(Long memId, Long resId);
	
	@Query(value = "SELECT count(*) FROM bookmark WHERE res_id = ?1", nativeQuery = true)
	int findCountBookmark(Long resId);
	
	@Modifying
	@Query(value = "DELETE FROM bookmark WHERE member_id = ?1", nativeQuery = true)
	void deleteByMemberId(Long memId);
	
	@Modifying
	@Query(value = "DELETE FROM bookmark WHERE res_id = ?1", nativeQuery = true)
	void deleteByResId(Long resId);
	
	

}
