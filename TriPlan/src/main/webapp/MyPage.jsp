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
    <style>
        @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css");
@import url("https://fonts.cdnfonts.com/css/proxima-nova-condensed");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body, html {
  height: 100%; 
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

button {
  border: none;
  cursor: pointer;
}

.container{
  max-width: 1200px;
  margin: auto;
  padding: 10px;
}

.card-slider {
  display: flex;
  white-space: nowrap;
  overflow-x: auto;
  margin-top: 10px;
  gap: 30px;
  scroll-snap-type: x mandatory;
  -webkit-overflow-scrolling: touch;
}

.card-slider::-webkit-scrollbar {
  width: 0;
  height: 0;
}

.label-container {
  display: flex;
  align-items: center;
}


.label-container {
  display: flex;
  align-items: center;
}

.label-container h2 {
  color: #111;
  font-family: Poppins, serif;
  margin-right: auto;
  font-weight: 600;
}

.label-container .bi {
  font-size: 18px;
}

.label-container button {
  background-color: rgba(0, 0, 0, 0.1);
  border-radius: 20px;
  color: #111;
  cursor: pointer;
  padding: 10px;
  width: fit-content;
  margin-left: 5px;
}

.label-container button:disabled {
  background-color: whitesmoke;
  cursor: not-allowed;
  border: none;
}

.restaurant-card {
  transition: transform 0.3s ease-in-out;
  font-family: "Arial", sans-serif;
  background: transparent;
}

.restaurant-card:hover {
  cursor: pointer;
  transform: scale(0.95);
}

.image-container {
  position: relative;
  display: inline-block;
}

.image-container img {
  width: 350px;
  height: 240px;
  display: block;
  border-radius: 20px;
  object-fit: cover;
  image-rendering: pixelated;
}

.image-container::after {
    content: "";
    position: absolute;
    top: 80%;
    left: 0;
    right: 0;
    border: none;
    border-radius: 0 0 20px 20px;
    bottom: 0;
    background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 1)100%);
}

.discount-badge {
  position: absolute;
  color: #fff;
  bottom: 0;
  left: 10px;
  padding: 5px;
  z-index: 2;
  font-weight: bold;
  font-size: 24px;
  font-family: "Proxima Nova Condensed", sans-serif;
}

.restaurant-name {
  font-weight: bold;
  font-size: 24px;
  margin: 0;
}

.info-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 16px;
}

.rating {
  display: flex;
  align-items: start;
  margin-top: 5px;
  font-weight: semi-bold;
}

.review-count {
  margin-left: 5px;
  font-weight: semi-bold;
}

.delivery-info {
  display: flex;
  font-size: 16px;
  align-items: center;
}

.bi-star-fill {
  color: green;
}

.bi-dot {
  font-size: 26px;
}


@media only screen and (min-width: 320px) and (max-width: 767px) {

    .container {
        max-width: 350px;
        margin: auto;
        padding: 10px;
      }
      
      /* Card Slider */
      
      .label-container h2 {
        color: #111;
        font-family: Poppins, serif;
        margin-right: auto;
        font-size: 18px;
        font-weight: bold;
      }
      
      .label-container i {
        font-size: 14px;
      }
      
      /* Card Slider */
      
      /* Restaurant Card */
      .card-container {
        display: flex;
        flex-wrap: wrap;
        width: 100%;
        height: fit-content;
        gap: 10px;
        margin-top: 10px;
      }
      
       .image-container img {
        width: 180px;
        height: 140px;
        display: block;
        border-radius: 20px;
        object-fit: cover;
        image-rendering: pixelated;
      }
      
      .image-container::after {
        content: "";
        position: absolute;
        top: 80%;
        left: 0;
        right: 0;
        border: none;
        border-radius: 0 0 20px 20px;
        bottom: 0;
        background: linear-gradient(
          to bottom,
          rgba(0, 0, 0, 0) 0%,
          rgba(0, 0, 0, 0.8) 100%
        );
      }
      
      .discount-badge {
        position: absolute;
        color: #fff;
        bottom: 0;
        left: 10px;
        padding: 5px;
        z-index: 2;
        font-weight: bold;
        font-size: 12px;
        font-family: "Proxima Nova Condensed", sans-serif;
      }
      
      .restaurant-name {
        font-weight: bold;
        font-size: 16px;
        margin: 0;
      }
      
      .info-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 10px;
      }
      
      .rating {
        display: flex;
        align-items: start;
        margin-top: 3px;
        font-weight: semi-bold;
      }
      
      .review-count {
        margin-left: 3px;
        font-weight: semi-bold;
      }
      
      p{
        font-size: 10px;
      }
  
      .delivery-info {
        display: flex;
        font-size: 10px;
        align-items: center;
      }
      
      .bi-dot {
        font-size: 16px;
      }
      /* Restaurant Card */
}


@media (min-width: 576px) {
  .container {
    max-width: 540px;
  }
}

@media (min-width: 768px) {
  .container {
    max-width: 720px;
  }
}

@media (min-width: 992px) {
  .container {
    max-width: 960px;
  }
}

@media (min-width: 1200px) {
  .container {
    max-width: 1140px;
  }
}

@media (min-width: 1400px) {
  .container {
    max-width: 1320px;
  }
}

    </style>
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
          <h2><span class="">"최재민" <!-- user_info의 닉네임 -->님의</span> 여행일정 목록</h2> 
          <button class="" onclick="location.href='n5CreateSchedule.jsp'" type="button">새로운 일정 생성</button>
          <button class="restaurant-arrow-left"><i class="bi bi-arrow-left"></i></button>
          <button class="restaurant-arrow-right"><i class="bi bi-arrow-right"></i></button>
        </div>
        <div class="card-slider">

		    <% for(int i=0; i<courseResult.size(); i++){%>        
          <div class="restaurant-card">
              <div class="image-container">
                  <img src="shoppingImg/100-무기.jpg" alt="테스트">
                  <div class="discount-badge">D-day 3<!-- Dday = 현재 시간 - mt_st_dt  --></div>
              </div>
              <h3 class="restaurant-name"><%=courseResult.get(i).get(0) %> <!-- MyTripsVO : name --></h3>
              
              
              <!--info-container -->
              <div class="info-container">                 
                  <p><%=courseResult.get(i).get(2) %><!-- 여행설명 --></p>

              </div>
          </div>
          
          
          <%} %>
		<form action="loadScheduleCon" method="post">
		<input name="mt_idx" value=30001>
		<button type="submit">나의 여행 더미 30001</button>
	</form>
 
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