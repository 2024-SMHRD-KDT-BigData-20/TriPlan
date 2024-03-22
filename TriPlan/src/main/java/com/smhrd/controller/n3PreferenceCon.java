package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n3PreferenceVO;

public class n3PreferenceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[n3PreferenceCon]");
		//인코딩
		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		
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
		n3PreferenceVO preferenceVO = new n3PreferenceVO(user_id,people,transportation,pace,poi,food,sleep);
				
		//세션...굳이 필요없을듯? select로 불러오기?
		
		session.setAttribute("PreferenceVO", preferenceVO);
		//Mapper에 sql
		//Dao로 실행
		n1UserDAO dao = new n1UserDAO();
		
		//테이블 생성 필요

		int cnt = dao.insertPreference(preferenceVO);
		
		System.out.println(cnt);
		
		System.out.println("확인"+preferenceVO.toString());
		response.sendRedirect("MyPage.jsp");
		
	
	}

}
