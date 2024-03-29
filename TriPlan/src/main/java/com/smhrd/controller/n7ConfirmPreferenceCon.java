package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n3PreferenceVO;
import com.smhrd.model.n5CreateScheduleVO;

public class n7ConfirmPreferenceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("[ConfirmPreferenceCON");
		
		HttpSession session = request.getSession();
		n5CreateScheduleVO schedule = (n5CreateScheduleVO)session.getAttribute("scheduleVO");
		//변수 받아오기
		n1UserVO loginMember = (n1UserVO)session.getAttribute("loginMember");
		String user_id = loginMember.getUser_id();
		String people = request.getParameter("question_1_1");
		String transportation = request.getParameter("question_1_2");
		String pace = request.getParameter("question_1_3");
		String[] pois = request.getParameterValues("question_2");
		String[] foods = request.getParameterValues("question_3");
		String[] sleeps = request.getParameterValues("question_4");
		
		String poi = "";
		String food = "";
		String sleep = "";
		
		for(String p: pois) {
			poi += "#" + p + " ";
		}
		for(String f: foods) {
			food += "#" + f + " ";
		}
		for(String s: sleeps) {
			sleep += "#" + s + " ";
		}
		
		//VO에 담기 - insert parameter로 활용
		n3PreferenceVO tripPreferenceVO = new n3PreferenceVO(user_id,people,transportation,pace,poi,food,sleep);
		
		//update user_preference values #{people}, #{transporation} #{pace}, #{poi}, #{food}, #{sleep}
		//Dao객체 생성 및 메서드로 업뎃 실행
		
		n1UserDAO dao = new n1UserDAO();
		int cnt = dao.confirmPreference(tripPreferenceVO);
		
		System.out.println();
		//세션...매 서블릿마다 불러와야 하나?
		if(cnt>0) {
		session.setAttribute("tripPreferenceVO", tripPreferenceVO);
		session.setAttribute("loginMember", loginMember);
		if(schedule!=null) {
		// 생성한 URL로 리다이렉트
		response.sendRedirect("loading.jsp");
		}else {
			response.sendRedirect("MyPage.jsp");
		}
		}else {
			System.out.println("스타일 업뎃 실패");
		}
		
	}

}
