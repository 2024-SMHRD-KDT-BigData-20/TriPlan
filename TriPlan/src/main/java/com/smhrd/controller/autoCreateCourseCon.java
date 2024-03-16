package com.smhrd.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.autoCourseDAO;
import com.smhrd.model.autoCourseVO;

/**
 * Servlet implementation class autoCreateCourseCon
 */
public class autoCreateCourseCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[autoCreateCourseCon]");

		int courseID = Integer.parseInt(request.getParameter("courseID"));

		// 4-1. DAO 가서 회원가입 메소드 작성 DataAccessObject
		// 4-2. DAO 객체 생성
		autoCourseDAO cDao = new autoCourseDAO();
		List<autoCourseVO> courseDetail = cDao.importCourse(courseID);
		// 4-3. 
		//		autoCourseVO courseVO = cDao.importCourse(courseID);

		List<List<Integer>> allDayCourses = new ArrayList<>();
		for (int i = 0; i < courseDetail.size(); i++) {
		    String daily = courseDetail.get(i).getBc_course();
		    String[] dayCourseStr = daily.split("-");
		    
		    List<Integer> dayCourse = new ArrayList<>();
		    for (String str : dayCourseStr) {
		        dayCourse.add(Integer.parseInt(str));
		    }
		    
		    allDayCourses.add(dayCourse);
		}
		System.out.println(allDayCourses);
		request.getSession().setAttribute("allDayCourses", allDayCourses);
		response.sendRedirect("ScheduleMap.jsp");
	}

}
