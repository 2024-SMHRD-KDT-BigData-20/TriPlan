package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n3PreferenceVO;

public class n7ConfirmPreferenceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		//변수 받아오기
		int people = Integer.parseInt(request.getParameter("people"));
		String transportation = request.getParameter("transportation");
		String pace = request.getParameter("pace");
		String poi = request.getParameter("poi");
		String food = request.getParameter("food");
		String sleep = request.getParameter("sleep");
		
		//VO에 담기 - insert parameter로 활용
		n3PreferenceVO tripPreferenceVO = new n3PreferenceVO(people,transportation,pace,poi,food,sleep);
		
		//update user_preference values #{people}, #{transporation} #{pace}, #{poi}, #{food}, #{sleep}
		//Dao객체 생성 및 메서드로 업뎃 실행
		
		n1UserDAO dao = new n1UserDAO();
		/* int cnt = dao.confirmPreference(tripPreferenceVO); */
		int cnt = 1;
		
		//세션...매 서블릿마다 불러와야 하나?
		if(cnt>0) {
		HttpSession session = request.getSession();
		session.setAttribute("tripPreferenceVO", tripPreferenceVO);
		
		String targetUrl = "/n7FindMatchingTripCon"; // 대상 서블릿의 URL 경로

		// 리다이렉트할 URL을 생성
		String redirectUrl = response.encodeRedirectURL(request.getContextPath() + targetUrl);

		// 생성한 URL로 리다이렉트
		response.sendRedirect(redirectUrl);
		}else {
			System.out.println("스타일 업뎃 실패");
		}
		
	}

}
