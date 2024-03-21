package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.autoCourseVO;
import com.smhrd.model.courseDAO;
import com.smhrd.model.n3PreferenceVO;
import com.smhrd.model.n5CreateScheduleVO;

public class n8FindMatchingTripCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		n5CreateScheduleVO scheduleVO = (n5CreateScheduleVO)session.getAttribute("ScheduleVO");
		n3PreferenceVO preferenceVO = (n3PreferenceVO)session.getAttribute("tripPreferenceVO");
		
		String startDate = scheduleVO.getMt_st_dt();
		String endDate = scheduleVO.getMt_ed_dt();
		
		int period = 4;//수정 필요
		System.out.println("날짜 빼기 해서 period 구하는 식으로 수정!!");
		
		//select * from tour_course_info where bc_period = #{period}
		courseDAO dao = new courseDAO();
		List<autoCourseVO> PotentialMatches = dao.courseMatchingBasicReq(period); //메서드 작성 필요
		
		//PotentialMatchies마다
		//코스 아이디 불러와서 allIdx에 저장
		ArrayList<Integer> allIdx = new ArrayList<>();
		for(autoCourseVO course:PotentialMatches) {
			int Bc_idx = course.getBc_idx();
			allIdx.add(Bc_idx);
		}
		
		//후보 코스의 상세 코스만 불러와 StrPOIsInPotentialMatch에 저장 - allIdx와 같은 length
		//현재 상세 코스는 일차별로 100001(관광지1번) - 100002(관광지2번) - .... 식으로 담겨 있음 
		ArrayList<String> StrPOIsInPotentialMatch = new ArrayList<>();
		for(int idx:allIdx) {
			//상세코스 불러오기
			//select bc_course from daily_schedule_info where bc_idx = #{<%=allIdx.get(i)%>}
			List<String> POIs = dao.POIsInPotentialMatch();//메서드 작성 필요
			String POIsInTheCourse = "";
			for(String poi:POIs) {
				//코스에 포함된 모든 장소 한 스트링에 담기
				POIsInTheCourse += "-"+poi;//다음 단계인 스플릿에서 '-' 를 구분자로 쓰게 담겨 있기 때문에 더해줌
			}
			StrPOIsInPotentialMatch.add(POIsInTheCourse);
		}
		//정수 인덱스로 장소 정보 불러오는 데 사용할 수 있게 스플릿 하고 형변환 - allIdx와 같은 length
		List<List<Integer>> IntPOIsInPotentialMatch = new ArrayList<>();
		for(String POIs : StrPOIsInPotentialMatch) {
			String[] POIstr = POIs.split("-");
			List<Integer> POIint = new ArrayList<>();
			for(String POI : POIstr) {
				int poi = Integer.parseInt(POI);
				POIint.add(poi);
			}
			IntPOIsInPotentialMatch.add(POIint);
		}
		//preferenceVO에 있는 선택한 태그 불러오기
		String[] PoiPreference = preferenceVO.getPoi().split("#");
		String[] FoodPreference = preferenceVO.getFood().split("#");
		String[] SleepPreference = preferenceVO.getSleep().split("#");
		
		//장소별 태그 불러오기
		//create view 
//		CREATE VIEW view_name AS tags
//		SELECT poi_idx, poi_name, poi_tag
//		FROM poi_info
//		WHERE poi_idx = #{poi1} or poi_idx = #{poi2} or ... or poi_idx = #{poiN};
		
		for(List<Integer> POIs:IntPOIsInPotentialMatch) {
			String where = "Where ";
			for(int poi: POIs) {
				//where += "poi_idx = #{"+(String)poi+"}";
			}
		}
		
		List<String> tagsList = new ArrayList<>();
		
		String tags = "";
		
		
		//코스별로 장소 유형별로 정리, 비교
		//매칭하는 경우 cnt++
		int CntPOI = 0;
		int CntFood = 0;
		int CntSleep = 0;
		
	}

}