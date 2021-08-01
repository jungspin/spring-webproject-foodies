package com.example.foodies.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.foodies.model.freeboard.FreeAttach;
import com.example.foodies.model.freeboard.FreeBoard;

public interface FreeAttachRepository extends JpaRepository<FreeAttach, Long>{
	
	List<FreeAttach> findByFreeBoard(FreeBoard freeBoard);
	
	@Modifying
	@Query(value = "DELETE FROM free_attach WHERE freeboard_id = ?1", nativeQuery = true)
	void deleteByFreeId(Long freeId);
	

}
