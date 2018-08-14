package com.spring.pension.domain;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class WeatherCrolling{
	
	
	public Elements getWeahterText() throws Exception {
		
		String URL = "https://weather.naver.com/rgn/cityWetrMain.nhn"; // 긁어올 페이지
		
		Document doc = Jsoup.connect(URL).get();
		
		Elements elem = doc.select(".tbl_weather tbody>tr:nth-child(1)"); // 태그까지 모두 긁어옴
		
		String[] str = elem.text().split(" "); //tbody의 첫번째 텍스트만 긁어옴 
		
		for(int i = 0; i<str.length;i++) {
			
			System.out.println("크롤링 해오는 것들 " + str[i]);
		}
			
		
		return elem;
		
	}
	
		
}
