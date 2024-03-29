<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateSchedule</title>
<link rel="stylesheet" href="navStyle.css">
<script src="https://kit.fontawesome.com/5366f35670.js" crossorigin="anonymous"></script>
<style>
		body {
        text-align: center;
        background: #FFFFFF;
        }
        input {
        border: 2px solid #65553B;
        border-radius: 20px;
        padding: 12px 10px;
        text-align: center;
        width: 250px;
        margin-bottom: 20px;
        }
        button {
        border: none;
        border-radius: 3px;
        padding: 12px 10px;
        text-align: center;
        cursor: pointer;
        background: #B0A591;
        color: whitesmoke;
        }
</style>
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

			<ul class="navbar___menu">
				<li><a href="LogOutCon">로그아웃</a></li>
			</ul>
		</div>
	<head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/dark.css">
      </head>
	<body>
        <h1>새로운 일정 생성</h1>
        <hr>
        <div>
        <form action ="n5CreateScheduleCon" method = "post">
          <h2>가는날</h2>
          <input type="text" id="go" name = "mt_st_dt" placeholder="날짜를 선택해주세요" data-input>
      
          <h2>오는날</h2>
          <input type="text" id="come" name = "mt_ed_dt" placeholder="날짜를 선택해주세요" data-input>
            
          <h2>여행 제목</h2>
          <input type="text" id="travel_title" name = "mt_name" placeholder="여행제목을 입력해주세요" required>
        </div>
        <button id="next">next</button>
        </form>
      </div>
        
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--  Flatpickr 캘린더  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
      </body>

      <script>
        $("#go").flatpickr({
        dateFormat: "Y-m-d"
        });

        $("#come").flatpickr({
        dateFormat: "Y-m-d"
        });
    </script>
</body>
</html>