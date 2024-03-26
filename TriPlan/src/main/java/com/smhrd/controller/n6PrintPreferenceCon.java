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
import com.smhrd.model.n3PreferenceVO;

public class n6PrintPreferenceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[PrintPreferenceConnnnnnn");
		//preference 정보 불러오기
		//조건문에 쓸 ID 세션에서 불러오기
		HttpSession session = request.getSession();
		n1UserVO loginUserVO = (n1UserVO)session.getAttribute("loginUserVO");
		
		String user_id = loginUserVO.getUser_id();
		
		//sql 작성: select * from user_preference where user_id = #{user_id}
		//Dao객체 생성 및 메서드 호출
		
		n1UserDAO dao = new n1UserDAO();
		
		n3PreferenceVO preference = dao.PreferenceToPrint(user_id);
		if(preference != null){
			session.setAttribute("userPreference", preference);
			response.sendRedirect("ConfirmPreference2.jsp");
		}
		
	}

}
