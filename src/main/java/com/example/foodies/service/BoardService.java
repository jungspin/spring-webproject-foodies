package com.example.foodies.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.ReviewBoard;
import com.example.foodies.model.freeboard.FreeAttach;
import com.example.foodies.model.freeboard.FreeBoard;
import com.example.foodies.model.member.Member;
import com.example.foodies.repository.FreeAttachRepository;
import com.example.foodies.repository.FreeBoardRepository;
import com.example.foodies.repository.RestAttachRepository;
import com.example.foodies.repository.RestaurantRepository;
import com.example.foodies.repository.ReviewRepository;

import lombok.extern.java.Log;

@Log
@Service
public class BoardService {

	@Autowired
	private RestaurantRepository restaurantRepository;
	
	@Autowired
	private FreeBoardRepository freeBoardRepository;

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private RestAttachRepository restAttachRepository;
	
	@Autowired
	private FreeAttachRepository freeAttachRepository;

	public Restaurant list(Long id) {
		Restaurant restaurant = restaurantRepository.findById(id).get();
		return restaurant;
	}

	@Transactional
	public List<FreeBoard> findMemberAll() {
		List<FreeBoard> freeboards = freeBoardRepository.findAll();
		for (int i = 0; i < freeboards.size(); i++)
			System.out.println(freeboards.get(i));
		return freeBoardRepository.findAll();
	}

	// 자유게시판상세보기
	@Transactional
	public FreeBoard findById(Long id) {
		FreeBoard freeBoard = freeBoardRepository.findById(id).get();
		freeBoard.setClickCnt(freeBoard.getClickCnt() + 1);
		return freeBoardRepository.findById(id).get();
	}

	@Transactional
	public List<Restaurant> findAll() {
		return restaurantRepository.findAll();
	}

	// 식당 리스트 10개만
	public List<Restaurant> findLimit() {
		return restaurantRepository.findLimit();
	}

	// 자유게시판 전체보기
	@Transactional
	public Page<FreeBoard> findAll(Pageable pageable) {
		return freeBoardRepository.findAll(pageable);
	}

	// 개수
	@Transactional
	public Long count() {
		return restaurantRepository.count();
	}

	// 자유게시판글쓰기
	@Transactional
	public void insert(FreeBoard freeBoard, Member member) {
		freeBoard.setMember(member);
		freeBoardRepository.save(freeBoard);
	}

	// 자유게시판 글쓰기와 파일 등록을 같이 하기
	@Transactional
	public void insertFreeAndImg(FreeBoard freeBoard, List<FreeAttach> freeAttachs) {
		FreeBoard freeBoard2 = freeBoardRepository.save(freeBoard);

		// restaurant2.getId()
		if (freeAttachs.size() > 0) {
			for (FreeAttach freeAttach : freeAttachs) {
				freeAttach.setFreeBoard(freeBoard2);
				freeAttachRepository.save(freeAttach);
			}
		}
	}
	
	// 자유게시판 사진 불러오기
	public List<FreeAttach> findByFreeboard(FreeBoard freeBoard){
		return freeAttachRepository.findByFreeBoard(freeBoard);
	}
	
	

	// 자유게시판 수정
	@Transactional
	public void update(FreeBoard freeBoard) {
		FreeBoard b = freeBoardRepository.findById(freeBoard.getId()).get();
		b.setContent(freeBoard.getContent());
		b.setTitle(freeBoard.getTitle());
	}
	
