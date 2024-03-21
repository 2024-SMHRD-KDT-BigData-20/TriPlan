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

		int mt_idx = Integer.parseInt(request.getParameter("mt_idx"));
		System.out.println("mt_idx" + mt_idx);
		// 4-1. DAO 가서 회원가입 메소드 작성 DataAccessObject
		// 4-2. DAO 객체 생성
		courseDAO cDao = new courseDAO();
		List<n5CreateScheduleVO> myCourseDetail = null;
		myCourseDetail = cDao.importMyCourse(mt_idx);
		//대체 왜 16개가 나오는지 모르겠음? 전체 4행인데?
		System.out.println("크기"+myCourseDetail.size());
		System.out.println(myCourseDetail.toString());
		

		

		// 4-3. 
		//		autoCourseVO courseVO = cDao.importCourse(courseID);
		
		List<List<Integer>> allDayCourses = new ArrayList<>();
		Set<Integer> allPlaces = new HashSet<>();
		for (int i = 0; i < myCourseDetail.size(); i++) {
		    String daily = myCourseDetail.get(i).getMt_course();
		    String[] dayCourseStr = daily.split("-");
		    List<Integer> dayCourse = new ArrayList<>();
		    for (String place : dayCourseStr) {
		    	int poi_idx = Integer.parseInt(place);
		        dayCourse.add(poi_idx);
		        allPlaces.add(poi_idx);
		    }		    
		    allDayCourses.add(dayCourse);
		}
		
		List<Integer> uniquePlaces = new ArrayList<>(allPlaces);
		
		List<PoiVO> myUniquePOI = new ArrayList<>();
		
		for (Integer poiIdx : uniquePlaces) {
		    // POIINFOTEST 테이블에서 해당 장소 정보를 가져오는 메서드를 호출합니다.
			PoiVO poiInfo = cDao.myCoursePOI(poiIdx);
		    if (poiInfo != null) {
		    	myUniquePOI.add(poiInfo);
		    }
		}

		
		System.out.println(myUniquePOI);
		
		System.out.println(allDayCourses);
		request.getSession().setAttribute("allDayCourses", allDayCourses);
		request.setAttribute("myUniquePOI", myUniquePOI);
		request.getRequestDispatcher("ScheduleMap.jsp").forward(request, response);
	}

}
