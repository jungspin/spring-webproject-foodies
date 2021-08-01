package com.example.foodies.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;

public interface RestAttachRepository extends JpaRepository<RestAttach, Long>{
	
	List<RestAttach> findByRestaurant(Restaurant restaurant);
	
	@Query(value = "SELECT * FROM rest_attach WHERE res_id = ?1", nativeQuery = true)
	RestAttach findByResId(Long id);
	
	@Modifying
	@Query(value = "DELETE FROM rest_attach WHERE res_id = ?1", nativeQuery = true)
	void deleteByResId(Long resId);
	
	@Modifying
	@Query(value = "DELETE FROM rest_attach WHERE reviewboard_id = ?1", nativeQuery = true)
	void deleteByReviewboardId(Long reviewBoardid); // 쿼리메소드?

}
