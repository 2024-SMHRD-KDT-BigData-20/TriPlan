package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.n1UserDAO;
import com.smhrd.model.n1UserVO;

public class n2LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//id, pw 불러와
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		//vo에 담기
		n1UserVO login = new n1UserVO(user_id,user_pw);
		
		//dao 객체 불러와
		
		n1UserDAO dao = new n1UserDAO();
		
		n1UserVO loginVO = dao.Login(login);
		
		//loginVO가 잘 불러와지면 loginVO session에 저장해 다음 페이지로, 안 되면 로그인 페이지로 돌아가기
	      if (loginVO!=null) {
	          // 성공
	          // 세션에 정보 저장
	          // Servlet에서는 세션 객체 생성 먼저!
	          HttpSession session = request.getSession();
	          session.setAttribute("loginVO", loginVO);
	          System.out.println("session세팅 완료");
	          response.sendRedirect("MyPage.jsp");
	       }else {
	          // 실패
	          System.out.println("로그인실패");
	       }
		
	
	}

}
