package com.example.foodies.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.repository.RestaurantRepository;
import com.example.foodies.repository.ReviewRepository;
import com.example.foodies.repository.BookmarkRepository;
import com.example.foodies.repository.RestAttachRepository;

import lombok.extern.java.Log;

@Service
@Log
public class RestaurantService {
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	@Autowired
	private RestAttachRepository restAttachRepository;
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	@Autowired
	private BookmarkRepository bookmarkRepository;

	@Transactional
	public Restaurant findById(Long id) {
		Restaurant restaurant = restaurantRepository.findById(id).get();

		return restaurant;
	}
	
	// 무작위로 데이터 뽑아오기
	public List<Restaurant> findByRandom(){
		return restaurantRepository.findByRandom();
	}
	
	//@Transactional
	public Restaurant insert(Restaurant restaurant) {
		return  restaurantRepository.save(restaurant);
	}
	
	public RestAttach insert(RestAttach restAttach) {
		return restAttachRepository.save(restAttach);
	}
	
	// 식당 등록과 파일 등록을 같이 하기
	@Transactional
	public void insertRestAndImg(Restaurant restaurant, List<RestAttach> restAttachs) {
		Restaurant restaurant2 =  restaurantRepository.save(restaurant);
		
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
	
	public RestAttach findByResId(Long id) {
		return restAttachRepository.findByResId(id);
	}
	
	// 식당 삭제
	@Transactional
	public void deleteByResId(Long resId) {
		//log.info("삭제 서비스 탐");
		// 첨부파일, 리뷰, 북마크
		 restAttachRepository.deleteByResId(resId); // 첨부파일
		 reviewRepository.deleteByResId(resId);
		 bookmarkRepository.deleteByMemberId(resId);
		
		
		 restaurantRepository.deleteById(resId);
		//log.info("삭제 서비스 완료");
	}
	
	// 식당 등록과 파일 수정을 같이 하기 -> 미완!!!!!!!!!!!!ㅜㅜ
	@Transactional
	public void updateRestAndImg(Restaurant restaurant, List<RestAttach> restAttachs, List<RestAttach> fileLists) {
		
		log.info("식당 수정 서비스 탔음");
		log.info("서비스 restAttachs : " + restAttachs);
		log.info("서비스 fileLists : " + fileLists);
		log.info("서비스 fileLists.size() : " + fileLists.size());
		log.info("서비스 restAttachs.size() : " + restAttachs.size());
		
		Restaurant rest = restaurantRepository.findById(restaurant.getId()).get();
		rest.setAddr1(restaurant.getAddr1());
		rest.setCntctTel(restaurant.getCntctTel());
		rest.setItemcntnts(restaurant.getItemcntnts());
		rest.setMainTitle(restaurant.getMainTitle());
		rest.setRprsntvMenu(restaurant.getRprsntvMenu());
		rest.setUsageDayWeekAndTime(restaurant.getUsageDayWeekAndTime());
		
		log.info("식당 수정 서비스 끝");
		// =========== 식당 수정 끝 =========================
		// =========== 식당 사진 수정 시작 =========================
		log.info("식당 수정 서비스 시작");
		
		if (fileLists.size() == restAttachs.size()) { // 원래 사진 갯수와 들어온 사진 갯수가 같을 경우
			log.info("원래 사진 갯수와 들어온 사진 갯수가 같을 경우");
			for(RestAttach file : fileLists) {
				for (RestAttach attach : restAttachs) {
					RestAttach ra = restAttachRepository.findById(attach.getId()).get();
					ra.setFilename(file.getFilename());
					ra.setUploadpath(file.getUploadpath());
					ra.setUuid(file.getUuid());
					ra.setRestaurant(rest);
				} // for
			} // for
		} else { // 원래 사진 갯수와 들어온 사진 갯수가 다를 경우
			if(restAttachs.size() == 0) { // 원래 사진 없는데 수정시 사진이 들어온 경우
				log.info("원래 사진 없는데 수정시 사진이 들어온 경우");
				for (RestAttach file : fileLists) {
					file.setRestaurant(rest);
					restAttachRepository.save(file);
				}
			} else if(fileLists.size() == 0) { // 원래 사진 있는데 수정시 사진이 안들어온 경우
				log.info("원래 사진 있는데 수정시 사진이 안들어온 경우");
				for (RestAttach attach : restAttachs) {
					restAttachRepository.deleteById(attach.getId());
				}
			} else { // 원래 사진 있는데 수정시 원래보다 많은 갯수의 사진이 들어온 경우
				if (fileLists.size() > restAttachs.size()) { // 원래 사진보다 많은 갯수가 들어온 경우
					log.info("원래 사진보다 많은 갯수가 들어온 경우"); // 두개다실패
					for (RestAttach file : fileLists) {
						for(RestAttach attach : restAttachs) {
							RestAttach ra = restAttachRepository.findById(attach.getId()).get();
							ra.setFilename(file.getFilename());
							ra.setUploadpath(file.getUploadpath());
							ra.setUuid(file.getUuid());
							ra.setRestaurant(rest);
						}
						file.setRestaurant(rest);
						restAttachRepository.save(file);
					}
				} else if (fileLists.size() < restAttachs.size()) { // 원래 사진보다 적은 갯수가 들어온 경우
					log.info("원래 사진보다 적은 갯수가 들어온 경우"); 
					for(RestAttach attach : restAttachs) {
						for(RestAttach file : fileLists) {
							RestAttach ra = restAttachRepository.findById(attach.getId()).get();
							ra.setFilename(file.getFilename());
							ra.setUploadpath(file.getUploadpath());
							ra.setUuid(file.getUuid());
							ra.setRestaurant(rest);
						}
						restAttachRepository.deleteById(attach.getId());
					} 
				}
			}
		}
		
		
		
	} // updateRestAndImg
	

}
