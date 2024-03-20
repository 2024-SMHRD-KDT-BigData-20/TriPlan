package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n3PreferenceVO;

public class n3PreferenceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("UTF-8");
		
		//변수 받아오기
		int people = Integer.parseInt(request.getParameter("people"));
		String transportation = request.getParameter("transportation");
		String pace = request.getParameter("pace");
		String poi = request.getParameter("poi");
		String food = request.getParameter("food");
		String sleep = request.getParameter("sleep");
		
		//VO에 담기 - insert parameter로 활용
		n3PreferenceVO preferenceVO = new n3PreferenceVO(people,transportation,pace,poi,food,sleep);
		//Mapper에 sql
		//Dao로 실행
		n1UserDAO dao = new n1UserDAO();
		int cnt = dao.insertPreference(preferenceVO);
		
		System.out.println(cnt);
		
	
	}

}
