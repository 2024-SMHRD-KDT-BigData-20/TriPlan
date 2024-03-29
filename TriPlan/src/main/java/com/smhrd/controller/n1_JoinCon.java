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

import oracle.sql.DATE;

public class n1_JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		String  user_gender = request.getParameter("user_gender");
		String  birthDay = request.getParameter("birthDay");
		String  birthMonth = request.getParameter("birthMonth");
		String  birthYear = request.getParameter("birthYear");
		String birthday = birthYear+birthMonth+birthDay;
		//String  user_birthdate = request.getParameter(user_birthdate);//타입 변환 어떻게 할지!!
		String user_nick = request.getParameter("user_nick");
		//String user_role = request.getParameter(user_role);
			
//		2. 받아온 값 UserVO객체에 담아주기
		n1UserVO joinUser = new n1UserVO(user_id,user_pw,user_name,user_email,user_gender,birthday,user_nick);
		System.out.println(joinUser.toString());
		
		// 3. UserMapper.xml에 sql문 작성 - 완료
		
		// 4-1. UserDAO 메소드 작성
		// 4-2. DAO 객체 생성
		n1UserDAO dao = new n1UserDAO();
		// 4-3. Join 메소드 호출
		int cnt = dao.Join(joinUser);
		System.out.println(cnt);
		
		//5. 명령 후 처리
		//회원가입 성공 => n2Preference.jsp
		//회원가입 실패 => n1LoginJoin.jsp
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", joinUser);
		session.setAttribute("loginUserVO", joinUser);
		request.setAttribute("JoinResult",cnt);
		if(cnt>0) {
			//성공
			//회원 가입 축하드립니다. ooo님 : request에 담아서 forward 방식 이동
//			request.setAttribute("loginVO", joinUser);
			response.sendRedirect("n3Preference.jsp");
//			RequestDispatcher rd = request.getRequestDispatcher("n2Preference.jsp");
//			rd.forward(request, response);
		}else {
			//실패
			System.out.println("가입 실패");
			response.sendRedirect("n1_loginJoin.jsp");			
		}

	
	}

}
