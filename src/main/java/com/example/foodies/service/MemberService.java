package com.example.foodies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.foodies.model.Bookmark;
import com.example.foodies.model.BookmarkDTO;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.member.LoginReqDTO;
import com.example.foodies.model.member.Member;
import com.example.foodies.model.member.Role;
import com.example.foodies.repository.BookmarkRepository;
import com.example.foodies.repository.CommentRepository;
import com.example.foodies.repository.FreeAttachRepository;
import com.example.foodies.repository.FreeBoardRepository;
import com.example.foodies.repository.MemberRepository;
import com.example.foodies.repository.RestaurantRepository;
import com.example.foodies.repository.ReviewRepository;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@AllArgsConstructor
@Service
public class MemberService {
	@Autowired
	private BookmarkRepository bookmarkRepository;

	@Autowired
	private RestaurantRepository boardRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private FreeBoardRepository freeBoardRepository;
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private FreeAttachRepository freeAttachRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;

	// 아이디 중복검사를 위함
	public int findByUsername(String username) {
		Member member = memberRepository.findByUsername(username);
		// System.out.println(member);
		if (member != null) {
			return 1; // 아이디 있는 경우
		}

		return -1; // 아이디 없는 경우
	}

	// 회원가입
	@Transactional
	public void register(Member member) {
		// 비밀번호 암호화
		String rawPW = member.getPassword();
		String encPW = encoder.encode(rawPW);

		member.setPassword(encPW);

		// 권한 부여
		// 관리자계정의 username에는 admin뭐시기 가 들어간다고 가정
		if (member.getUsername().contains("admin")) {
			member.setRole(Role.ROLE_Manager);
		} else {
			member.setRole(Role.ROLE_Member);

		}
		memberRepository.save(member);

	}

	// 비밀번호 찾기?
	public int matchPassword(LoginReqDTO loginReqDTO) {
		// System.out.println(username);
		Member member = memberRepository.findById(loginReqDTO.getId()).get();

		if (!encoder.matches(loginReqDTO.getPassword(), member.getPassword())) {
			return -1; // 비밀번호 불일치
		} else {
			return 1; // 비밀번호 일치
		}

	}

	// 멤버 찾기
	@Transactional
	public Page<Member> findAll(Pageable pageable) {

		return memberRepository.findAll(pageable);
	}

	// 아이디로 찾기
	public Member findById(Long id) {
		return memberRepository.findById(id).get();
	}

	// 회원정보수정
	@Transactional
	public void update(Member member) {
		Member mem = memberRepository.findByUsername(member.getUsername());
		// 비밀번호 암호화
		String rawPW = member.getPassword();
		String encPW = encoder.encode(rawPW);

		mem.setPassword(encPW);
		mem.setEmail(member.getEmail());
		mem.setGender(member.getGender());
		mem.setAge(member.getAge());
		System.out.println("mem : " + mem);
	}

	// 탈퇴하기
	@Transactional
	public void delete(Long id) {
		// 연관관계 삭제해줌
		bookmarkRepository.deleteByMemberId(id);
		freeBoardRepository.deleteByMemberId(id);
		freeAttachRepository.deleteByFreeId(id);
		reviewRepository.deleteByMemberId(id);
		commentRepository.deleteByMemberId(id);
		memberRepository.deleteById(id);
	
	}

	// 좋아요 등록
	@Transactional
	public void bookmark(BookmarkDTO bookmarkDTO) {
		Restaurant restaurant = boardRepository.findById(bookmarkDTO.getResId()).get();
		Member member = memberRepository.findByUsername(bookmarkDTO.getMember());

		log.info("서비스 member : " + member);

		Bookmark bookmark = new Bookmark().builder().member(member).restaurant(restaurant).build();

		bookmarkRepository.save(bookmark);
	}

	// 사용자 찜한 목록 보기
	public List<Bookmark> findByMemberId(Long id) {
		return bookmarkRepository.findByMemberId(id);
	}

	public List<Bookmark> findByRestaurantId(Long id) {
		return bookmarkRepository.findByRestaurantId(id);
	}

	// 찜 여부 확인
	public Bookmark getBookmark(Long memId, Long resId) {
		return bookmarkRepository.findByMemAndRest(memId, resId);
	}

	// 찜 된 갯수
	public int findCountBookmark(Long resId) {
		return bookmarkRepository.findCountBookmark(resId);
	}

	// 찜 취소
	@Transactional
	public void deleteByBookmarkId(Long id) {
		Bookmark bookmark = bookmarkRepository.findById(id).get();
		bookmark.setMember(null);
		bookmark.setRestaurant(null);
		bookmarkRepository.deleteById(id);
	}

	// 북마크 삭제 (회원탈퇴시)
	public void deleteByMemberId(Long id) {
		bookmarkRepository.deleteByMemberId(id);
	}

}
