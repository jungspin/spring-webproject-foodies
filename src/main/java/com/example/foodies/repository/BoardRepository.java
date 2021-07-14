package com.example.foodies.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.foodies.model.Restaurant;

public interface BoardRepository extends JpaRepository<Restaurant, Long> {

	@Query(value="select * from restaurant r where r.main_title like %:keyword% or r.rprsntv_menu like %:keyword% or r.itemcntnts like %:keyword% or r.addr1 like %:keyword% or r.cntct_tel like %:keyword% or r.usage_day_week_and_time like %:keyword%", nativeQuery=true)
	 List<Restaurant>findRestaurantsByKeyword(@Param("keyword")String keyword);

	
	
}
