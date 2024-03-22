package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.PoiVO;
import com.smhrd.model.autoCourseVO;
import com.smhrd.model.courseDAO;
import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n3PreferenceVO;
import com.smhrd.model.n5CreateScheduleVO;
import com.smhrd.model.n7TourCourseVO;

public class n8FindMatchingTripCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[FindMatchingTrip]");
		
		HttpSession session = request.getSession();
		System.out.println("[Session오픈]");
		n5CreateScheduleVO scheduleVO = (n5CreateScheduleVO)session.getAttribute("scheduleVO");
		System.out.println("[scheduleVO]");
		n1UserVO loginUser = (n1UserVO)session.getAttribute("loginUserVO");
//		n3PreferenceVO preferenceVO = (n3PreferenceVO)session.getAttribute("tripPreferenceVO");//confirmPreference완료 되면 주석 풀기
		n1UserDAO userDao = new n1UserDAO();
		n3PreferenceVO preferenceVO = (n3PreferenceVO) userDao.PreferenceToPrint(loginUser.getUser_id());
		
		String startDate = scheduleVO.getMt_st_dt();
		String endDate = scheduleVO.getMt_ed_dt();
		
		int period = 4;//수정 필요
		System.out.println("날짜 빼기 해서 period 구하는 식으로 수정!!");
		
		//select * from tour_course_info where bc_period = #{period}
		courseDAO dao = new courseDAO();
		System.out.println("코스 다오 불러옴");
		List<n7TourCourseVO> PotentialMatches = dao.courseMatchingBasicReq(period); //메서드 작성 필요
		System.out.println("리스트 확인" + PotentialMatches);
		//PotentialMatchies마다
		//코스 아이디 불러와서 allIdx에 저장
		String[] PoiPreference = preferenceVO.getPoi().split("#");
		String[] FoodPreference = preferenceVO.getFood().split("#");
		String[] SleepPreference = preferenceVO.getSleep().split("#");
		
		System.out.println("프리 확인 " + Arrays.toString(SleepPreference));
		
		ArrayList<Integer> allIdx = new ArrayList<>();
		for(n7TourCourseVO p : PotentialMatches) {
			allIdx.add(p.getBc_idx());
		}
		
		
		List<List<Integer>> POI = new ArrayList();
		List<List<Integer>> Food = new ArrayList();
		List<List<Integer>> Sleep = new ArrayList();
		List<List<Integer>> Shopping = new ArrayList();
		
		List<List<autoCourseVO>> POIsAllCourses = new ArrayList();
		
		for (int idx : allIdx) {
		    List<autoCourseVO> POIs = dao.POIsInPotentialMatch(idx);
		    String places = "";
		    for (int i = 0; i < POIs.size(); i++) {
		        autoCourseVO p = POIs.get(i);
		        if (i != 0) { // 첫 번째 p가 아닌 경우에만 "-" 추가
		            places += "-";
		        }
		        places += p.getBc_course();
		    }
		    String[] POIsIdxStr = POIsInTheCourse.split("-");
		}
		
		
		System.out.println(400001/100000);

		List<Integer> POIsIdx = new ArrayList();

		for(n7TourCourseVO course:PotentialMatches) {
			System.out.println("반복문");
			int bc_idx = course.getBc_idx();
			System.out.println("a");
			List<autoCourseVO> POIs = dao.POIsInPotentialMatch(bc_idx);
			String POIsInTheCourse="";
			System.out.println("POIsInThECourse 생성 확인");
			for(autoCourseVO poi:POIs) {
				System.out.println("반복문2");
				//코스에 포함된 모든 장소 한 스트링에 담기
				POIsInTheCourse += "-"+poi.getBc_course();//다음 단계인 스플릿에서 '-' 를 구분자로 쓰게 담겨 있기 때문에 더해줌
			}
			System.out.println("반복문2끝");
			String[] POIsIdxStr = POIsInTheCourse.split("-");
			System.out.println("POIsIdxStr"+Arrays.toString(POIsIdxStr));
			for(String p: POIsIdxStr) {
				System.out.println("반복문3");
			    if (!p.isEmpty()) { // 빈 문자열이 아닌 경우에만 변환하여 추가
			        POIsIdx.add(Integer.parseInt(p.trim()));
			    }
			}
			System.out.println("반복문3 끝");
		}
		System.out.println("반복문1끝");

		
		System.out.println("아싸"+POIsIdx);
		
		//쇼핑 4, hotel 3, 레스토랑 2 poi 1 
		
		for(int p: POIsIdx) {
			System.out.println("반복문4");
			if(p/100000 > 4) {
				System.out.println("쇼핑!");
				Shopping.add(p);				
			}else if(p/100000 > 3) {
				System.out.println("음식!");
				Food.add(p);
			}else if(p/100000 > 2) {
				System.out.println("쇼핑!");
				Sleep.add(p);
			}else if(p/100000 > 1) {
				System.out.println("쇼핑!");
				Shopping.add(p);
			}else {
				System.out.println("Out Of Range");
			}
		}
		
		System.out.println(Shopping);
		/*
		 * for(String pfPOI:PoiPreference) {
		 * 
		 * }
		 */
		
		/*여기지우기
		//후보 코스의 상세 코스만 불러와 StrPOIsInPotentialMatch에 저장 - allIdx와 같은 length
		//현재 상세 코스는 일차별로 100001(관광지1번) - 100002(관광지2번) - .... 식으로 담겨 있음
		//select bc_idx, bc_course from DAILY_SCHEDULE_INFO where bc_idx = #{bc idx}
		ArrayList<String> StrPOIsInPotentialMatch = new ArrayList<>();
		for(int idx:allIdx) {
			//상세코스 불러오기
			//select bc_course from daily_schedule_info where bc_idx = #{<%=allIdx.get(i)%>}
			List<PoiVO> POIs = dao.POIsInPotentialMatch();//메서드 작성 필요
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
		
		Map<Integer, Integer> countMap = new HashMap<>();
		//create view 
		//PoiTags
//		CREATE VIEW view_name AS tags

		for(int i = 0; i<IntPOIsInPotentialMatch.size(); i++) {
			List<Integer> POIs = IntPOIsInPotentialMatch.get(i);
			/*
			 * } for(List<Integer> POIs:IntPOIsInPotentialMatch) {
			 */
