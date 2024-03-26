package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		//id, pw 불러와서
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		//vo에 담기
		n1UserVO login = new n1UserVO(user_id,user_pw);

		//dao 객체 불러와서

		n1UserDAO dao = new n1UserDAO();

		n1UserVO loginUserVO = dao.Login(login);
		
		System.out.println("확인" +dao.PrefIdx(user_id).toString());
		HttpSession session = request.getSession();
		//loginVO가 잘 불러와지면 loginVO session에 저장해 다음 페이지로, 안 되면 로그인 페이지로 돌아가기
		if (loginUserVO!=null) {
			session.setAttribute("loginUserVO", loginUserVO);
			
			System.out.println("session세팅 완료");
			
			//Servlet으로 전달하려니 url 변환이 필요한 것 같음...?
			String targetUrl = "/n4MyTripsCon"; // 대상 서블릿의 URL 경로
			// 리다이렉트할 URL 생성.
			String redirectUrl = response.encodeRedirectURL(request.getContextPath() + targetUrl);
			// 생성한 URL로 리다이렉트
			response.sendRedirect(redirectUrl);
			
			
			
		}else {
			
			// 실패
			System.out.println("로그인실패");
			request.setAttribute("LoginResult", 0);
			response.sendRedirect("n1_JoinLogin.jsp");
		}


	}

}
