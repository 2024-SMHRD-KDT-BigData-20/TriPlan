<%@page import="com.smhrd.model.PoiVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<style>
.container {
	display: flex;
	gap: 30px;
	/* flex-direction: row; */
	flex-wrap:wrap;
	position: relative;

	/* align-items: center; */
}

.name {
	text-align: justify;
	font-size: xx-large;
}

.list-group-item {
	flex-basis: 20%;
	background: white;
	padding: 20px;
	border-radius: 5px;
	min-width: 10vh;
 	width: 300px;" 
	display: flex;
	flex-direction: column;
}
 .thumbnail {

	width: 800px;
	height: 10px;
	margin-bottom: 20px;
	padding: 0px;
	border-radius: 20px;
} 

.thumbnail img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}
.title{
	font-size: 300px;
	
}



</style>
</head>
<body>
		<h1>나의 여행일정 목록</h1>
	<div class="container">
		<%      // 첫 번째 내부 리스트 생성 및 요소 추가
		        List<String> name = new ArrayList<>();
				name.add("제주도");
				name.add("순천");
				name.add("목포");

		        // 두 번째 내부 리스트 생성 및 요소 추가
		        List<String> dec = new ArrayList<>();
				dec.add("첫번째여행");
				dec.add("두번째여행");
				dec.add("세번째여행");


		        // 외부 리스트 생성 및 내부 리스트들 추가
		        List<List<String>> courseInfo = new ArrayList<>();
		        courseInfo.add(name);
		        courseInfo.add(dec);
		        System.out.println(courseInfo); 
		        System.out.println(courseInfo.get(1).get(1)); 
		        
		        
		        // 외부 리스트와 그 내용물 출력
		/*         System.out.println("courseInfo:");
		        for (List<String> innerList : courseInfo) {
		            System.out.println(courseInfo); */
			 for(int i = 0; i<courseInfo.size(); i++){ %>
					
		<div class="list-group-item">
		
		<%-- <%  for(int item : courseInfo.get(i)){ %> --%>
		
			<div id="thumbnail">
				<img alt="firstPlan" src="hotelImg/2-제주가좋아서 펜션.jpg"
					href="ScheduleMap.jsp">
			</div>
			<form action="loadScheduleCon" method="post">
			<!-- value값 수정해야함 -->
			<a class="name" type="submit"><%=courseInfo.get(0).get(i) %></a>
			<div class="dec"><%=courseInfo.get(1).get(i) %></div>
			</form>
			<!-- list닫는 태그 -->
		</div>
		<!-- container 닫는 태그 -->
		<!-- tlqkf -->
	
	<% }  %>
	<%-- <% } %> --%>
	</div>
	
		<form action="loadScheduleCon" method="post">
		<input name="mt_idx" value=30001>
		<button type="submit">나의 여행 더미 30001</button>
	</form> 
</body>
</html>