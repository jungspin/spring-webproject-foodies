package com.example.foodies.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.example.foodies.model.RestAttach;

@Component
public class MultipartModule {
	
	private String getDateFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str;

	}
	
	public List<RestAttach> imgUpload(HttpServletRequest request, List<MultipartFile> files) throws IllegalStateException, IOException{
		if (files != null) {
			System.out.println("files : " + files);
		
		}

		ServletContext application = request.getServletContext();
		String realpath = application.getRealPath("/resources/upload"); // 실제 경로를 가져옴

		// 폴더 동적 생성하기 /resources/upload/2021/06/15
		File uploadPath = new File(realpath, getDateFolder());

		if (!uploadPath.exists()) { // 실제 해당경로가 존재하는지
			uploadPath.mkdirs();
		}

		List<RestAttach> attachList = new ArrayList<RestAttach>();

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}

			String originalFileName = multipartFile.getOriginalFilename(); // 실제 사용자가 업로드한 파일이름
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString() + "_" + originalFileName; // 중복을 피하기 위해서

			// 실제 파일 1개 업로드 수행 완료
			multipartFile.transferTo(new File(uploadPath, uploadFileName)); // 귀찮은 일은 스프링이 해주니까 예외 던져버림

			RestAttach restAttach = new RestAttach().builder()
									.uuid(uuid.toString())
									.filename(originalFileName)
									.uploadpath(getDateFolder())
									.build();

			attachList.add(restAttach);
	}
		return attachList;
	}
}
