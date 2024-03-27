package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.PoiVO;
import com.smhrd.model.autoCourseVO;
import com.smhrd.model.courseDAO;
import com.smhrd.model.myCourseVO;
import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n3PreferenceVO;
import com.smhrd.model.n5CreateScheduleVO;
import com.smhrd.model.n7TourCourseVO;
import com.smhrd.model.tagInfoVO;

public class n8FindMatchingTripCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[FindMatchingTrip]");

		HttpSession session = request.getSession();
		SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
		Gson gson = new Gson();
		System.out.println("[Session오픈]");
		n5CreateScheduleVO scheduleVO = (n5CreateScheduleVO)session.getAttribute("scheduleVO");
		System.out.println("[scheduleVO]");
		n1UserVO loginUser = (n1UserVO)session.getAttribute("loginUserVO");
		//		n3PreferenceVO preferenceVO = (n3PreferenceVO)session.getAttribute("tripPreferenceVO");//confirmPreference완료 되면 주석 풀기
		n1UserDAO userDao = new n1UserDAO();
		String user_id = loginUser.getUser_id();
		n3PreferenceVO preferenceVO = (n3PreferenceVO) userDao.PreferenceToPrint(user_id);
		System.out.println(preferenceVO);
		String start = scheduleVO.getMt_st_dt();
		String end = scheduleVO.getMt_ed_dt();
		int period = 0;
		try {
			Date startDate = dates.parse(start);
			Date endDate = dates.parse(end);
			long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
			double diffDays = (double) diffSec / (60 * 60 * 24);
		    period = (int) Math.ceil(diffDays)+1;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int mt_idx = scheduleVO.getMt_idx();
		
		System.out.println("period 확인: "+period);

		courseDAO dao = new courseDAO();
		System.out.println("코스 다오 불러옴");
		List<n7TourCourseVO> PotentialMatches = dao.courseMatchingBasicReq(period); //메서드 작성 필요
		//select * from tour_course_info where bc_period = #{period}
		System.out.println("리스트 확인" + PotentialMatches);
		//PotentialMatchies마다
		//코스 아이디 불러와서 allIdx에 저장
		String[] PoiPreference = preferenceVO.getPoi().split("#");
		String[] FoodPreference = preferenceVO.getFood().split("#");
		String[] SleepPreference = preferenceVO.getSleep().split("#");
		String people = preferenceVO.getPeople();
		System.out.println("프리 확인 " + Arrays.toString(PoiPreference));
		ArrayList<Integer> allIdx = new ArrayList<>();
		for(n7TourCourseVO p : PotentialMatches) {
			allIdx.add(p.getBc_idx());
		}


		List<List<Integer>> POI = new ArrayList();
		List<List<Integer>> Food = new ArrayList();
		List<List<Integer>> Sleep = new ArrayList();
		List<List<Integer>> Shopping = new ArrayList();

		List<String[]> POIsAllCourses = new ArrayList();
		List<Integer[]> IntPOIs = new ArrayList();

		/*
		 * SELECT a.bc_idx , a.bc_period , b.day , b.bc_course FROM TOUR_COURSE_INFO a
		 * INNER JOIN DAILY_SCHEDULE_INFO b ON a.bc_idx = b.bc_idx where a.bc_idx = 5;
		 */


		//각 코스마다 상세 코스에 든 장소 인덱스 한 스트링으로 합쳐 POIsAllCourses에 배열로 삽입 		
		for (int idx : allIdx) {
			System.out.println("반복문1 시작");
			List<autoCourseVO> POIs = dao.POIsInPotentialMatch(idx);
			//select d_sche_idx, bc_idx, bc_course from DAILY_SCHEDULE_INFO where bc_idx = #{bc idx}
			String places = "";
			for (int i = 0; i < POIs.size(); i++) {
				autoCourseVO p = POIs.get(i);
				if (i != 0) { // 첫 번째 p가 아닌 경우에만 "-" 추가
					places += "-";
				}
				places += p.getBc_course();
			}
			String[] POIsIdxStr = places.split("-");
			POIsAllCourses.add(POIsIdxStr);
		}
		System.out.println("반복문1끝: " + POIsAllCourses);

		//Str -> Int idx 형변환
		for(int i = 0; i<POIsAllCourses.size();i++) {
			String [] strIdx = POIsAllCourses.get(i);
			System.out.println("반복문2 " + (i+1)+"번쨰" + allIdx.get(i) + Arrays.toString(strIdx));
			Integer[] intIdx = new Integer[strIdx.length];
			for(int j = 0; j< strIdx.length; j++) {
				System.out.println("반복문3 " + (j+1) +"번째");
				String[] numbers = strIdx[j].split(",\\s*");
				for (String number : numbers) {
					intIdx[j]=Integer.parseInt(number);
				}
			}
			IntPOIs.add(intIdx);
		}
		System.out.println("반복문3끝: " + IntPOIs.get(0)[0]);
		for(Integer[] pois:IntPOIs) {
			System.out.println(Arrays.toString(pois));
		}

		//각 POI에 든 태그 모두 합치기
		//장소 유형별로? 일단 그냥 무조건 합치기
		List<String> courseTags = new ArrayList<>();



		for(Integer[] pois:IntPOIs) {
			System.out.println("반복문 4 시작");
			String tags = "";
			for(int i=0;i<pois.length;i++) {
				int poi_idx = pois[i];
				System.out.println("인덱스 확인: "+poi_idx);
				if(i!=0) {
					tags+="#";
				}
				tags += dao.TagsPerPoi2(poi_idx).getPoi_tag();
			}
			courseTags.add(tags);
		}

		/*
		 * for(List<Integer> pois: IntPOIs) { List<PoiVO> POItag = dao.TagsPerPoi(pois);
		 * String tags = ""; for(int i = 0; i< POItag.size(); i++) { if(i!=0) {
		 * tags+="#"; } tags+=POItag.get(i).getPoi_tag(); } courseTags.add(tags); }
		 */

		System.out.println("반복문4 끝");

		Map<Integer,Integer> courseScore = new HashMap<>();

		for(int i=0; i<courseTags.size();i++) {
			int cnt = 0;
			System.out.println("반복문5");
			int bc_idx = allIdx.get(i);
			String tags = courseTags.get(i);
			for(String pfPOI: PoiPreference) {
				// str2에서 str1이 더 이상 발견되지 않을 때까지 반복
				List<tagInfoVO> relatedTags = dao.relatedTags(pfPOI);
				for(tagInfoVO vo:relatedTags) {
					String relatedTag = vo.getTag_name();
					int index = tags.indexOf(relatedTag); // str2에서 str1이 처음으로 나타나는 인덱스를 찾음
					if(index!=-1) {
						cnt+=2;
						System.out.println(pfPOI + cnt);
						System.out.println(tags);
						System.out.println(index);
						tags=tags.substring(index+2);
					}
				}
			}for(String pfFood: FoodPreference) {
				// str2에서 str1이 더 이상 발견되지 않을 때까지 반복
				tags = courseTags.get(i);
				List<tagInfoVO> relatedTags = dao.relatedTags(pfFood);
				for(tagInfoVO vo:relatedTags) {
					String relatedTag = vo.getTag_name();
					int index = tags.indexOf(relatedTag); // str2에서 str1이 처음으로 나타나는 인덱스를 찾음
					if(index!=-1) {
						cnt++;
						tags=tags.substring(index+2);
					}
				}
			}for(String pfSleep: SleepPreference) {
				// str2에서 str1이 더 이상 발견되지 않을 때까지 반복
				tags = courseTags.get(i);
				List<tagInfoVO> relatedTags = dao.relatedTags(pfSleep);
				for(tagInfoVO vo:relatedTags) {
					String relatedTag = vo.getTag_name();
					int index = tags.indexOf(relatedTag); // str2에서 str1이 처음으로 나타나는 인덱스를 찾음
					if(index!=-1) {
						cnt++;
						tags=tags.substring(index+2);
					}
				}
			}tags = courseTags.get(i);
			int index = tags.indexOf(people); // str2에서 str1이 처음으로 나타나는 인덱스를 찾음
			if(index!=-1) {
				cnt++;
				tags=tags.substring(index+2);
			}
			courseScore.put(bc_idx, cnt);
		}

		for (Entry<Integer, Integer> entry : courseScore.entrySet()) {
			System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
		}
		
        int maxKey = 0;
        int maxValue = Integer.MIN_VALUE;

        for (Map.Entry<Integer, Integer> entry : courseScore.entrySet()) {
            int key = entry.getKey();
            int value = entry.getValue();
            if (value > maxValue) {
                maxValue = value;
                maxKey = key;
            }
        }

        System.out.println("가장 큰 값의 키: " + maxKey);
        
        int matchingTrip = maxKey;
        
        List<autoCourseVO> courseDetail = dao.importCourseDetail(matchingTrip);
        
        for(autoCourseVO course:courseDetail) {
        	System.out.println(course.getBc_course());
        	
        }
        
        
        PrintWriter out = response.getWriter();
        myCourseVO myCourseDetail = new myCourseVO();
        myCourseDetail.setUser_id(user_id);
        myCourseDetail.setMt_idx(mt_idx);//maxKey말고 마이투어 인덱스로 해야되는데 시퀀스로 생성된 걸 어떻게 가져오지?
        int cnt = 0;
        for(int i=0; i< courseDetail.size();i++) {
        	myCourseDetail.setDay_sche((i+1));
        	myCourseDetail.setMt_course(courseDetail.get(i).getBc_course());
        	System.out.println(myCourseDetail.toString());
        	cnt += dao.insertCourseDetail(myCourseDetail);
        }
        
        if(cnt==courseDetail.size()) {
        	//unique poi list
        	System.out.println("성공");
        	String res = gson.toJson(cnt);
        	out.print(res);
        }
        
        System.out.println(mt_idx);
        session.setAttribute("mt_idx", mt_idx);
		String targetUrl = "/loadScheduleCon"; // 대상 서블릿의 URL 경로

		// 리다이렉트할 URL을 생성합니다.
		String redirectUrl = response.encodeRedirectURL(request.getContextPath() + targetUrl);

		// 생성한 URL로 리다이렉트합니다.
//		response.sendRedirect(redirectUrl);
        
        
        //

		/*
		 * System.out.println(400001/100000);
		 * 
		 * List<Integer> POIsIdx = new ArrayList();
		 * 
		 * for(n7TourCourseVO course:PotentialMatches) { System.out.println("반복문"); int
		 * bc_idx = course.getBc_idx(); System.out.println("a"); List<autoCourseVO> POIs
		 * = dao.POIsInPotentialMatch(bc_idx); String POIsInTheCourse="";
		 * System.out.println("POIsInThECourse 생성 확인"); for(autoCourseVO poi:POIs) {
		 * System.out.println("반복문2"); //코스에 포함된 모든 장소 한 스트링에 담기 POIsInTheCourse +=
		 * "-"+poi.getBc_course();//다음 단계인 스플릿에서 '-' 를 구분자로 쓰게 담겨 있기 때문에 더해줌 }
		 * System.out.println("반복문2끝"); String[] POIsIdxStr =
		 * POIsInTheCourse.split("-");
		 * System.out.println("POIsIdxStr"+Arrays.toString(POIsIdxStr)); for(String p:
		 * POIsIdxStr) { System.out.println("반복문3"); if (!p.isEmpty()) { // 빈 문자열이 아닌
		 * 경우에만 변환하여 추가 POIsIdx.add(Integer.parseInt(p.trim())); } }
		 * System.out.println("반복문3 끝"); } System.out.println("반복문1끝");
		 * 
		 * 
		 * System.out.println("아싸"+POIsIdx);
		 * 
		 * //쇼핑 4, hotel 3, 레스토랑 2 poi 1
		 * 
		 * for(int p: POIsIdx) { System.out.println("반복문4"); if(p/100000 > 4) {
		 * System.out.println("쇼핑!"); Shopping.add(p); }else if(p/100000 > 3) {
		 * System.out.println("음식!"); Food.add(p); }else if(p/100000 > 2) {
		 * System.out.println("쇼핑!"); Sleep.add(p); }else if(p/100000 > 1) {
		 * System.out.println("쇼핑!"); Shopping.add(p); }else {
		 * System.out.println("Out Of Range"); } }
		 * 
		 * System.out.println(Shopping);
		 */
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
