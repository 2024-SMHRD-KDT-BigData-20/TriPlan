package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.PoiVO;
import com.smhrd.model.courseDAO;
import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n3PreferenceVO;

public class n11alterPlaceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[alterPlaceCon]");
		
		int mt_idx = Integer.parseInt(request.getParameter("mt_idx")); 
	    int current_poi_idx = Integer.parseInt(request.getParameter("currentPoiIdx")); 

		Gson gson = new Gson();
		Integer[][] currentCourse = gson.fromJson(request.getParameter("updatedSchedule"), Integer[][].class);

		System.out.println(Arrays.deepToString(currentCourse) + "\n " + current_poi_idx);

		//int current_poi_idx = Integer.parseInt(request.getParameter("poi_idx"));
		//int next_poi_idx=

		//saveItemOrder배열에서 current - first - second define

		int prev_poi_idx=current_poi_idx;
		int next_poi_idx=current_poi_idx;
		int first_poi_idx=current_poi_idx;
		int second_poi_idx=current_poi_idx;

		int idx1st;
		int idx2nd;
		int period = currentCourse.length;//getParameter("period")
		for(int i=0; i<period; i++) {
			int daySize=currentCourse[i].length;
			for(int j=0; j<daySize;j++) {
				int p =currentCourse[i][j];
				if( p==current_poi_idx ) {
					idx1st=i;
					idx2nd=j;
					if(j!=0) {
						prev_poi_idx = currentCourse[i][j-1];
						/*
						 * }else if(i!=0) { prev_poi_idx =
						 * currentCourse[i-1][currentCourse[i-1].length];
						 */
					}else {
						prev_poi_idx=current_poi_idx;
					}
					if(j<daySize-1) {
						next_poi_idx=currentCourse[i][j+1];
					}else if(i<period-1){
						next_poi_idx=currentCourse[i+1][0];
					}else{
						next_poi_idx=current_poi_idx;
					}
				}
			}
		}
		
		System.out.println(prev_poi_idx);
		System.out.println(next_poi_idx);
		courseDAO dao=new courseDAO();
		//ArrayList<PoiVO> p = dao.POIsInCurrentCourse(?);
		PoiVO currentP=dao.alterTag(current_poi_idx);
		PoiVO prevP=dao.alterTag(prev_poi_idx);
		PoiVO nextP=dao.alterTag(next_poi_idx);
		
	

		//select * from poi_info where poi_idx

		double min_lat=33.1142;
		double max_lat=34;
		
		
		min_lat=prevP.getPoi_lat();
		System.out.println("1"+min_lat);
		if(nextP.getPoi_lat()<prevP.getPoi_lat()) {
			min_lat=nextP.getPoi_lat();
			System.out.println("nextLat"+min_lat);
		}else {
			max_lat=nextP.getPoi_lat();
			System.out.println("nextLatMax"+max_lat);
		}

		double min_lng=126.163;
		double max_lng=126.969;
		if(nextP.getPoi_lng()<prevP.getPoi_lng()) {
			min_lng=nextP.getPoi_lng();
		}else {
			max_lng=nextP.getPoi_lng();
		}

		//current poi tag에서 가장 많이 반복되는 태그 찾아내기
        // 문장을 단어로 분할하여 배열에 저장
		String[] tags = currentP.getPoi_tag().split("#");
		n1UserDAO userDao = new n1UserDAO();
		n3PreferenceVO preferenceVO = userDao.PreferenceToPrint("jinnie");
		System.out.println("선호도 확인: " + preferenceVO);
		String preference = preferenceVO.getPoi();

		String[] PoiTag = preference.split("#");

		ArrayList<String> tagList = new ArrayList<>();

		// currentP.getPoi_tag()로부터 가져온 태그를 리스트에 추가
		for (String tag : tags) {
		    if (tag != null && !tag.isEmpty()) {
		        tagList.add(tag);
		    }
		}

		// preferenceVO.getPoi()로부터 가져온 태그를 리스트에 추가
		for (String tag : PoiTag) {
		    if (tag != null && !tag.isEmpty()) {
		        tagList.add(tag);
		    }
		}
		
		for(String tag:tagList) {
			System.out.println(tag);
		}

		/*
		 * // 각 단어의 등장 횟수를 저장할 Map 생성 Map<String, Integer> wordCountMap = new
		 * HashMap<>();
		 * 
		 * // 단어의 등장 횟수를 세기 for (String word : tagList) { // 소문자로 변환하여 통일성 유지 word =
		 * word.toLowerCase(); // Map에 해당 단어가 이미 존재하면 등장 횟수를 1 증가시키고, 존재하지 않으면 1로 초기화
		 * wordCountMap.put(word, wordCountMap.getOrDefault(word, 0) + 1); }
		 * 
		 * // 빈도수가 높은 순으로 정렬하기 위해 List로 변환 List<Map.Entry<String, Integer>> wordList =
		 * new ArrayList<>(wordCountMap.entrySet());
		 * 
		 * // 빈도수가 높은 순으로 정렬 Collections.sort(wordList, (a, b) ->
		 * b.getValue().compareTo(a.getValue())); // 상위 3개의 단어를 변수에 저장 List<String>
		 * topTagsNPreference = new ArrayList<>(); int count = 0; for (Map.Entry<String,
		 * Integer> entry : wordList) { if (count < 3) {
		 * topTagsNPreference.add(entry.getKey()); count++; } else { break; } }
		 * 
		 * for (Map.Entry<String, Integer> entry : wordCountMap.entrySet()) { String key
		 * = entry.getKey(); Integer value = entry.getValue();
		 * System.out.println("Key: " + key + ", Value: " + value); }
		 * 
		 * 
		 * //select * from user_preference where user_id = jinnie;
		 */        
       System.out.println(min_lat);
       System.out.println(max_lat);
       System.out.println(min_lng);
       System.out.println(max_lng);

        
        Map<String, Object> params = new HashMap<>();
        params.put("tagList", tagList);
        params.put("min_lat", min_lat);
        params.put("max_lat", max_lat);
        params.put("min_lng", min_lng);
        params.put("max_lng", max_lng);

        
        List<PoiVO> alterPoi = dao.alterPlace(params);
        
		System.out.println(alterPoi);
		String res = gson.toJson(alterPoi);
		System.out.println("json 결과 확인" +res);
		
		response.setCharacterEncoding("utf-8");
        
        PrintWriter out = response.getWriter();
		



			out.print(res);
			System.out.println("alterPlaceCon성공");
        //select * from tags where cat in (#{item}반복)        

        //select
        //foreach as count
        
        //where poi_lat<max_lat and poi_lat>min_lat and poi_lng<max_lng and poi_lng>min_lng order by count desc
        //
       

		//현재 장소와 다음 장소 사이에서 불러온 장소들 태그 점수 계산해서 제곱, 선호도 태그 점수 계산 *1


		//poi 태그, 위도&경도 가져오기 - 스케쥴맵에서 받아오기?
		//다음 장소 위도&경도로 먼저 걸러오기

		//id나눈 몫에 따라 대조할 테이블 정하기
		//poi태그 스플릿한 태그 스트링 리스트에 담기
		//프리퍼런스 태그도 활용

		//태그 카운트 
		//대조할 테이블에서 위도 경도 범위 조건 걸고, 태그 카운트 높은 순으로 

		//select * from _info where lat<(lat+0.02) and lat>(lat-0.02) and lng<(lng+0.02) and lng>(lng-0.02)

		//List<PoiVO> poiVO = dao.alterPlace(poi_idx);



	}

}
