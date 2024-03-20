package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.smhrd.model.PoiDAO;
import com.smhrd.model.PoiVO;


/**
 * Servlet implementation class POIServlet
 */
public class POIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 PoiDAO poiDAO = new PoiDAO();
	        
	        // 모든 POI 데이터 가져오기
	        List<PoiVO> poiList = poiDAO.getAllPOI();
	        
	        // 가져온 데이터를 request 속성에 저장
	        request.setAttribute("poiList", poiList);
	        
	        // 웹 페이지로 포워딩
	        request.getRequestDispatcher("/schedulemap.jsp").forward(request, response);
	}

}
