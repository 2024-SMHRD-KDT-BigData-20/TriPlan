<%@page import="com.smhrd.model.n7TourCourseVO"%>
<%@page import="com.smhrd.model.CourseBriefNDetailVO"%>
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
<link rel="stylesheet" href="navStyle.css">
<script src="https://kit.fontawesome.com/5366f35670.js" crossorigin="anonymous"></script>
<style type="text/css">

.cloudBackground{
  opacity: 0.5;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  position: absolute; 
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' style='margin:auto;background:%237aceff;display:block;z-index:1;position:relative' width='1440' height='1200' preserveAspectRatio='xMidYMid' viewBox='0 0 1440 1200'%3E%3Cg transform=''%3E%3Cg transform='translate(1348.44 656.766)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 656.7658733252151;1440 656.7658733252151' dur='1000s' repeatCount='indefinite' begin='-928.5396197453488s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23bddeff' transform='scale(1.31)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(1003.95 82.2574)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 82.25744745041163;1440 82.25744745041163' dur='1000s' repeatCount='indefinite' begin='-704.8486614428091s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23bddeff' transform='scale(1.31)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(1362.78 298.593)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 298.5927284673415;1440 298.5927284673415' dur='1000s' repeatCount='indefinite' begin='-937.8531963752952s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23bddeff' transform='scale(1.31)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(-79.8387 25.6018)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 25.601835455703004;1440 25.601835455703004' dur='500s' repeatCount='indefinite' begin='-994.5409426551965s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23ffffff' transform='scale(1.54)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(-94.0475 306.697)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 306.696526743258;1440 306.696526743258' dur='500s' repeatCount='indefinite' begin='-989.9277050705398s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23ffffff' transform='scale(1.54)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(1062.69 740.308)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 740.3075527649227;1440 740.3075527649227' dur='500s' repeatCount='indefinite' begin='-865.4903954633284s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23ffffff' transform='scale(1.54)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(299.249 65.7802)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 65.78019416043847;1440 65.78019416043847' dur='333.3333333333333s' repeatCount='indefinite' begin='-407.7459696307133s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23f1f2f3' transform='scale(1.77)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(972.038 1039.03)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 1039.0284866589266;1440 1039.0284866589266' dur='333.3333333333333s' repeatCount='indefinite' begin='-886.7045599125473s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23f1f2f3' transform='scale(1.77)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(996.115 67.7639)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 67.7639117712208;1440 67.7639117712208' dur='333.3333333333333s' repeatCount='indefinite' begin='-558.5827166190247s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23f1f2f3' transform='scale(1.77)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(610.802 551.707)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 551.7067758712957;1440 551.7067758712957' dur='250s' repeatCount='indefinite' begin='-603.3849595526771s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23bddeff' transform='scale(2)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(188.233 631.08)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 631.0801920078885;1440 631.0801920078885' dur='250s' repeatCount='indefinite' begin='-784.7861727902692s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23bddeff' transform='scale(2)'%3E%3C/path%3E%3C/g%3E%3Cg transform='translate(809.044 781.176)'%3E%3CanimateTransform attributeName='transform' type='translate' keyTimes='0;1' values='-100 781.1763704177683;1440 781.1763704177683' dur='250s' repeatCount='indefinite' begin='-635.5671233696152s'%3E%3C/animateTransform%3E%3Cpath d='M84.717,33.597c0.791-2.503,1.186-5.138,1.186-7.773C85.903,11.594,74.308,0,60.079,0 c-9.881,0-18.445,5.534-22.793,13.702c-1.581-0.527-3.426-0.791-5.138-0.791c-9.486,0-17.128,7.642-17.128,17.128 c0,1.186,0.132,2.372,0.395,3.426C6.719,34.783,0,42.424,0,51.515C0,61.66,8.169,69.829,18.314,69.829h63.373 C91.831,69.829,100,61.66,100,51.515C99.868,42.556,93.281,35.046,84.717,33.597z' fill='%23bddeff' transform='scale(2)'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
  background-attachment: fixed;
}
</style>  
<!--  	${loginUserVO.user_id}-->
<%System.out.println("[MyPage]");
List<n4MyTripsVO> MyTrips = (List<n4MyTripsVO>)session.getAttribute("myTrips"); 
n1UserVO userVO = (n1UserVO)session.getAttribute("loginUserVO");
System.out.println("MyTrips확인: "+MyTrips);
List<n7TourCourseVO> sampleTrips = (List<n7TourCourseVO>)session.getAttribute("sampleTrips");
System.out.println("SampleTrips확인: "+sampleTrips);
SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");


