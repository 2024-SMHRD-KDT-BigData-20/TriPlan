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
import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n5CreateScheduleVO;
import com.smhrd.model.autoCourseVO;

public class n5CreateScheduleCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[createScheduleCon]");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		n1UserVO loginUserVO = (n1UserVO)session.getAttribute("loginUserVO");
			
			
			String user_id = loginUserVO.getUser_id();		
			String mt_name = request.getParameter("mt_name"); 
			n1UserDAO dao = new n1UserDAO();
			
			System.out.println("ㅇㄹ 어디야");
			int mt_preference = dao.PrefIdx(user_id).getPf_idx();
			/*
			 * String mt_preference = request.getParameter("mt_preference"); int
			 * mt_headcount = Integer.parseInt(request.getParameter("mt_headcount"));
			 */
			String mt_st_dt = request.getParameter("mt_st_dt");
			String mt_ed_dt = request.getParameter("mt_ed_dt");
			/* String mt_select = request.getParameter("mt_select"); */
			
			courseDAO cDao = new courseDAO();
			n5CreateScheduleVO ScheduleVO = new n5CreateScheduleVO(mt_name,mt_preference,user_id,mt_st_dt,mt_ed_dt);
			int cntMySchedule = cDao.createSchedule(ScheduleVO);
			
			System.out.println(ScheduleVO.toString());
			
			
			
			/*
			 * List<autoCourseVO> courseDetail =null; 
			 * courseDetail = cDao.importCourse(Integer.parseInt(mt_select)); System.out.println("코스 디테일");
			 * System.out.println(courseDetail);
			 * 
			 * for(int i = 0; i< courseDetail.size();i++) { int d_sche_idx = 40001+i; int
			 * day = i+1; String dayCourse = courseDetail.get(i).getBc_course();
			 * 
			 * n5CreateScheduleVO dailyVO = new
			 * n5CreateScheduleVO(d_sche_idx,mt_idx,day,dayCourse);
			 * System.out.println("VO: "+dailyVO.toString()); cDao.createDaily(dailyVO); }
			 */
			
			// 현재 서블릿에서 리다이렉트할 서블릿의 URL 경로를 지정합니다.

			session.setAttribute("scheduleVO", ScheduleVO);
//			String targetUrl = "/n6PrintPreferenceCon"; // 대상 서블릿의 URL 경로
			String targetUrl = "/n8FindMatchingTripCon";
			// 리다이렉트할 URL을 생성합니다.
			String redirectUrl = response.encodeRedirectURL(request.getContextPath() + targetUrl);

			// 생성한 URL로 리다이렉트합니다.
			response.sendRedirect(redirectUrl);
		
	}

}
