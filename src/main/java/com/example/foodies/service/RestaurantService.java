package com.example.foodies.service;

import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.repository.BoardRepository;
import com.example.foodies.repository.RestAttachRepository;

import lombok.extern.java.Log;

@Service
@Log
public class RestaurantService {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private RestAttachRepository restAttachRepository;

	@Transactional
	public Restaurant findById(Long id) {
		Restaurant restaurant = boardRepository.findById(id).get();

		return restaurant;
	}
	
	//@Transactional
	public Restaurant insert(Restaurant restaurant) {
		return  boardRepository.save(restaurant);
	}
	
	public RestAttach insert(RestAttach restAttach) {
		return restAttachRepository.save(restAttach);
	}
	
	// 식당 등록과 파일 등록을 같이 하기
	@Transactional
	public void insertRestAndImg(Restaurant restaurant, List<RestAttach> restAttachs) {
		Restaurant restaurant2 =  boardRepository.save(restaurant);
		
		//restaurant2.getId()
		if (restAttachs.size() > 0) {
			for (RestAttach restAttach : restAttachs) {
				restAttach.setRestaurant(restaurant2);
				restAttachRepository.save(restAttach);
			}
		}
	}
	
	// 식당 사진 불러오기
	public List<RestAttach> findByRestaurant(Restaurant restaurant) {
		return restAttachRepository.findByRestaurant(restaurant);
	}
	
	// 식당 삭제
	@Transactional
	public void deleteByResId(Long resId) {
		//log.info("삭제 서비스 탐");
		 restAttachRepository.deleteByResId(resId);
		
		
		boardRepository.deleteById(resId);
		//log.info("삭제 서비스 완료");
	}
	
	// 식당 등록과 파일 수정을 같이 하기
	@Transactional
	public void updateRestAndImg(Restaurant restaurant, List<RestAttach> restAttachs) {
		
		log.info("식당 수정 서비스 탔음");
		log.info("서비스 restAttachs : " + restAttachs);
		
		Restaurant rest = boardRepository.findById(restaurant.getId()).get();
		rest.setAddr1(restaurant.getAddr1());
		rest.setCntctTel(restaurant.getCntctTel());
		rest.setItemcntnts(restaurant.getItemcntnts());
		rest.setMainTitle(restaurant.getMainTitle());
		rest.setRprsntvMenu(restaurant.getRprsntvMenu());
		rest.setUsageDayWeekAndTime(restaurant.getUsageDayWeekAndTime());
		
		List<RestAttach> originalLists = restAttachRepository.findByRestaurant(rest);
		log.info("식당 수정 서비스 1");
		log.info("originalLists : " + originalLists);
		
		if (restAttachs.size() > 0) {
			for (RestAttach restAttach : restAttachs) { // 왜 네번들어가지? -> 전의데이터를 다 가져와서
				
				
				RestAttach attach = restAttachRepository.findById(restAttach.getId()).get();
				log.info("attach : " + attach);
				attach.setUuid(restAttach.getUuid());
				attach.setUploadpath(restAttach.getUploadpath());
				attach.setFilename(restAttach.getFilename());
				attach.setRestaurant(restAttach.getRestaurant());
				
				originalLists.add(attach);
				
			}
			log.info("originalLists2 : " + originalLists);
			log.info("식당 수정 서비스 끝");
		}
		
	}
	
	/*
	@Transactional
	public List<RestAttach> updateImg(List<RestAttach> restAttachs) {
		
		log.info("식당 사진 수정 서비스 탔음");
		
		
		
		if (restAttachs.size() > 0) {
			for (RestAttach restAttach : restAttachs) { // 왜 네번들어가지? -> 전의데이터를 다 가져와서
				log.info("restAttach : " + restAttach);
				
				
				
				
				RestAttach attach = restAttachRepository.findById(restAttach.getId()).get();
				attach.setUuid(restAttach.getUuid());
				attach.setUploadpath(restAttach.getUploadpath());
				attach.setFilename(restAttach.getFilename());
				attach.setRestaurant(restAttach.getRestaurant());
				
				log.info("attach : " + attach);
				restAttachs.add(attach);
						
			}
			
			Iterator<RestAttach> iter = restAttachs.iterator();
			while (iter.hasNext()) {
				RestAttach attach = restAttachRepository.findById(restAttach.getId()).get();
				attach.setUuid(restAttach.getUuid());
				attach.setUploadpath(restAttach.getUploadpath());
				attach.setFilename(restAttach.getFilename());
				attach.setRestaurant(restAttach.getRestaurant());
			}
			
		}
		log.info("식당 수정 서비스 끝");
		return restAttachs;
		
		
	}
	*/
}
