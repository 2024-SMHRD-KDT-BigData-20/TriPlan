package com.smhrd.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.smhrd.model.courseDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class n14UpdateScheduleCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[UpdateScheduleCon]");

		/* String schedule = request.getParameter("updatedSchedule"); */
		/*
		 * ObjectMapper objectMapper = new ObjectMapper(); List<List<String>> schedule =
		 * objectMapper.readValue(request.getInputStream(), new
		 * TypeReference<List<List<String>>>(){});
		 */
		Gson gson = new Gson();
		Integer[][] updatedSchedule = gson.fromJson(request.getParameter("updatedSchedule"), Integer[][].class);
		
		System.out.println("ArraysRes확인" + Arrays.deepToString(updatedSchedule));
		
		courseDAO dao = new courseDAO();
				
		for(int j = 0; j<updatedSchedule.length;j++) {
			int day = j+1;
			String daySchedule = "";
			for(int i=0; i<updatedSchedule[j].length; i++) {
				daySchedule += "-" + updatedSchedule[i];
			}
			
			//update my_daily_schedule_info set mt_course = #{daySchedule} where mt_idx = #{mt_idx} and DAY_SCHE = #{day}
		}
		

		
		
		
		
		//코스를 스트링 (장소1- 장소2 - 장소3- ... - 장소X) String으로 한 칼럼에 저장하는 방식이 칼럼 여러개에 한 장소씩 저장하는 것보다 업데이트 간편할 듯
		//불러와 쓸때는 여러 칼럼에 한 장소씩 저장되어 있는 게 더 간편하긴 할 것으로 생감됨
		//여러 칼럼에 각 칼럼마다 한 장소 저장: 
		//일정관리 화면에서 update 사용 빈도가 일정관리 화면 최초 로드를 위해 loadschedule하는 것보다 많으므로 String 방식 채택
		/*
		 * ObjectMapper objectMapper = new ObjectMapper();
		 * 
		 * List<List<Integer>> resultList = objectMapper.readValue(s, new
		 * TypeReference<List<List<Integer>>>(){});
		 * 
		 * System.out.println("리스트 확인" + resultList.get(0));
		 */
		/*
		 * int period = 4; Map<String, Integer> map = new HashMap<>();
		 * 
		 * for(int i = 0; i<period; i++) { System.out.println("Day" + i);
		 * 
		 * String name = "map"+i; Map<String,Integer> name = new HashMap<>();
		 * 
		 * for(int j = 0; i<res[i].length; j++) { String key = "place" + j; int idx = 0;
		 * System.out.println(0); if(res[i][j] >0) { idx = res[i][j];
		 * System.out.println(j+"번째" + idx); }else { idx = -1; } map.put(key,idx); } }
		 * 
		 * map.forEach((key, value) -> System.out.println("map갑 확인 "+key + " : " +
		 * value));
		 */

	}

}
