package com.example.foodies.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodies.model.Restaurant;


@Service
public class ApiTestService {
	
	// 디비에 값 넣고 꼭 지우세요!!!!!!
	@Autowired
	private ApiTestRepository apiTestRepository;
	
	public void dataParse() {
		try {
			// 인증키값
			String serialKey = "rKyzRRphHPRl6e3E9COq4s88P1oHyXxniotNKn%2BmOvZryqw0m3ElKZSzP3HQwBXDB7eBtylBImIlOzRsv16X4Q%3D%3D";

			String urlStr = "http://apis.data.go.kr/6260000/FoodService/getFoodKr";
			urlStr += "?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serialKey;
			urlStr += "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + 180; // 한번에 불러들일 개수입니다! 
			urlStr += "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + 1;
			urlStr += "&" + URLEncoder.encode("resultType", "UTF-8") + "=" + "json";

			URL url = new URL(urlStr);

			String line = "";
			String result = "";

			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			while ((line = br.readLine()) != null) {
				result = result.concat(line);
				// System.out.println("line = " + line);
				// System.out.println("result = " + result);
			}

			// JSON parser 만들어 문자열 데이터를 객체화한다.
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result); // map 형태

			System.out.println(obj.get("getFoodKr"));
			JSONObject obj2 = (JSONObject) obj.get("getFoodKr");
			JSONArray jsonArr = (JSONArray) obj2.get("item");
			System.out.println(jsonArr);

			for (int i = 0; i < jsonArr.size(); i++) {
				JSONObject obj3 = (JSONObject) jsonArr.get(i);

				String addr1 = (String) obj3.get("ADDR1");
				String cntctTel = (String) obj3.get("CNTCT_TEL");
				String itemcntnts = (String) obj3.get("ITEMCNTNTS");
				String img = (String) obj3.get("MAIN_IMG_NORMAL"); // 얘네는 사진 테이블에 담겨야함
				String thumb = (String) obj3.get("MAIN_IMG_THUMB"); // 얘네는 사진 테이블에 담겨야함
				String mainTitle = (String) obj3.get("MAIN_TITLE");
				String rprsntvMenu = (String) obj3.get("RPRSNTV_MENU");
				String usageDayWeekAndTime = (String) obj3.get("USAGE_DAY_WEEK_AND_TIME");

				Restaurant restaurant = new Restaurant().builder()
										.id(null)
										.mainTitle(mainTitle)
										.addr1(addr1)
										.cntctTel(cntctTel)
										.itemcntnts(itemcntnts)
										.mainImgNormal(img)
										.mainImgThumb(thumb)
										.rprsntvMenu(rprsntvMenu)
										.usageDayWeekAndTime(usageDayWeekAndTime)
										.build();
				
										
				System.out.println(restaurant);
				apiTestRepository.save(restaurant);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
