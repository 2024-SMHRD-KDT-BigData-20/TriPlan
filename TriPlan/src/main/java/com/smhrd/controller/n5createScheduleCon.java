package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.autoCourseVO;
import com.smhrd.model.courseDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n5CreateScheduleVO;
import com.smhrd.model.autoCourseVO;

/**
 * Servlet implementation class createScheduelCon
 */
public class n5createScheduleCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[createScheduleCon]");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		n1UserVO loginUserVO = (n1UserVO)session.getAttribute("loginUserVO");
		String user_id = loginUserVO.getUser_id();		
		String mt_name = request.getParameter("mt_name"); 
		String mt_preference = request.getParameter("mt_preference");
		int mt_headcount = Integer.parseInt(request.getParameter("mt_headcount"));
		String mt_st_dt = request.getParameter("mt_st_dt");
		String mt_ed_dt = request.getParameter("mt_ed_dt");
		String mt_select = request.getParameter("mt_select");
		
		courseDAO cDao = new courseDAO();
		n5CreateScheduleVO ScheduleVO = new n5CreateScheduleVO(mt_name,user_id,mt_st_dt,mt_ed_dt);
		int cntMySchedule = cDao.createSchedule(ScheduleVO);
		List<autoCourseVO> courseDetail =null;
		courseDetail = cDao.importCourse(Integer.parseInt(mt_select));
		System.out.println("코스 디테일");
		System.out.println(courseDetail);
		
		for(int i = 0; i< courseDetail.size();i++) {
			int d_sche_idx = 40001+i;
			int day = i+1;
			String dayCourse = courseDetail.get(i).getBc_course();
			
			n5CreateScheduleVO dailyVO = new n5CreateScheduleVO(d_sche_idx,mt_idx,day,dayCourse);
			System.out.println("VO: "+dailyVO.toString());
			cDao.createDaily(dailyVO);
		}
		
		// 현재 서블릿에서 리다이렉트할 서블릿의 URL 경로를 지정합니다.
		String targetUrl = "/n6PrintPreferenceCon"; // 대상 서블릿의 URL 경로

		// 리다이렉트할 서블릿에 요청을 전달하기 위해 RequestDispatcher를 얻습니다.
		RequestDispatcher dispatcher = request.getRequestDispatcher(targetUrl);

		// 전달할 요청이 있을 경우, 해당 요청 객체를 생성합니다.
		// 예를 들어, 다른 서블릿으로 전달할 데이터를 request 속성(attribute)에 저장할 수 있습니다.
		request.setAttribute("mt_idx", mt_idx);
		request.setAttribute("scheduleVO", ScheduleVO);
		// 요청을 전달하고 해당 서블릿으로 리다이렉트합니다.
		dispatcher.forward(request, response);
		
	}

}
