<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smhrd.model.SearchDAO, com.smhrd.model.SearchVO" %>
<html>
<head>
    <title>장소 검색</title>
</head>
<body>
<h2>장소 검색</h2>
<form action="SearchCon" method="get"> <!-- 'search.jsp'를 'SearchCon'으로 변경 -->
    <label for="keyword">검색어:</label>
    <input type="text" id="keyword" name="keyword" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
    <input type="submit" value="검색">
</form>

<%
String keyword = request.getParameter("keyword");
List<SearchVO> searchResults = (List<SearchVO>) request.getAttribute("searchResults");
%>

<% if (searchResults != null && !searchResults.isEmpty()) { %>
    <h3>검색 결과</h3>
    <ul>
        <% for (SearchVO place : searchResults) { %>
            <li><%= place.getName() %> - 태그: 
            <% for(String tag : place.getTags()) { %>
                <%= tag %><% if(!tag.equals(place.getTags().get(place.getTags().size() - 1))) { %>, <% } %>
            <% } %>
            </li>
        <% } %>
    </ul>
<% } else if (keyword != null && !keyword.isEmpty()) { %>
    <p>검색 결과가 없습니다.</p>
<% } %>
</body>
</html>