/*여기지우기			List<PoiVO> TagsPerPoi = dao.TagsPerPoi(POIs);
			String tags = "";
			for(PoiVO t: TagsPerPoi) {
				tags += "#"+t;
			}
			int cnt = 0;
			
			//장소별 태그 불러오기
			for(String p: PoiPreference) {
				if(tags.contains(p)){
					cnt+=1;
				}
			}
			for(String f: FoodPreference){
				if(tags.contains(f)){
					cnt+=1;
				}
			}
			for(String s: SleepPreference){
				if(tags.contains(s)){
					cnt+=1;
				}
			}
			System.out.println(allIdx.get(i) + " " + cnt);
			countMap.put(allIdx.get(i), cnt);
		}
		
		System.out.println(countMap);
		
		// 가장 큰 값을 가진 키와 해당 값을 추적하기 위한 변수
		int maxKey = -1; // 예외 처리를 위해 초기값을 -1로 설정
		int maxValue = Integer.MIN_VALUE; // 최소값으로 초기화

		// Map 반복하여 최대값 찾기
		for (Map.Entry<Integer, Integer> entry : countMap.entrySet()) {
		    int currentKey = entry.getKey();
		    int currentValue = entry.getValue();
		    
		    // 현재 값이 최대값보다 크면 최대값과 해당 키를 업데이트
		    if (currentValue > maxValue) {
		        maxKey = currentKey;
		        maxValue = currentValue;
		    }
		}

		// 최대값을 가진 키 출력
		System.out.println("가장 큰 값의 키: " + maxKey);
		
		session.setAttribute("MatchingCourse", maxKey);
		
		/*
		 * List<String> tagsList = new ArrayList<>();
		 * 
		 * String tags = "";
		 * 
		 * 
		 * //코스별로 장소 유형별로 정리, 비교 //매칭하는 경우 cnt++ int CntPOI = 0; int CntFood = 0; int
		 * CntSleep = 0;
		 */
		
	}

}
