package com.smhrd.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.courseDAO;
import com.smhrd.model.myCourseVO;
import com.smhrd.model.n5CreateScheduleVO;
import com.smhrd.model.PoiVO;
import com.smhrd.model.autoCourseVO;

/**
 * Servlet implementation class autoCreateCourseCon
 */
public class loadScheduleCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[loadScheduleCon]");
		HttpSession session = request.getSession();
		int mt_idx;
		System.out.println(session.getAttribute("mt_idx"));
		if(session.getAttribute("mt_idx")!=null) {//findMatchingTrip에서 오는 경우
		mt_idx = (int) session.getAttribute("mt_idx");
		}else {//MyPage에서 오는 경우
			mt_idx=218;
			/* mt_idx = Integer.parseInt(request.getParameter("mt_idx")); */
		}

		System.out.println("mt_idx" + mt_idx);
		// 4-1. DAO 가서 회원가입 메소드 작성 DataAccessObject
		// 4-2. DAO 객체 생성
		courseDAO cDao = new courseDAO();
		List<myCourseVO> myCourse = cDao.loadMyCourse(mt_idx);
		System.out.println("왜 null이야?" + myCourse);
		//장소 순서대로 (스플릿 결과) int idx 리스트 담을 리스트
		List<List<Integer>> intMyCourses = new ArrayList<>();
		
		
		Set<Integer> allPlaces = new HashSet<>();
		//코스에 속한 장소들 형변환해서 리스트에 담기
		for (int i = 0; i < myCourse.size(); i++) {
		    String daily = myCourse.get(i).getMt_course();
		    String[] dayCourseStr = daily.split("-");
		    List<Integer> dayCourse = new ArrayList<>();
		    for (String place : dayCourseStr) {
		    	int poi_idx = Integer.parseInt(place);
		        dayCourse.add(poi_idx);
		        allPlaces.add(poi_idx);
		    }		    
		    intMyCourses.add(dayCourse);
		}
		
		List<Integer> uniquePlaces = new ArrayList<>(allPlaces);
		
		List<PoiVO> myUniquePOI = new ArrayList<>();
		
		/*
		 * List<n5CreateScheduleVO> myCourseDetail = null; myCourseDetail =
		 * cDao.importMyCourse(mt_idx); //대체 왜 16개가 나오는지 모르겠음? 전체 4행인데?
		 * System.out.println("크기"+myCourseDetail.size());
		 * System.out.println(myCourseDetail.toString());
		 * 
		 * 
		 * 
		 * 
		 * // 4-3. // autoCourseVO courseVO = cDao.importCourse(courseID);
		 * 
		 * List<List<Integer>> allDayCourses = new ArrayList<>(); Set<Integer> allPlaces
		 * = new HashSet<>(); for (int i = 0; i < myCourseDetail.size(); i++) { String
		 * daily = myCourseDetail.get(i).getMt_course(); String[] dayCourseStr =
		 * daily.split("-"); List<Integer> dayCourse = new ArrayList<>(); for (String
		 * place : dayCourseStr) { int poi_idx = Integer.parseInt(place);
		 * dayCourse.add(poi_idx); allPlaces.add(poi_idx); }
		 * allDayCourses.add(dayCourse); }
		 * 
		 * List<Integer> uniquePlaces = new ArrayList<>(allPlaces);
		 * 
		 * 
		 *  */
		for (Integer poiIdx : uniquePlaces) { // POIINFOTEST 테이블에서 해당 장소 정보를 가져오는 메서드를 호출합니다. 
			PoiVO poiInfo = cDao.myCoursePOI(poiIdx); 
			if (poiInfo != null) {
				myUniquePOI.add(poiInfo); } }
		 
		 
		System.out.println(myUniquePOI);
		
		
		System.out.println(intMyCourses);
		session.setAttribute("mt_idx", mt_idx);
		session.setAttribute("allDayCourses", intMyCourses);
		session.setAttribute("myUniquePOI", myUniquePOI);
		response.sendRedirect("ScheduleMap.jsp");
	}

}
