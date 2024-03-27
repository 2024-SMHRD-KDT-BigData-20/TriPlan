package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.PoiVO;
import com.smhrd.model.courseDAO;

public class n11alterPlaceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[alterPlaceCon]");
		
		int poi_idx = Integer.parseInt(request.getParameter("poi_idx"));
		
		//poi 태그, 위도&경도 가져오기 - 스케쥴맵에서 받아오기?
		//다음 장소 위도&경도로 먼저 걸러오기
		int lat;
		int lng;
		//id나눈 몫에 따라 대조할 테이블 정하기
		//poi태그 스플릿한 태그 스트링 리스트에 담기
		//프리퍼런스 태그도 활용
		
		//태그 카운트 
		//대조할 테이블에서 위도 경도 범위 조건 걸고, 태그 카운트 높은 순으로 
		
		courseDAO dao = new courseDAO();
		//select * from _info where lat<(lat+0.02) and lat>(lat-0.02) and lng<(lng+0.02) and lng>(lng-0.02)
		
		//List<PoiVO> poiVO = dao.alterPlace(poi_idx);
		
		
		
	}

}