	// 자유게시판과 사진 같이 수정
	@Transactional
	public void updateFreeAndImg(FreeBoard freeBoard, List<FreeAttach> fileLists) {
		
		log.info("자유게시판 수정 서비스 탔음");
		log.info("서비스 fileLists : " + fileLists);
		log.info("서비스 fileLists.size() : " + fileLists.size());
		
		FreeBoard free = freeBoardRepository.findById(freeBoard.getId()).get();
		free.setTitle(freeBoard.getTitle());
		free.setContent(freeBoard.getContent());
	
		
		log.info("게시글 수정 서비스 끝");
		// =========== 식당 수정 끝 =========================
		// =========== 식당 사진 수정 시작 =========================
		log.info("게시판 사진 수정 서비스 시작");
		
		List<FreeAttach> freeAttachs = freeAttachRepository.findByFreeBoard(free);
		
		
		if (fileLists.size() == freeAttachs.size()) { // 원래 사진 갯수와 들어온 사진 갯수가 같을 경우
			log.info("원래 사진 갯수와 들어온 사진 갯수가 같을 경우");
			for(FreeAttach file : fileLists) {
				for (FreeAttach attach : freeAttachs) {
					FreeAttach fa = freeAttachRepository.findById(attach.getId()).get();
					fa.setFilename(file.getFilename());
					fa.setUploadpath(file.getUploadpath());
					fa.setUuid(file.getUuid());
					fa.setFreeBoard(free);
				} // for
			} // for
		} else { // 원래 사진 갯수와 들어온 사진 갯수가 다를 경우
			if(freeAttachs.size() == 0) { // 원래 사진 없는데 수정시 사진이 들어온 경우
				log.info("원래 사진 없는데 수정시 사진이 들어온 경우");
				for (FreeAttach file : fileLists) {
					file.setFreeBoard(free);
					freeAttachRepository.save(file);
				}
			} else if(fileLists.size() == 0) { // 원래 사진 있는데 수정시 사진이 안들어온 경우
				log.info("원래 사진 있는데 수정시 사진이 안들어온 경우");
				for (FreeAttach attach : freeAttachs) {
					freeAttachRepository.deleteById(attach.getId());
				}
			} else { // 원래 사진 있는데 수정시 원래보다 많은 갯수의 사진이 들어온 경우
				// ====================================================================== 여기서부터 실패함
				if (fileLists.size() > freeAttachs.size()) { // 원래 사진보다 많은 갯수가 들어온 경우
					log.info("원래 사진보다 많은 갯수가 들어온 경우"); 
					for (FreeAttach file : fileLists) {
						for(FreeAttach attach : freeAttachs) {
							FreeAttach fa = freeAttachRepository.findById(attach.getId()).get();
							fa.setFilename(file.getFilename());
							fa.setUploadpath(file.getUploadpath());
							fa.setUuid(file.getUuid());
							fa.setFreeBoard(free);
						}
						file.setFreeBoard(free);
						freeAttachRepository.save(file);
					}
				} else if (fileLists.size() < freeAttachs.size()) { // 원래 사진보다 적은 갯수가 들어온 경우
					log.info("원래 사진보다 적은 갯수가 들어온 경우"); 
					for(FreeAttach attach : freeAttachs) {
						for(FreeAttach file : fileLists) {
							FreeAttach fa = freeAttachRepository.findById(attach.getId()).get();
							fa.setFilename(file.getFilename());
							fa.setUploadpath(file.getUploadpath());
							fa.setUuid(file.getUuid());
							fa.setFreeBoard(free);
						}
						restAttachRepository.deleteById(attach.getId());
					} 
				}
			}
		}
	} // updateRestAndImg

	// 자유게시판 수정폼
	@Transactional
	public FreeBoard view(Long id) {
		FreeBoard freeboard = freeBoardRepository.findById(id).get();
		return freeboard;
	}

	// 자유게시판 삭제
	@Transactional
	public void delete(Long id) {
		freeAttachRepository.deleteByFreeId(id);
		freeBoardRepository.deleteById(id);
	}

	// 검색하기
	@Transactional
	public List<Restaurant> findRestaurantsByKeyword(String keyword) {
		System.out.println(keyword);
		return restaurantRepository.findRestaurantsByKeyword(keyword);
	}

	// ==========================================================

	// 리뷰 작성
	@Transactional
	public ReviewBoard insertReview(ReviewBoard reviewBoard) {
		return reviewRepository.save(reviewBoard);
	}
	
	
	// 리뷰 쓴적이 있는지 검증
	public int findReview(Long memId, Long resId) {
		ReviewBoard review = reviewRepository.findByMemberId(memId, resId );
		
		//log.info("서비스review : " +review.getContent());
		
		if (review != null) {
			return -1; // 리뷰 쓴적 있음
		}
		
		return 1; // 리뷰 쓴적 없음
	}

	/*
	@Transactional
	public void insertReviewAndImg(ReviewBoard reviewBoard, List<RestAttach> restAttachs) {

		log.info("insertReviewAndImg 탔음");

		if (restAttachs.size() == 0) {

			log.info("if restAttachs.size() : " + restAttachs.size());

			ReviewBoard re = reviewRepository.save(reviewBoard); // 이때 업데이트가 일어남 왜?
			log.info("reviewBoard id : " + re.getId());

		} else {
			log.info("else restAttachs.size() : " + restAttachs.size());

			ReviewBoard review = reviewRepository.save(reviewBoard);

			for (RestAttach attach : restAttachs) {

				log.info("review.getId() : " + review.getId());

				attach.setReviewboardId(review.getId()); // null?????????

				attach.setRestaurant(review.getRestaurant());

				restAttachRepository.save(attach);
				log.info("저장된 attach : " + attach);
			}

		}
	} // insertReviewAndImg
	*/

	@Transactional
	public void deleteReview(Long id) {
		ReviewBoard review = reviewRepository.findById(id).get();
		review.setMember(null); // 연관관계를 끊어준다
		review.setRestaurant(null);
		reviewRepository.deleteByReviewId(review.getId());
		// 사진도 지워야지
		restAttachRepository.deleteByReviewboardId(id);
		log.info("리뷰삭제서비스완");
	}
	
	// 리뷰 평점 구하기
	public Double findOneAvg(Long id) {
		return reviewRepository.findOneAvg(id);
	}

}
