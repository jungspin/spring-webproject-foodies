package com.example.foodies.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.foodies.model.Restaurant;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

	@Query(value = "select * from restaurant r where r.main_title like %:keyword% or r.rprsntv_menu like %:keyword% or r.itemcntnts like %:keyword% or r.addr1 like %:keyword% or r.cntct_tel like %:keyword% or r.usage_day_week_and_time like %:keyword%", nativeQuery = true)
	List<Restaurant> findRestaurantsByKeyword(@Param("keyword") String keyword);

	@Query(value = "select * from restaurant r where REGEXP_LIKE(r.main_title, 'keyword|keyword1') or REGEXP_LIKE(r.rprsntv_menu, 'keyword|keyword1') or REGEXP_LIKE(r.itemcntnts, 'keyword|keyword1') or REGEXP_LIKE(r.addr1, 'keyword|keyword1') or REGEXP_LIKE(r.cntct_tel , 'keyword|keyword1') or REGEXP_LIKE(r.usage_day_week_and_time , 'keyword|keyword1')", nativeQuery = true)
	List<Restaurant> findRestaurantsByKeyword1(@Param("keyword") String keyword, @Param("keyword1") String keyword1);

	@Query(value = "SELECT * FROM restaurant ORDER BY res_id limit 10", nativeQuery = true)
	List<Restaurant> findLimit();
	
	
	@Query(value = "SELECT * FROM restaurant ORDER BY rand() limit 10", nativeQuery = true)
	List<Restaurant> findByRandom();
	

}
