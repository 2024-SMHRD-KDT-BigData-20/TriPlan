package com.smhrd.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class n14UpdateScheduleCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[UpdateScheduleCon]");

		/* String schedule = request.getParameter("updatedSchedule"); */
		/*
		 * ObjectMapper objectMapper = new ObjectMapper(); List<List<String>> schedule =
		 * objectMapper.readValue(request.getInputStream(), new
		 * TypeReference<List<List<String>>>(){});
		 */
		Gson gson =  new Gson();
		String[][] res = gson.fromJson(request.getParameter("updatedSchedule"), String[][].class);
		
		System.out.println("res확인" + res);
		System.out.println("ArraysRes확인" + Arrays.deepToString(res));
		System.out.println("ArraysRes res[3]확인" + Arrays.deepToString(res[3]));
		System.out.println("result00 "+res[0][0]);
		
		String s = "[[\"10001\"],[\"10002\",\"10003\",\"10004\"],[\"10005\",\"10006\"],[\"10007\",\"10008\",\"10009\",\"10001\"]]";
		String ss = s.substring(1, s.length() - 1);
		System.out.println("ss확인"+ss);
		String[] str = ss.split("\\[|\\]");
		
		System.out.println(str);
		
		/*
		 * ObjectMapper objectMapper = new ObjectMapper();
		 * 
		 * List<List<Integer>> resultList = objectMapper.readValue(s, new
		 * TypeReference<List<List<Integer>>>(){});
		 * 
		 * System.out.println("리스트 확인" + resultList.get(0));
		 */
		 

		
		
		
		

	}

}
