<%@page import="com.smhrd.model.n4MyTripsVO"%>
<%@page import="com.smhrd.model.n1UserVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.PoiVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="assets/css/MyPage.css">
    
<!--  	${loginUserVO.user_id}-->
<%System.out.println("[MyPage]");
List<n4MyTripsVO> MyTrips = (List<n4MyTripsVO>)session.getAttribute("myTrips"); 
n1UserVO userVO = (n1UserVO)session.getAttribute("loginUserVO");
System.out.println("MyTrips확인: "+MyTrips);
%>
</head>
<body>
		<%      
		
		List<String> courseInfo = new ArrayList<>();
		courseInfo.add("제주도 깔끼하네");
		courseInfo.add("첫번째 여행");
		courseInfo.add("제주도 여행입니다아아아아아");
		courseInfo.add("제주도");
		courseInfo.add("3박 4일");
		courseInfo.add("2024년-03월-22일");
		courseInfo.add("2024년-03월-25일");

		

				
		        List<List<String>> courseResult = new ArrayList<>();
		        for(int i=0; i<5; i++){
		        courseResult.add(courseInfo);
		        }
				System.out.println(courseResult.size());
				
				
				
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년-MM월-dd일");
				//Calendar now = Calendar.getInstance(); 
				Date startDate = sdf1.parse(courseInfo.get(5));
				Date endDate = sdf1.parse(courseInfo.get(6));
				Date now = new Date();
				long diffSec = (startDate.getTime() - now.getTime()) / 1000;
				long Dday = diffSec / (24*60*60);
					
				Calendar sd = Calendar.getInstance(); 
				Calendar ed = Calendar.getInstance(); 
				// Calendar Dday = Calendar.getInstance(); 
				
				String nowDate = sdf1.format(now.getTime());
				
				sd.setTime(startDate);
				ed.setTime(endDate);
				//cal1.add(Calendar.MONTH , cal2.get(Calendar.MONTH) + 1); // 월 더하기 - get(Calendar.MONTH)의 결과값이 0~11 이기 때문에 1을 더한다 
				//cal1.add(Calendar.DATE, cal2.get(Calendar.DATE)); // 일 더하기
				
				System.out.println("오늘날짜 : " + now);
				System.out.println("여행 시작날짜 : " + startDate);
				System.out.println("여행 마지막날짜 : " + endDate);
				System.out.println("연산시간 : " + Dday);
				/* String endDate = new SimpleDateFormat("yyyy-MM-dd").format(courseInfo.get(6));
				 */
		        
%>		     
				
    <div class="container">
        <div class="restaurant-container">
        <div class="label-container">
          <h2><span class=""><%=userVO.getUser_nick()%>님의</span> 여행일정 목록</h2> 
          <button class="" onclick="location.href='n5CreateSchedule.jsp'" type="button">새로운 일정 생성</button>
          <button class="restaurant-arrow-left"><i class="bi bi-arrow-left"></i></button>
          <button class="restaurant-arrow-right"><i class="bi bi-arrow-right"></i></button>
        </div>
        <div class="card-slider">

		    <% for(int i=0; i<MyTrips.size(); i++){%>     
		    <a href=loadScheduleCon?mt_idx=<%=MyTrips.get(i).getMt_idx()%>>   
          <div class="restaurant-card">
              <div class="image-container">
                  <img src="poiImgs/18-애월해안도로.jpg" alt="내 투어">
                  <div class="discount-badge">D-<%='x'%><!-- Dday = 현재 시간 - mt_st_dt  --></div>
              </div>
              <h3 class="restaurant-name"><%=MyTrips.get(i).getMt_name()%></h3>
              
              <!--info-container -->
<%--               <div class="info-container">                 
                  <p><%="여행 설명을 받은 적이 없는디"%></p>

              </div> --%>
          </div> 
          </a>         
          <%} %>
      <script>
        document.addEventListener("DOMContentLoaded", function () {
    const restaurantContainer = document.querySelector(".card-slider");
    const leftRButton = document.querySelector(".restaurant-arrow-left");
    const rightRButton = document.querySelector(".restaurant-arrow-right");
  
    function updateButtonState() {
      leftRButton.disabled = restaurantContainer.scrollLeft <= 0;
      rightRButton.disabled =
        restaurantContainer.scrollLeft + restaurantContainer.offsetWidth >=
        restaurantContainer.scrollWidth;
    }
  
    leftRButton.onclick = function () {
      restaurantContainer.scrollBy({
        left: -restaurantContainer.offsetWidth / 2,
        behavior: "smooth",
      });
    };
  
    rightRButton.onclick = function () {
      restaurantContainer.scrollBy({
        left: restaurantContainer.offsetWidth / 2,
        behavior: "smooth",
      });
    };
  
    restaurantContainer.addEventListener("scroll", updateButtonState);
    updateButtonState();
  });
      </script>
</body>
</html>