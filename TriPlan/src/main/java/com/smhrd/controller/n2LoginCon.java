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
		//id, pw 불러와
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		//vo에 담기
		n1UserVO login = new n1UserVO(user_id,user_pw);

		//dao 객체 불러와

		n1UserDAO dao = new n1UserDAO();

		n1UserVO loginUserVO = dao.Login(login);
		
		System.out.println("확인" +dao.PrefIdx(user_id).toString());

		//loginVO가 잘 불러와지면 loginVO session에 저장해 다음 페이지로, 안 되면 로그인 페이지로 돌아가기
		if (loginUserVO!=null) {
			// 현재 서블릿에서 리다이렉트할 서블릿의 URL 경로를 지정합니다.
			//	  		String targetUrl = "/n4MyTripsCon"; // 대상 서블릿의 URL 경로
			//
			//	  		// 리다이렉트할 서블릿에 요청을 전달하기 위해 RequestDispatcher를 얻습니다.
			//	  		RequestDispatcher dispatcher = request.getRequestDispatcher(targetUrl);
			//
			//	  		// 전달할 요청이 있을 경우, 해당 요청 객체를 생성합니다.
			//	  		// 예를 들어, 다른 서블릿으로 전달할 데이터를 request 속성(attribute)에 저장할 수 있습니다.
			//	  		request.setAttribute("loginUserVO", loginUserVO);
			//	  		// 요청을 전달하고 해당 서블릿으로 리다이렉트합니다.
			//	  		dispatcher.forward(request, response);

			HttpSession session = request.getSession();
			session.setAttribute("loginUserVO", loginUserVO);
			System.out.println("session세팅 완료");

			String targetUrl = "/n4MyTripsCon"; // 대상 서블릿의 URL 경로

			// 리다이렉트할 URL을 생성합니다.
			String redirectUrl = response.encodeRedirectURL(request.getContextPath() + targetUrl);

			// 생성한 URL로 리다이렉트합니다.
			response.sendRedirect(redirectUrl);


			// 성공
			// 세션에 정보 저장
			// Servlet에서는 세션 객체 생성 먼저!

//			response.sendRedirect("/n4MyTripsCon");  
			
			
			
		}else {
			
			// 실패
			System.out.println("로그인실패");
		}


	}

}
