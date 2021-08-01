package com.example.foodies.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.foodies.model.Restaurant;
import com.example.foodies.model.ReviewBoard;
import com.example.foodies.model.member.Member;

public interface ReviewRepository extends JpaRepository<ReviewBoard, Long> {
	
	@Modifying
	@Query(value = "DELETE FROM reviewboard WHERE reviewboard_id = ?1", nativeQuery = true)
	void deleteByReviewId(Long id); // 삭제가 안먹어서 결국..쿼리로 강제로 삭제 맥임
	
	@Query(value = "SELECT AVG(grade) FROM reviewboard WHERE res_id = ?1", nativeQuery = true)
	Double findOneAvg(Long resId);
	
	@Query(value = "SELECT * FROM reviewboard WHERE member_id = ?1 AND res_id = ?2", nativeQuery = true)
	ReviewBoard findByMemberId(Long memId, Long resId);
	
	@Modifying
	@Query(value = "DELETE FROM reviewboard WHERE member_id = ?1", nativeQuery = true )
	public void deleteByMemberId(Long memId);
	
	@Modifying
	@Query(value = "DELETE FROM reviewboard WHERE res_id = ?1", nativeQuery = true )
	public void deleteByResId(Long resId);
	
	

	


}
