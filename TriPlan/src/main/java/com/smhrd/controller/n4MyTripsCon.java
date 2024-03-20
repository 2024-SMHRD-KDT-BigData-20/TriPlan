package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;
import com.smhrd.model.n4MyTripsVO;

public class n4MyTripsCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		n1UserVO loginUserVO = (n1UserVO)session.getAttribute("loginUserVO");
		System.out.println(loginUserVO);
		
		String user_id = loginUserVO.getUser_id();
		
		n1UserDAO dao = new n1UserDAO();
		
		List<n4MyTripsVO> myTrips = dao.MyTrips(user_id);
		
		session.setAttribute("myTrips", myTrips);
		
		response.sendRedirect("MyPage.jsp");
		
	}

}
