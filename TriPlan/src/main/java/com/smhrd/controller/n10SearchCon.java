package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.PoiVO;
import com.smhrd.model.courseDAO;

public class n10SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[SearchCon]");
		Gson gson = new Gson();
		String search = request.getParameter("search");
		System.out.println("search 확인: "+search);
		
		courseDAO dao = new courseDAO();
		List<PoiVO> searchResult = dao.search(search);
		System.out.println("확인:"+searchResult);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String res=gson.toJson(searchResult);
		System.out.println("결과 확인:"+res);
		out.print(res);
		
		
	}

}
