package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CourseBriefNDetailVO;
import com.smhrd.model.courseDAO;
import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n4MyTripsVO;
import com.smhrd.model.n7TourCourseVO;

public class n4MyTripsCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[MyTripsCon]");
		HttpSession session = request.getSession();
		n1UserVO loginUserVO = (n1UserVO)session.getAttribute("loginUserVO");
		System.out.println(loginUserVO);
		
		String user_id = loginUserVO.getUser_id();
		System.out.println("아이디 확인: "+user_id);
		courseDAO dao = new courseDAO();
		
		List<n4MyTripsVO> myTrips = dao.MyTrips(user_id);
		if(myTrips.size() >0) {
		session.setAttribute("myTrips", myTrips);
		System.out.println(myTrips);
		System.out.println("세션 확인" + session.getAttribute("myTrips"));
		}else {
			List<n7TourCourseVO> sampleTrips = dao.SampleTrips();
			System.out.println("샘플 확인 1 " + sampleTrips.size());
			/*
			 * List<Integer> Trips = new ArrayList<>(); for(n7TourCourseVO trip:
			 * sampleTrips) { Trips.add(trip.getBc_idx()); System.out.println(Trips.size());
			 * } List<CourseBriefNDetailVO> sampleTripDetails =
			 * dao.SampleTripDetails(Trips);
			 */
			System.out.println("샘플 확인: "+sampleTrips.size()+"개 " + sampleTrips);
			session.setAttribute("sampleTrips", sampleTrips);
		}
		response.sendRedirect("MyPage.jsp");
		
	}

}
