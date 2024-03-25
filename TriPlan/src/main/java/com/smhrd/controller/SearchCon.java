package com.smhrd.controller;

import javax.servlet.*;
import javax.servlet.http.*;

import com.smhrd.model.SearchVO;
import com.smhrd.model.SearchDAO;

import java.io.IOException;
import java.util.List;

public class SearchCon extends HttpServlet {
    private SearchDAO placeService = new SearchDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<SearchVO> searchResults = placeService.searchPlaces(keyword);

        request.setAttribute("searchResults", searchResults);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
        dispatcher.forward(request, response);
    }
}