%>
</head>
<body>
		<div class="navbar">
			<div class="navbar___logo">
				 <img alt="Logo" src="Triplan.png" style="height: 100%;">
			</div>
			<ul class="navbar___menu">
				<li><a href="MyPage.jsp">홈</a></li>
				<li><a href="ConfirmPreference2.jsp">내 여행프로필</a></li>
				<li><a href="n5CreateSchedule.jsp">일정생성</a></li>
			</ul>

			<ul>
				<li><a href="LogOutCon">로그아웃</a></li>
			</ul>
		</div>    
<!-- <div class="cloudBackground"> -->
<%-- <%if(MyTrips.size()>0){%> --%>
<%if(MyTrips != null && MyTrips.size() > 0){%>
    <div class="container">
        <div class="restaurant-container">
        <div class="label-container">
          <h2><span class=""><%=userVO.getUser_nick()%>님의</span> 여행일정 목록</h2> 
          <button class="" onclick="location.href='n5CreateSchedule.jsp'" type="button">새로운 일정 생성</button>
          <button class="restaurant-arrow-left"><i class="bi bi-arrow-left"></i></button>
          <button class="restaurant-arrow-right"><i class="bi bi-arrow-right"></i></button>
        </div>
        <div class="card-slider">

		    		    
		    <%for(int i=0; i<MyTrips.size(); i++){%>     
		    <a href=loadScheduleCon?mt_idx=<%=MyTrips.get(i).getMt_idx()%>>   
          <div class="restaurant-card">
              <div class="image-container">
                  <img src="CourseImg/<%=MyTrips.get(i).getMt_img()%>" alt="내 투어">
                  <%Date startDate = dates.parse(MyTrips.get(i).getMt_st_dt());
					Date endDate = dates.parse(MyTrips.get(i).getMt_ed_dt());
					Date now = new Date();
					long diffSec = (startDate.getTime() - now.getTime()) / 1000;
					double diffDays = (double) diffSec / (60 * 60 * 24);
				    long Dday = (long) Math.ceil(diffDays);
					System.out.println(diffSec);
					System.out.println("나눔"+(long)(diffSec/(24*60*60)));
					System.out.println((24*60*60));
					 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd E");
					%>
                  <div class="discount-badge">D-<%=Dday%><!-- Dday = 현재 시간 - mt_st_dt  --></div>
              </div>
              <h3 class="restaurant-name"><%=MyTrips.get(i).getMt_name()%></h3>
              
              <!--info-container -->
               <div class="info-container">                 
                  <p>여행 시작일 <%=sdf.format(startDate)%></p>
                  <p>여행 종료일 <%=sdf.format(endDate)%></p>

              </div>
          </div> 
          </a>         
          <%}
		   }else{
		   %>
		       <div class="container">
        <div class="restaurant-container">
        <div class="label-container">
          <h2><span class=""><%=userVO.getUser_nick()%>님</span> 여행 계획을 둘러보고 첫 여행을 만들어보세요</h2> 
          <button class="" onclick="location.href='n5CreateSchedule.jsp'" type="button">새로운 일정 생성</button>
          <button class="restaurant-arrow-left"><i class="bi bi-arrow-left"></i></button>
          <button class="restaurant-arrow-right"><i class="bi bi-arrow-right"></i></button>
        </div>
        <div class="card-slider">
        <%for(n7TourCourseVO trip:sampleTrips){ %>
		   <a href=sampleScheduleMap.jsp>
		             <div class="restaurant-card">
              <div class="image-container">
                  <img src="CourseImg/<%=trip.getBc_img()%>" alt="여행을 생성해보세요">
                  <div class="discount-badge"><!-- Dday = 현재 시간 - mt_st_dt  --></div>
              </div>
              <h3 class="restaurant-name"><%=trip.getBc_name()%></h3>
              
              <!--info-container -->
               <div class="info-container">                 
				<%=trip.getBc_period()%>일
              </div>
          </div> 
          </a>
          <%}
			} %>
<!-- 		   </div> -->
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